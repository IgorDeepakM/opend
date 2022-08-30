/**
* AVX intrinsics.
* https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html#techs=AVX
*
* Copyright: Guillaume Piolat 2022.
*            Johan Engelen 2022.
* License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
*/
module inteli.avxintrin;

// AVX instructions
// https://software.intel.com/sites/landingpage/IntrinsicsGuide/#techs=AVX
// Note: this header will work whether you have AVX enabled or not.
// With LDC, use "dflags-ldc": ["-mattr=+avx"] or equivalent to actively
// generate AVX instructions.

public import inteli.types;
import inteli.internals;

// Pull in all previous instruction set intrinsics.
public import inteli.tmmintrin;

nothrow @nogc:

/// Add packed double-precision (64-bit) floating-point elements in `a` and `b`.
__m256d _mm256_add_pd (__m256d a, __m256d b) pure @trusted
{
    return a + b;
}
unittest
{
    align(32) double[4] A = [-1, 2, -3, 40000];
    align(32) double[4] B = [ 9, -7, 8, -0.5];
    __m256d R = _mm256_add_pd(_mm256_load_pd(A.ptr), _mm256_load_pd(B.ptr));
    double[4] correct = [8, -5, 5, 39999.5];
    assert(R.array == correct);
}

/// Add packed single-precision (32-bit) floating-point elements in `a` and `b`.
__m256 _mm256_add_ps (__m256 a, __m256 b) pure @trusted
{
    return a + b;
}
unittest
{
    align(32) float[8] A = [-1.0f, 2, -3, 40000, 0, 3, 5, 6];
    align(32) float[8] B = [ 9.0f, -7, 8,  -0.5, 8, 7, 3, -1];
    __m256 R = _mm256_add_ps(_mm256_load_ps(A.ptr), _mm256_load_ps(B.ptr));
    float[8] correct     = [8, -5, 5, 39999.5, 8, 10, 8, 5];
    assert(R.array == correct);
}

// TODO __m256d _mm256_addsub_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_addsub_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_and_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_and_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_andnot_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_andnot_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_blend_pd (__m256d a, __m256d b, const int imm8)
// TODO __m256 _mm256_blend_ps (__m256 a, __m256 b, const int imm8)
// TODO __m256d _mm256_blendv_pd (__m256d a, __m256d b, __m256d mask)
// TODO __m256 _mm256_blendv_ps (__m256 a, __m256 b, __m256 mask)
// TODO __m256d _mm256_broadcast_pd (__m128d const * mem_addr)
// TODO __m256 _mm256_broadcast_ps (__m128 const * mem_addr)
// TODO __m256d _mm256_broadcast_sd (double const * mem_addr)
// TODO __m128 _mm_broadcast_ss (float const * mem_addr)
// TODO __m256 _mm256_broadcast_ss (float const * mem_addr)
// TODO __m256 _mm256_castpd_ps (__m256d a)
// TODO __m256i _mm256_castpd_si256 (__m256d a)
// TODO __m256d _mm256_castpd128_pd256 (__m128d a)
// TODO __m128d _mm256_castpd256_pd128 (__m256d a)
// TODO __m256d _mm256_castps_pd (__m256 a)
// TODO __m256i _mm256_castps_si256 (__m256 a)
// TODO __m256 _mm256_castps128_ps256 (__m128 a)
// TODO __m128 _mm256_castps256_ps128 (__m256 a)
// TODO __m256i _mm256_castsi128_si256 (__m128i a)
// TODO __m256d _mm256_castsi256_pd (__m256i a)
// TODO __m256 _mm256_castsi256_ps (__m256i a)
// TODO __m128i _mm256_castsi256_si128 (__m256i a)
// TODO __m256d _mm256_ceil_pd (__m256d a)
// TODO __m256 _mm256_ceil_ps (__m256 a)
// TODO __m128d _mm_cmp_pd (__m128d a, __m128d b, const int imm8)
// TODO __m256d _mm256_cmp_pd (__m256d a, __m256d b, const int imm8)
// TODO __m128 _mm_cmp_ps (__m128 a, __m128 b, const int imm8)
// TODO __m256 _mm256_cmp_ps (__m256 a, __m256 b, const int imm8)
// TODO __m128d _mm_cmp_sd (__m128d a, __m128d b, const int imm8)
// TODO __m128 _mm_cmp_ss (__m128 a, __m128 b, const int imm8)
// TODO __m256d _mm256_cvtepi32_pd (__m128i a)
// TODO __m256 _mm256_cvtepi32_ps (__m256i a)
// TODO __m128i _mm256_cvtpd_epi32 (__m256d a)
// TODO __m128 _mm256_cvtpd_ps (__m256d a)
// TODO __m256i _mm256_cvtps_epi32 (__m256 a)
// TODO __m256d _mm256_cvtps_pd (__m128 a)
// TODO double _mm256_cvtsd_f64 (__m256d a)
// TODO int _mm256_cvtsi256_si32 (__m256i a)
// TODO float _mm256_cvtss_f32 (__m256 a)
// TODO __m128i _mm256_cvttpd_epi32 (__m256d a)
// TODO __m256i _mm256_cvttps_epi32 (__m256 a)
// TODO __m256d _mm256_div_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_div_ps (__m256 a, __m256 b)
// TODO __m256 _mm256_dp_ps (__m256 a, __m256 b, const int imm8)


