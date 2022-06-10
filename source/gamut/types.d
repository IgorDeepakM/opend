/**
Various public types.

Copyright: Copyright Guillaume Piolat 2022
License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)

Note: This library is re-implemented in D from FreeImage documentation (FreeImage3180.pdf).
      See the differences in DIFFERENCES.md
*/
module gamut.types;


/// Image format.
enum ImageFormat
{
    unknown = -1, /// Unknown format (returned value only, never use it as input value)
    first   =  0,
    JPEG    =  0, /// Independent JPEG Group (*.JPG, *.JIF, *.JPEG, *.JPE)
    PNG     =  1, /// Portable Network Graphics (*.PNG)
    QOI     =  2  /// Quite OK Image format (*.QOI)
}

/// Number of internally-supported formats. Equal to 1 + maximum internal format (here: FIF_QOI).
package enum int FREE_IMAGE_FORMAT_NUM = cast(int)(ImageFormat.QOI) + 1; 

/// Image format.
enum ImageType
{
    unknown = -1, /// Unknown format (returned value only, never use it as input value)
    uint8 = 0,    /// Array of ushort: unsigned 8-bit
    int8,         /// Array of short: signed 8-bit
    uint16,       /// Array of ushort: unsigned 16-bit
    int16,        /// Array of short: signed 16-bit
    uint32,       /// Array of uint: unsigned 32-bit
    int32,        /// Array of int: signed 32-bit
    f32,          /// Array of float: 32-bit IEEE floating point
    f64,          /// Array of double: 64-bit IEEE floating point

    la8,          /// 16-bit Luminance Alpha image: 2 x unsigned 8-bit
    la16,         /// 32-bit Luminance Alpha image: 2 x unsigned 16-bit

    rgb8,         /// 24-bit RGB image: 3 x unsigned 8-bit
    rgb16,        /// 48-bit RGB image: 3 x unsigned 16-bit

    rgba8,        /// 32-bit RGBA image: 4 x unsigned 8-bit
    rgba16,       /// 64-bit RGBA image: 4 x unsigned 16-bit

    rgbf32,       /// 96-bit RGB float image: 3 x 32-bit IEEE floating point
    rgbaf32,      /// 128-bit RGBA float image: 4 x 32-bit IEEE floating point
}


// Load flags

/// No loading options.
enum int LOAD_NORMAL = 0; 

/// Load the image in grayscale, faster than loading as RGB24 then converting to greyscale.
/// Can't be used with either `LOAD_RGB` or `LOAD_RGBA`.
enum int LOAD_GREYSCALE = 1;

/// Load the image in RGB8/RGB16, faster than loading as RGB8 then converting to greyscale.
/// Can't be used with either `LOAD_GREYSCALE` or `LOAD_RGBA`.
enum int LOAD_RGB = 2; 

/// Load the image in RGBA8/RGBA16, faster than loading as RGBA8 then converting to greyscale.
/// Can't be used with either `LOAD_GREYSCALE` or `LOAD_RGBA`.
enum int LOAD_RGBA = 4; 


// Return: 
//   -1 => keep input number of components
//    0 => error
//    1/2/3/4 => forced number of components.
package int computeRequestedImageComponents(int loadFlags) pure nothrow @nogc @safe
{
    int requestedComp = -1; // keep original

    int forceFlags = 0;
    if (loadFlags & LOAD_GREYSCALE)
    {
        forceFlags++;
        requestedComp = 1;
    }
    if (loadFlags & LOAD_RGB)
    {
        forceFlags++;
        requestedComp = 3;
    }
    if (loadFlags & LOAD_RGBA)
    {
        forceFlags++;
        requestedComp = 4;
    }
    if (forceFlags > 1)
        return 0; // LOAD_GREYSCALE, LOAD_RGB and LOAD_RGBA are mutually exclusive => error

    return requestedComp;
}