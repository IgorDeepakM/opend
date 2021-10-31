# audio-formats
Audio format loading for D.

Can decode WAV / MP3 / FLAC / OPUS / OGG / MOD / XM, from file or memory.
Can encode WAV to a file or to memory.

It is a replacement for the `wave-d` package but with more formats, `nothrow @nogc` and chunk support.

# API

See `examples/transcode/main.d`:
https://github.com/AuburnSounds/audio-formats/blob/master/examples/transcode/source/main.d

# File format support

|       | Decoding   | Encoding | Seeking support |
|-------|------------|----------|-----------------|
| WAV   | Yes        | Yes      | Sample          |
| MP3   | Yes        | No       | Sample          |
| FLAC  | Yes        | No       | Sample          |
| OPUS  | Yes (LGPL) | No       | Coarse          |
| OGG   | Yes        | No       | No              |
| MOD   | Yes        | No       | No              |
| XM    | Yes        | No       | No              |


Some of these decoders were originally translated by Ketmar, who did the heavy-lifting.


# References

- https://github.com/Zoadian/mp3decoder
- https://github.com/rombankzero/pocketmod
- https://github.com/Artefact2/libxm


# License

- Boost license otherwise.
- LGPL v2.1 with OPUS decoding.
(use DUB subconfigurations) to choose, default is boost.


# Bugs

- OGG decoding doesn't work, the sound is unusable.