/// Extract a 32-bit integer from `a`, selected with `imm8`.
int _mm256_extract_epi32 (__m256i a, const int imm8) pure @trusted
{
    return (cast(int8)a).array[imm8 & 7];
}
unittest
{
    align(16) int[8] data = [-1, 2, -3, 4, 9, -7, 8, -6];
    auto A = _mm256_loadu_si256(cast(__m256i*) data.ptr);
    assert(_mm256_extract_epi32(A, 0) == -1);
    assert(_mm256_extract_epi32(A, 1 + 8) == 2);
    assert(_mm256_extract_epi32(A, 3 + 16) == 4);
    assert(_mm256_extract_epi32(A, 7 + 32) == -6);
}

// TODO __int64 _mm256_extract_epi64 (__m256i a, const int index)
// TODO __m128d _mm256_extractf128_pd (__m256d a, const int imm8)
// TODO __m128 _mm256_extractf128_ps (__m256 a, const int imm8)
// TODO __m128i _mm256_extractf128_si256 (__m256i a, const int imm8)
// TODO __m256d _mm256_floor_pd (__m256d a)
// TODO __m256 _mm256_floor_ps (__m256 a)
// TODO __m256d _mm256_hadd_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_hadd_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_hsub_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_hsub_ps (__m256 a, __m256 b)
// TODO __m256i _mm256_insert_epi16 (__m256i a, __int16 i, const int index)
// TODO __m256i _mm256_insert_epi32 (__m256i a, __int32 i, const int index)
// TODO __m256i _mm256_insert_epi64 (__m256i a, __int64 i, const int index)
// TODO __m256i _mm256_insert_epi8 (__m256i a, __int8 i, const int index)
// TODO __m256d _mm256_insertf128_pd (__m256d a, __m128d b, int imm8)
// TODO __m256 _mm256_insertf128_ps (__m256 a, __m128 b, int imm8)
// TODO __m256i _mm256_insertf128_si256 (__m256i a, __m128i b, int imm8)
// TODO __m256i _mm256_lddqu_si256 (__m256i const * mem_addr)

/// Load 256-bits (composed of 4 packed double-precision (64-bit) floating-point elements) 
/// from memory. `mem_addr` must be aligned on a 32-byte boundary or a general-protection 
/// exception may be generated.
__m256d _mm256_load_pd (const(double)* mem_addr) pure @trusted
{
    return *cast(__m256d*)mem_addr;
}
unittest
{
    static immutable align(32) double[4] correct = [1.0, 2.0, 3.5, -42.0];
    __m256d A = _mm256_load_pd(correct.ptr);
    assert(A.array == correct);
}

/// Load 256-bits (composed of 8 packed single-precision (32-bit) 
/// floating-point elements) from memory. 
/// `mem_addr` must be aligned on a 32-byte boundary or a 
/// general-protection exception may be generated.
__m256 _mm256_load_ps (const(float)* mem_addr) pure @trusted
{
    return *cast(__m256*)mem_addr;
}
unittest
{
    static immutable align(32) float[8] correct = 
        [1.0, 2.0, 3.5, -42.0, 7.43f, 0.0f, 3, 2];
    __m256 A = _mm256_load_ps(correct.ptr);
    assert(A.array == correct);
}

