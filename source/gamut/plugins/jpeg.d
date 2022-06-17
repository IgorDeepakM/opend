/**
JPEG support.

Copyright: Copyright Guillaume Piolat 2022
License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
*/
module gamut.plugins.jpeg;

nothrow @nogc @safe:

import core.stdc.stdlib: malloc, free, realloc;
import gamut.types;
import gamut.image;
import gamut.io;
import gamut.plugin;
import gamut.codecs.jpegload;
import gamut.codecs.stb_image_write;
import gamut.internals.errors;


ImageFormatPlugin makeJPEGPlugin()
{
    ImageFormatPlugin p;
    p.format = "JPEG";
    p.extensionList = "jpg,jpeg,jif,jfif";
    p.mimeTypes = "image/jpeg";
    version(decodeJPEG)
        p.loadProc = &Load_JPEG;
    else
        p.loadProc = null;
    version(encodeJPEG)
        p.saveProc = &Save_JPEG;
    else
        p.saveProc = null;
    p.detectProc = &Validate_JPEG;
    return p;
}


version(decodeJPEG)
void Load_JPEG(ref Image image, IOStream *io, IOHandle handle, int page, int flags, void *data) @trusted
{
    JPEGIOHandle jio;
    jio.wrapped = io;
    jio.handle = handle;

    int requestedComp = computeRequestedImageComponents(flags);
    if (requestedComp == 0)
    {
        image.error(kStrInvalidFlags);
        return;
    }

    int width, height, actualComp;
    ubyte[] decoded = decompress_jpeg_image_from_stream(&stream_read_jpeg, &jio, width, height, actualComp, requestedComp);
    if (decoded is null)
    {
        image.error(kStrImageDecodingFailed);
        return;
    }    

    if (actualComp != 1 && actualComp != 3 && actualComp != 4)
    {
        image.error(kStrImageWrongComponents);
        free(decoded.ptr);
        return;
    }

    if (width > GAMUT_MAX_IMAGE_WIDTH || height > GAMUT_MAX_IMAGE_HEIGHT)
    {
        image.error(kStrImageTooLarge);
        free(decoded.ptr);
        return;
    }

    image._width = width;
    image._height = height;
    image._data = decoded.ptr;
    image._pitch = width * actualComp;
    switch (actualComp)
    {
        case 1: image._type = ImageType.uint8; break;
        case 3: image._type = ImageType.rgb8; break;
        case 4: image._type = ImageType.rgba8; break;
        default:
    }
}

bool Validate_JPEG(IOStream *io, IOHandle handle) @trusted
{
    static immutable ubyte[2] jpegSignature = [0xFF, 0xD8];
    return fileIsStartingWithSignature(io, handle, jpegSignature);
}

version(encodeJPEG)
bool Save_JPEG(ref const(Image) image, IOStream *io, IOHandle handle, int page, int flags, void *data) @trusted
{
    if (page != 0)
        return false;

    int components;

    switch (image._type)
    {
        case ImageType.uint8:
            components = 1; break;
        case ImageType.rgb8:
            components = 3; 
            break;
        case ImageType.rgba8:
            return false; // stb would throw away alpha
        default:
            return false;
    }

    JPEGIOHandle jio;
    jio.wrapped = io;
    jio.handle = handle;

    void* userPointer = cast(void*)&jio;

    int quality = 90; // TODO: option to choose that.

    int res = stbi_write_jpg_to_func(&stb_stream_write, userPointer, 
                                        image._width, 
                                        image._height, 
                                        components, 
                                        image._data, quality);

    return res == 1 && !jio.errored;
}

private:


struct JPEGIOHandle
{
    IOStream* wrapped;
    IOHandle handle;

    // stb_image_write doesn't check errors for write, so keep a flag and start ignoring output if
    // an I/O error occurs.
    bool errored = false;
}

/// This function is called when the internal input buffer is empty.
// userData must be a JPEGIOHandle*
int stream_read_jpeg(void* pBuf, int max_bytes_to_read, bool* pEOF_flag, void* userData) @system
{
    JPEGIOHandle* jio = cast(JPEGIOHandle*) userData;
    size_t read = jio.wrapped.read(pBuf, 1, max_bytes_to_read, jio.handle);
    if (pEOF_flag)
    {
        *pEOF_flag = jio.wrapped.eof(jio.handle) != 0;
    }
    assert(read >= 0 && read <= 0x7fff_ffff);
    return cast(int) read;
}

// Note: context is a user pointer on a JPEGIOHandle.
void stb_stream_write(void *context, const(void)* data, int size) @system
{    
    JPEGIOHandle* jio = cast(JPEGIOHandle*) context;

    if (jio.errored)
        return;

    size_t written = jio.wrapped.write(data, 1, size, jio.handle);
    if (written != size)
        jio.errored = true; // poison the JPEGIOHandleB
}