/// Load 256-bits of integer data from memory. `mem_addr` does not need to be aligned on
/// any particular boundary.
__m256i _mm256_loadu_si256 (const(__m256i)* mem_addr) pure @trusted
{
    // PERF DMD
    static if (GDC_with_AVX)
    {
        return cast(__m256i) __builtin_ia32_loaddqu256(cast(const(char)*) mem_addr);
    }
    else version(LDC)
    {
        return loadUnaligned!(__m256i)(cast(long*)mem_addr);
    }
    else
    {
        const(long)* p = cast(const(long)*)mem_addr; 
        long4 r;
        r.ptr[0] = p[0];
        r.ptr[1] = p[1];
        r.ptr[2] = p[2];
        r.ptr[3] = p[3];
        return r;
    }
}
unittest
{
    align(16) int[8] correct = [-1, 2, -3, 4, 9, -7, 8, -6];
    int8 A = cast(int8) _mm256_loadu_si256(cast(__m256i*) correct.ptr);
    assert(A.array == correct);
}

// TODO __m256i _mm256_load_si256 (__m256i const * mem_addr)
// TODO __m256d _mm256_loadu_pd (double const * mem_addr)
// TODO __m256 _mm256_loadu_ps (float const * mem_addr)
// TODO __m256 _mm256_loadu2_m128 (float const* hiaddr, float const* loaddr)
// TODO __m256d _mm256_loadu2_m128d (double const* hiaddr, double const* loaddr)
// TODO __m256i _mm256_loadu2_m128i (__m128i const* hiaddr, __m128i const* loaddr)
// TODO __m128d _mm_maskload_pd (double const * mem_addr, __m128i mask)
// TODO __m256d _mm256_maskload_pd (double const * mem_addr, __m256i mask)
// TODO __m128 _mm_maskload_ps (float const * mem_addr, __m128i mask)
// TODO __m256 _mm256_maskload_ps (float const * mem_addr, __m256i mask)
// TODO void _mm_maskstore_pd (double * mem_addr, __m128i mask, __m128d a)
// TODO void _mm256_maskstore_pd (double * mem_addr, __m256i mask, __m256d a)
// TODO void _mm_maskstore_ps (float * mem_addr, __m128i mask, __m128 a)
// TODO void _mm256_maskstore_ps (float * mem_addr, __m256i mask, __m256 a)
// TODO __m256d _mm256_max_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_max_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_min_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_min_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_movedup_pd (__m256d a)
// TODO __m256 _mm256_movehdup_ps (__m256 a)
// TODO __m256 _mm256_moveldup_ps (__m256 a)
// TODO int _mm256_movemask_pd (__m256d a)
// TODO int _mm256_movemask_ps (__m256 a)
// TODO __m256d _mm256_mul_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_mul_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_or_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_or_ps (__m256 a, __m256 b)
// TODO __m128d _mm_permute_pd (__m128d a, int imm8)
// TODO __m256d _mm256_permute_pd (__m256d a, int imm8)
// TODO __m128 _mm_permute_ps (__m128 a, int imm8)
// TODO __m256 _mm256_permute_ps (__m256 a, int imm8)
// TODO __m256d _mm256_permute2f128_pd (__m256d a, __m256d b, int imm8)
// TODO __m256 _mm256_permute2f128_ps (__m256 a, __m256 b, int imm8)
// TODO __m256i _mm256_permute2f128_si256 (__m256i a, __m256i b, int imm8)
// TODO __m128d _mm_permutevar_pd (__m128d a, __m128i b)
// TODO __m256d _mm256_permutevar_pd (__m256d a, __m256i b)
// TODO __m128 _mm_permutevar_ps (__m128 a, __m128i b)
// TODO __m256 _mm256_permutevar_ps (__m256 a, __m256i b)
// TODO __m256 _mm256_rcp_ps (__m256 a)
// TODO __m256d _mm256_round_pd (__m256d a, int rounding)
// TODO __m256 _mm256_round_ps (__m256 a, int rounding)
// TODO __m256 _mm256_rsqrt_ps (__m256 a)
// TODO __m256i _mm256_set_epi16 (short e15, short e14, short e13, short e12, short e11, short e10, short e9, short e8, short e7, short e6, short e5, short e4, short e3, short e2, short e1, short e0)
// TODO __m256i _mm256_set_epi32 (int e7, int e6, int e5, int e4, int e3, int e2, int e1, int e0)
// TODO __m256i _mm256_set_epi64x (__int64 e3, __int64 e2, __int64 e1, __int64 e0)

// TODO __m256i _mm256_set_epi8 (char e31, char e30, char e29, char e28, char e27, char e26, char e25, char e24, char e23, char e22, char e21, char e20, char e19, char e18, char e17, char e16, char e15, char e14, char e13, char e12, char e11, char e10, char e9, char e8, char e7, char e6, char e5, char e4, char e3, char e2, char e1, char e0)
// TODO __m256 _mm256_set_m128 (__m128 hi, __m128 lo)
// TODO __m256d _mm256_set_m128d (__m128d hi, __m128d lo)
// TODO __m256i _mm256_set_m128i (__m128i hi, __m128i lo)
// TODO __m256d _mm256_set_pd (double e3, double e2, double e1, double e0)
// TODO __m256 _mm256_set_ps (float e7, float e6, float e5, float e4, float e3, float e2, float e1, float e0)


/// Broadcast 16-bit integer `a` to all elements of the return value.
__m256i _mm256_set1_epi16 (short a) pure @trusted
{
    // workaround https://issues.dlang.org/show_bug.cgi?id=21469
    // It used to ICE, now the codegen is just wrong.
    // TODO report this backend issue.
    version(DigitalMars) 
    {
        short16 v = a;
        return cast(__m256i) v;
    }
    else
    {
        pragma(inline, true);
        return cast(__m256i)(short16(a));
    }
}
unittest
{
    short16 a = cast(short16) _mm256_set1_epi16(31);
    for (int i = 0; i < 16; ++i)
        assert(a.array[i] == 31);
}

/// Broadcast 32-bit integer `a` to all elements.
__m256i _mm256_set1_epi32 (int a) pure @trusted
{
    // Bad codegen else in DMD.
    // TODO report this backend issue.
    version(DigitalMars) 
    {
        int8 v = a;
        return cast(__m256i) v;
    }
    else
    {
        pragma(inline, true);
        return cast(__m256i)(int8(a));
    }
}
unittest
{
    int8 a = cast(int8) _mm256_set1_epi32(31);
    for (int i = 0; i < 8; ++i)
        assert(a.array[i] == 31);
}

// TODO __m256i _mm256_set1_epi64x (long long a)


/// Broadcast 8-bit integer `a` to all elements of the return value.
__m256i _mm256_set1_epi8 (byte a) pure @trusted
{
    version(DigitalMars) // workaround https://issues.dlang.org/show_bug.cgi?id=21469
    {
        byte32 v = a;
        return cast(__m256i) v;
    }
    else
    {
        pragma(inline, true);
        return cast(__m256i)(byte32(a));
    }
}
unittest
{
    byte32 a = cast(byte32) _mm256_set1_epi8(31);
    for (int i = 0; i < 32; ++i)
        assert(a.array[i] == 31);
}

// TODO __m256d _mm256_set1_pd (double a)
// TODO __m256 _mm256_set1_ps (float a)

/// Set packed 16-bit integers with the supplied values in reverse order.
__m256i _mm256_setr_epi16 (short e15, short e14, short e13, short e12, short e11, short e10, short e9,  short e8,
                           short e7,  short e6,  short e5,  short e4,  short e3,  short e2,  short e1,  short e0) pure @trusted
{
    short[16] result = [ e15,  e14,  e13,  e12,  e11,  e10,  e9,   e8,
                         e7,   e6,   e5,   e4,   e3,   e2,   e1,   e0];
    static if (GDC_with_AVX)
    {
         return cast(__m256i) __builtin_ia32_loaddqu256(cast(const(char)*) result.ptr);
    }
    else version(LDC)
    {
        return cast(__m256i)( loadUnaligned!(short16)(result.ptr) );
    }
    else
    {
        short16 r;
        for(int n = 0; n < 16; ++n)
            r.ptr[n] = result[n];
        return cast(__m256i)r;
    }
}
unittest
{
    short16 A = cast(short16) _mm256_setr_epi16(-1, 0, -21, 21, 42, 127, -42, -128,
                                                -1, 0, -21, 21, 42, 127, -42, -128);
    short[16] correct = [-1, 0, -21, 21, 42, 127, -42, -128,
                         -1, 0, -21, 21, 42, 127, -42, -128];
    assert(A.array == correct);
}

/// Set packed 32-bit integers with the supplied values in reverse order.
__m256i _mm256_setr_epi32 (int e7, int e6, int e5, int e4, int e3, int e2, int e1, int e0) pure @trusted
{
    int[8] result = [e7, e6, e5, e4, e3, e2, e1, e0];
    static if (GDC_with_AVX)
    {
        return cast(__m256i) __builtin_ia32_loaddqu256(cast(const(char)*) result.ptr);
    }
    else version(LDC)
    {
        return cast(__m256i)( loadUnaligned!(int8)(result.ptr) );
    }
    else
    {
        int8 r;
        for(int n = 0; n < 8; ++n)
            r.ptr[n] = result[n];
        return cast(__m256i)r;
    }
}
unittest
{
    int8 A = cast(int8) _mm256_setr_epi32(-1, 0, -2147483648, 2147483647, 42, 666, -42, -666);
    int[8] correct = [-1, 0, -2147483648, 2147483647, 42, 666, -42, -666];
    assert(A.array == correct);
}

// TODO __m256i _mm256_setr_epi64x (__int64 e3, __int64 e2, __int64 e1, __int64 e0)

/// Set packed 8-bit integers with the supplied values in reverse order.
__m256i _mm256_setr_epi8 (byte e31, byte e30, byte e29, byte e28, byte e27, byte e26, byte e25, byte e24,
                          byte e23, byte e22, byte e21, byte e20, byte e19, byte e18, byte e17, byte e16,
                          byte e15, byte e14, byte e13, byte e12, byte e11, byte e10, byte e9,  byte e8,
                          byte e7,  byte e6,  byte e5,  byte e4,  byte e3,  byte e2,  byte e1,  byte e0) pure @trusted
{
    // PERF GDC, not checked
    byte[32] result = [ e31,  e30,  e29,  e28,  e27,  e26,  e25,  e24,
                        e23,  e22,  e21,  e20,  e19,  e18,  e17,  e16,
                        e15,  e14,  e13,  e12,  e11,  e10,  e9,   e8,
                        e7,   e6,   e5,   e4,   e3,   e2,   e1,   e0];
    static if (GDC_with_AVX)
    {
        return cast(__m256i) __builtin_ia32_loaddqu256(cast(const(char)*) result.ptr);
    }
    else version(LDC)
    {
        return cast(__m256i)( loadUnaligned!(byte32)(result.ptr) );
    }
    else
    {
        byte32 r;
        for(int n = 0; n < 32; ++n)
            r.ptr[n] = result[n];
        return cast(__m256i)r;
    }
}
unittest
{
    byte32 A = cast(byte32) _mm256_setr_epi8( -1, 0, -21, 21, 42, 127, -42, -128,
                                              -1, 0, -21, 21, 42, 127, -42, -128,
                                              -1, 0, -21, 21, 42, 127, -42, -128,
                                              -1, 0, -21, 21, 42, 127, -42, -128);
    byte[32] correct = [-1, 0, -21, 21, 42, 127, -42, -128,
                        -1, 0, -21, 21, 42, 127, -42, -128,
                        -1, 0, -21, 21, 42, 127, -42, -128,
                        -1, 0, -21, 21, 42, 127, -42, -128];
    assert(A.array == correct);
}

// TODO __m256 _mm256_setr_m128 (__m128 lo, __m128 hi)
// TODO __m256d _mm256_setr_m128d (__m128d lo, __m128d hi)
// TODO __m256i _mm256_setr_m128i (__m128i lo, __m128i hi)
// TODO __m256d _mm256_setr_pd (double e3, double e2, double e1, double e0)
// TODO __m256 _mm256_setr_ps (float e7, float e6, float e5, float e4, float e3, float e2, float e1, float e0)
// TODO __m256d _mm256_setzero_pd (void)
// TODO __m256 _mm256_setzero_ps (void)


/// Return vector of type `__m256i` with all elements set to zero.
__m256i _mm256_setzero_si256() pure @trusted
{
    // PERF: nothing was checked
    pragma(inline, true);
    
    version(LDC)
    {
        int[8] result = [0, 0, 0, 0, 0, 0, 0, 0];
        return cast(__m256i)( loadUnaligned!(int8)(result.ptr) );
    }
    else
    {
        __m256i r;
        r = 0;
        return r;
    }
}


// TODO __m256d _mm256_shuffle_pd (__m256d a, __m256d b, const int imm8)
// TODO __m256 _mm256_shuffle_ps (__m256 a, __m256 b, const int imm8)
// TODO __m256d _mm256_sqrt_pd (__m256d a)
// TODO __m256 _mm256_sqrt_ps (__m256 a)
// TODO void _mm256_store_pd (double * mem_addr, __m256d a)
// TODO void _mm256_store_ps (float * mem_addr, __m256 a)
// TODO void _mm256_store_si256 (__m256i * mem_addr, __m256i a)
// TODO void _mm256_storeu_pd (double * mem_addr, __m256d a)
// TODO void _mm256_storeu_ps (float * mem_addr, __m256 a)

/// Store 256-bits of integer data from `a` into memory. `mem_addr` does not need to be aligned on any particular boundary.
void _mm256_storeu_si256 (const(__m256i)* mem_addr, __m256i a) pure @trusted
{
    // PERF: DMD and GDC
    version(LDC)
    {
        storeUnaligned!__m256i(a, cast(long*)mem_addr);
    }
    else
    {
        long4 v = cast(long4)a;
        long* p = cast(long*)mem_addr;
        for(int n = 0; n < 4; ++n)
            p[n] = v[n];
    }
}

// TODO void _mm256_storeu2_m128 (float* hiaddr, float* loaddr, __m256 a)
// TODO void _mm256_storeu2_m128d (double* hiaddr, double* loaddr, __m256d a)
// TODO void _mm256_storeu2_m128i (__m128i* hiaddr, __m128i* loaddr, __m256i a)
// TODO void _mm256_stream_pd (double * mem_addr, __m256d a)
// TODO void _mm256_stream_ps (float * mem_addr, __m256 a)
// TODO void _mm256_stream_si256 (__m256i * mem_addr, __m256i a)
// TODO __m256d _mm256_sub_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_sub_ps (__m256 a, __m256 b)
// TODO int _mm_testc_pd (__m128d a, __m128d b)
// TODO int _mm256_testc_pd (__m256d a, __m256d b)
// TODO int _mm_testc_ps (__m128 a, __m128 b)
// TODO int _mm256_testc_ps (__m256 a, __m256 b)
// TODO int _mm256_testc_si256 (__m256i a, __m256i b)
// TODO int _mm_testnzc_pd (__m128d a, __m128d b)
// TODO int _mm256_testnzc_pd (__m256d a, __m256d b)
// TODO int _mm_testnzc_ps (__m128 a, __m128 b)
// TODO int _mm256_testnzc_ps (__m256 a, __m256 b)
// TODO int _mm256_testnzc_si256 (__m256i a, __m256i b)
// TODO int _mm_testz_pd (__m128d a, __m128d b)
// TODO int _mm256_testz_pd (__m256d a, __m256d b)
// TODO int _mm_testz_ps (__m128 a, __m128 b)
// TODO int _mm256_testz_ps (__m256 a, __m256 b)
// TODO int _mm256_testz_si256 (__m256i a, __m256i b)
// TODO __m256d _mm256_undefined_pd (void)
// TODO __m256 _mm256_undefined_ps (void)
// TODO __m256i _mm256_undefined_si256 (void)
// TODO __m256d _mm256_unpackhi_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_unpackhi_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_unpacklo_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_unpacklo_ps (__m256 a, __m256 b)
// TODO __m256d _mm256_xor_pd (__m256d a, __m256d b)
// TODO __m256 _mm256_xor_ps (__m256 a, __m256 b)
// TODO void _mm256_zeroall (void)
// TODO void _mm256_zeroupper (void)
// TODO __m256d _mm256_zextpd128_pd256 (__m128d a)
// TODO __m256 _mm256_zextps128_ps256 (__m128 a)
// TODO __m256i _mm256_zextsi128_si256 (__m128i a)

