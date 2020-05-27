# echo argv
# src/common/runtest.exe -w '' src/functional/argv.exe >src/functional/argv.err && echo successed ; echo || echo argv failed ; echo
# echo basename
# src/common/runtest.exe -w '' src/functional/basename.exe >src/functional/basename.err && echo successed ; echo || echo basename failed ; echo
# echo clocale_mbfuncs
# src/common/runtest.exe -w '' src/functional/clocale_mbfuncs.exe >src/functional/clocale_mbfuncs.err && echo successed ; echo || echo clocale_mbfuncs failed ; echo
# echo clock_gettime
# src/common/runtest.exe -w '' src/functional/clock_gettime.exe >src/functional/clock_gettime.err && echo successed ; echo || echo clock_gettime failed ; echo
# echo crypt
# src/common/runtest.exe -w '' src/functional/crypt.exe >src/functional/crypt.err && echo successed ; echo || echo crypt failed ; echo
# echo dirname
# src/common/runtest.exe -w '' src/functional/dirname.exe >src/functional/dirname.err && echo successed ; echo || echo dirname failed ; echo
# echo dlopen
# src/common/runtest.exe -w '' src/functional/dlopen.exe >src/functional/dlopen.err && echo successed ; echo || echo dlopen failed ; echo
# echo env
# src/common/runtest.exe -w '' src/functional/env.exe >src/functional/env.err && echo successed ; echo || echo env failed ; echo
echo fcntl
src/common/runtest.exe -w '' src/functional/fcntl.exe >src/functional/fcntl.err && echo successed ; echo || echo fcntl failed ; echo
# echo fdopen
# src/common/runtest.exe -w '' src/functional/fdopen.exe >src/functional/fdopen.err && echo successed ; echo || echo fdopen failed ; echo
# echo fnmatch
# src/common/runtest.exe -w '' src/functional/fnmatch.exe >src/functional/fnmatch.err && echo successed ; echo || echo fnmatch failed ; echo
echo fscanf
src/common/runtest.exe -w '' src/functional/fscanf.exe >src/functional/fscanf.err && echo successed ; echo || echo fscanf failed ; echo
# echo fwscanf
# src/common/runtest.exe -w '' src/functional/fwscanf.exe >src/functional/fwscanf.err && echo successed ; echo || echo fwscanf failed ; echo
# echo iconv_open
# src/common/runtest.exe -w '' src/functional/iconv_open.exe >src/functional/iconv_open.err && echo successed ; echo || echo iconv_open failed ; echo
# echo inet_pton
# src/common/runtest.exe -w '' src/functional/inet_pton.exe >src/functional/inet_pton.err && echo successed ; echo || echo inet_pton failed ; echo
echo ipc_msg
src/common/runtest.exe -w '' src/functional/ipc_msg.exe >src/functional/ipc_msg.err && echo successed ; echo || echo ipc_msg failed ; echo


echo ipc_shm
src/common/runtest.exe -w '' src/functional/ipc_shm.exe >src/functional/ipc_shm.err && echo successed ; echo || echo ipc_shm failed ; echo
# echo mbc
# src/common/runtest.exe -w '' src/functional/mbc.exe >src/functional/mbc.err && echo successed ; echo || echo mbc failed ; echo
# echo memstream
# src/common/runtest.exe -w '' src/functional/memstream.exe >src/functional/memstream.err && echo successed ; echo || echo memstream failed ; echo
echo popen
src/common/runtest.exe -w '' src/functional/popen.exe >src/functional/popen.err && echo successed ; echo || echo popen failed ; echo
echo pthread_cancel-points
src/common/runtest.exe -w '' src/functional/pthread_cancel-points.exe >src/functional/pthread_cancel-points.err && echo successed ; echo || echo pthread_cancel-points failed ; echo



echo pthread_robust
src/common/runtest.exe -w '' src/functional/pthread_robust.exe >src/functional/pthread_robust.err && echo successed ; echo || echo pthread_robust failed ; echo
# echo pthread_tsd
# src/common/runtest.exe -w '' src/functional/pthread_tsd.exe >src/functional/pthread_tsd.err && echo successed ; echo || echo pthread_tsd failed ; echo
# echo qsort
# src/common/runtest.exe -w '' src/functional/qsort.exe >src/functional/qsort.err && echo successed ; echo || echo qsort failed ; echo
# echo random
# src/common/runtest.exe -w '' src/functional/random.exe >src/functional/random.err && echo successed ; echo || echo random failed ; echo
# echo search_hsearch
# src/common/runtest.exe -w '' src/functional/search_hsearch.exe >src/functional/search_hsearch.err && echo successed ; echo || echo search_hsearch failed ; echo
# echo search_insque
# src/common/runtest.exe -w '' src/functional/search_insque.exe >src/functional/search_insque.err && echo successed ; echo || echo search_insque failed ; echo
# echo search_lsearch
# src/common/runtest.exe -w '' src/functional/search_lsearch.exe >src/functional/search_lsearch.err && echo successed ; echo || echo search_lsearch failed ; echo
# echo search_tsearch
# src/common/runtest.exe -w '' src/functional/search_tsearch.exe >src/functional/search_tsearch.err && echo successed ; echo || echo search_tsearch failed ; echo


echo sem_open
src/common/runtest.exe -w '' src/functional/sem_open.exe >src/functional/sem_open.err && echo successed ; echo || echo sem_open failed ; echo
echo setjmp
src/common/runtest.exe -w '' src/functional/setjmp.exe >src/functional/setjmp.err && echo successed ; echo || echo setjmp failed ; echo
# echo snprintf
# src/common/runtest.exe -w '' src/functional/snprintf.exe >src/functional/snprintf.err && echo successed ; echo || echo snprintf failed ; echo


echo spawn
src/common/runtest.exe -w '' src/functional/spawn.exe >src/functional/spawn.err && echo successed ; echo || echo spawn failed ; echo
# echo sscanf
# src/common/runtest.exe -w '' src/functional/sscanf.exe >src/functional/sscanf.err && echo successed ; echo || echo sscanf failed ; echo
# echo sscanf_long
# src/common/runtest.exe -w '' src/functional/sscanf_long.exe >src/functional/sscanf_long.err && echo successed ; echo || echo sscanf_long failed ; echo
# echo stat
# src/common/runtest.exe -w '' src/functional/stat.exe >src/functional/stat.err && echo successed ; echo || echo stat failed ; echo
# echo strftime
# src/common/runtest.exe -w '' src/functional/strftime.exe >src/functional/strftime.err && echo successed ; echo || echo strftime failed ; echo
# echo string
# src/common/runtest.exe -w '' src/functional/string.exe >src/functional/string.err && echo successed ; echo || echo string failed ; echo
# echo string_memcpy
# src/common/runtest.exe -w '' src/functional/string_memcpy.exe >src/functional/string_memcpy.err && echo successed ; echo || echo string_memcpy failed ; echo
# echo string_memmem
# src/common/runtest.exe -w '' src/functional/string_memmem.exe >src/functional/string_memmem.err && echo successed ; echo || echo string_memmem failed ; echo
# echo string_memset
# src/common/runtest.exe -w '' src/functional/string_memset.exe >src/functional/string_memset.err && echo successed ; echo || echo string_memset failed ; echo
# echo string_strchr
# src/common/runtest.exe -w '' src/functional/string_strchr.exe >src/functional/string_strchr.err && echo successed ; echo || echo string_strchr failed ; echo
# echo string_strcspn
# src/common/runtest.exe -w '' src/functional/string_strcspn.exe >src/functional/string_strcspn.err && echo successed ; echo || echo string_strcspn failed ; echo
# echo string_strstr
# src/common/runtest.exe -w '' src/functional/string_strstr.exe >src/functional/string_strstr.err && echo successed ; echo || echo string_strstr failed ; echo
echo strptime
src/common/runtest.exe -w '' src/functional/strptime.exe >src/functional/strptime.err && echo successed ; echo || echo strptime failed ; echo
echo strtod
src/common/runtest.exe -w '' src/functional/strtod.exe >src/functional/strtod.err && echo successed ; echo || echo strtod failed ; echo
# echo strtod_long
# src/common/runtest.exe -w '' src/functional/strtod_long.exe >src/functional/strtod_long.err && echo successed ; echo || echo strtod_long failed ; echo
# echo strtod_simple
# src/common/runtest.exe -w '' src/functional/strtod_simple.exe >src/functional/strtod_simple.err && echo successed ; echo || echo strtod_simple failed ; echo
echo strtof
src/common/runtest.exe -w '' src/functional/strtof.exe >src/functional/strtof.err && echo successed ; echo || echo strtof failed ; echo
# echo strtol
# src/common/runtest.exe -w '' src/functional/strtol.exe >src/functional/strtol.err && echo successed ; echo || echo strtol failed ; echo
echo strtold
src/common/runtest.exe -w '' src/functional/strtold.exe >src/functional/strtold.err && echo successed ; echo || echo strtold failed ; echo
# echo swprintf
# src/common/runtest.exe -w '' src/functional/swprintf.exe >src/functional/swprintf.err && echo successed ; echo || echo swprintf failed ; echo
# echo tgmath
# src/common/runtest.exe -w '' src/functional/tgmath.exe >src/functional/tgmath.err && echo successed ; echo || echo tgmath failed ; echo
# echo time
# src/common/runtest.exe -w '' src/functional/time.exe >src/functional/time.err && echo successed ; echo || echo time failed ; echo

# echo tls_align_dlopen
# src/common/runtest.exe -w '' src/functional/tls_align_dlopen.exe >src/functional/tls_align_dlopen.err && echo successed ; echo || echo tls_align_dlopen failed ; echo
# echo tls_init
# src/common/runtest.exe -w '' src/functional/tls_init.exe >src/functional/tls_init.err && echo successed ; echo || echo tls_init failed ; echo
# echo tls_init_dlopen
# src/common/runtest.exe -w '' src/functional/tls_init_dlopen.exe >src/functional/tls_init_dlopen.err && echo successed ; echo || echo tls_init_dlopen failed ; echo
# echo tls_local_exec
# src/common/runtest.exe -w '' src/functional/tls_local_exec.exe >src/functional/tls_local_exec.err && echo successed ; echo || echo tls_local_exec failed ; echo
# echo udiv
# src/common/runtest.exe -w '' src/functional/udiv.exe >src/functional/udiv.err && echo successed ; echo || echo udiv failed ; echo
# echo ungetc
# src/common/runtest.exe -w '' src/functional/ungetc.exe >src/functional/ungetc.err && echo successed ; echo || echo ungetc failed ; echo
echo utime
src/common/runtest.exe -w '' src/functional/utime.exe >src/functional/utime.err && echo successed ; echo || echo utime failed ; echo
echo vfork
src/common/runtest.exe -w '' src/functional/vfork.exe >src/functional/vfork.err && echo successed ; echo || echo vfork failed ; echo

# echo wcsstr
# src/common/runtest.exe -w '' src/functional/wcsstr.exe >src/functional/wcsstr.err && echo successed ; echo || echo wcsstr failed ; echo
# echo wcstol
# src/common/runtest.exe -w '' src/functional/wcstol.exe >src/functional/wcstol.err && echo successed ; echo || echo wcstol failed ; echo
echo acos
src/common/runtest.exe -w '' src/math/acos.exe >src/math/acos.err && echo successed ; echo || echo acos failed ; echo
echo acosf
src/common/runtest.exe -w '' src/math/acosf.exe >src/math/acosf.err && echo successed ; echo || echo acosf failed ; echo
echo acosh
src/common/runtest.exe -w '' src/math/acosh.exe >src/math/acosh.err && echo successed ; echo || echo acosh failed ; echo
echo acoshf
src/common/runtest.exe -w '' src/math/acoshf.exe >src/math/acoshf.err && echo successed ; echo || echo acoshf failed ; echo

echo acoshl
src/common/runtest.exe -w '' src/math/acoshl.exe >src/math/acoshl.err && echo successed ; echo || echo acoshl failed ; echo
echo acosl
src/common/runtest.exe -w '' src/math/acosl.exe >src/math/acosl.err && echo successed ; echo || echo acosl failed ; echo
echo asin
src/common/runtest.exe -w '' src/math/asin.exe >src/math/asin.err && echo successed ; echo || echo asin failed ; echo
echo asinf
src/common/runtest.exe -w '' src/math/asinf.exe >src/math/asinf.err && echo successed ; echo || echo asinf failed ; echo
# echo asinh
# src/common/runtest.exe -w '' src/math/asinh.exe >src/math/asinh.err && echo successed ; echo || echo asinh failed ; echo
# echo asinhf
# src/common/runtest.exe -w '' src/math/asinhf.exe >src/math/asinhf.err && echo successed ; echo || echo asinhf failed ; echo
echo asinhl
src/common/runtest.exe -w '' src/math/asinhl.exe >src/math/asinhl.err && echo successed ; echo || echo asinhl failed ; echo
echo asinl
src/common/runtest.exe -w '' src/math/asinl.exe >src/math/asinl.err && echo successed ; echo || echo asinl failed ; echo
echo atan
src/common/runtest.exe -w '' src/math/atan.exe >src/math/atan.err && echo successed ; echo || echo atan failed ; echo
echo atan2
src/common/runtest.exe -w '' src/math/atan2.exe >src/math/atan2.err && echo successed ; echo || echo atan2 failed ; echo
echo atan2f
src/common/runtest.exe -w '' src/math/atan2f.exe >src/math/atan2f.err && echo successed ; echo || echo atan2f failed ; echo
echo atan2l
src/common/runtest.exe -w '' src/math/atan2l.exe >src/math/atan2l.err && echo successed ; echo || echo atan2l failed ; echo
echo atanf
src/common/runtest.exe -w '' src/math/atanf.exe >src/math/atanf.err && echo successed ; echo || echo atanf failed ; echo
echo atanh
src/common/runtest.exe -w '' src/math/atanh.exe >src/math/atanh.err && echo successed ; echo || echo atanh failed ; echo
echo atanhf
src/common/runtest.exe -w '' src/math/atanhf.exe >src/math/atanhf.err && echo successed ; echo || echo atanhf failed ; echo
echo atanhl
src/common/runtest.exe -w '' src/math/atanhl.exe >src/math/atanhl.err && echo successed ; echo || echo atanhl failed ; echo
echo atanl
src/common/runtest.exe -w '' src/math/atanl.exe >src/math/atanl.err && echo successed ; echo || echo atanl failed ; echo
# echo cbrt
# src/common/runtest.exe -w '' src/math/cbrt.exe >src/math/cbrt.err && echo successed ; echo || echo cbrt failed ; echo
# echo cbrtf
# src/common/runtest.exe -w '' src/math/cbrtf.exe >src/math/cbrtf.err && echo successed ; echo || echo cbrtf failed ; echo
# echo cbrtl
# src/common/runtest.exe -w '' src/math/cbrtl.exe >src/math/cbrtl.err && echo successed ; echo || echo cbrtl failed ; echo
# echo ceil
# src/common/runtest.exe -w '' src/math/ceil.exe >src/math/ceil.err && echo successed ; echo || echo ceil failed ; echo
# echo ceilf
# src/common/runtest.exe -w '' src/math/ceilf.exe >src/math/ceilf.err && echo successed ; echo || echo ceilf failed ; echo
# echo ceill
# src/common/runtest.exe -w '' src/math/ceill.exe >src/math/ceill.err && echo successed ; echo || echo ceill failed ; echo
# echo copysign
# src/common/runtest.exe -w '' src/math/copysign.exe >src/math/copysign.err && echo successed ; echo || echo copysign failed ; echo
# echo copysignf
# src/common/runtest.exe -w '' src/math/copysignf.exe >src/math/copysignf.err && echo successed ; echo || echo copysignf failed ; echo
# echo copysignl
# src/common/runtest.exe -w '' src/math/copysignl.exe >src/math/copysignl.err && echo successed ; echo || echo copysignl failed ; echo
echo cos
src/common/runtest.exe -w '' src/math/cos.exe >src/math/cos.err && echo successed ; echo || echo cos failed ; echo
echo cosf
src/common/runtest.exe -w '' src/math/cosf.exe >src/math/cosf.err && echo successed ; echo || echo cosf failed ; echo
echo cosh
src/common/runtest.exe -w '' src/math/cosh.exe >src/math/cosh.err && echo successed ; echo || echo cosh failed ; echo
echo coshf
src/common/runtest.exe -w '' src/math/coshf.exe >src/math/coshf.err && echo successed ; echo || echo coshf failed ; echo
echo coshl
src/common/runtest.exe -w '' src/math/coshl.exe >src/math/coshl.err && echo successed ; echo || echo coshl failed ; echo
echo cosl
src/common/runtest.exe -w '' src/math/cosl.exe >src/math/cosl.err && echo successed ; echo || echo cosl failed ; echo
echo drem
src/common/runtest.exe -w '' src/math/drem.exe >src/math/drem.err && echo successed ; echo || echo drem failed ; echo
echo dremf
src/common/runtest.exe -w '' src/math/dremf.exe >src/math/dremf.err && echo successed ; echo || echo dremf failed ; echo
# echo erf
# src/common/runtest.exe -w '' src/math/erf.exe >src/math/erf.err && echo successed ; echo || echo erf failed ; echo
# echo erfc
# src/common/runtest.exe -w '' src/math/erfc.exe >src/math/erfc.err && echo successed ; echo || echo erfc failed ; echo
# echo erfcf
# src/common/runtest.exe -w '' src/math/erfcf.exe >src/math/erfcf.err && echo successed ; echo || echo erfcf failed ; echo
# echo erfcl
# src/common/runtest.exe -w '' src/math/erfcl.exe >src/math/erfcl.err && echo successed ; echo || echo erfcl failed ; echo
# echo erff
# src/common/runtest.exe -w '' src/math/erff.exe >src/math/erff.err && echo successed ; echo || echo erff failed ; echo
# echo erfl
# src/common/runtest.exe -w '' src/math/erfl.exe >src/math/erfl.err && echo successed ; echo || echo erfl failed ; echo
echo exp
src/common/runtest.exe -w '' src/math/exp.exe >src/math/exp.err && echo successed ; echo || echo exp failed ; echo
# echo exp10
# src/common/runtest.exe -w '' src/math/exp10.exe >src/math/exp10.err && echo successed ; echo || echo exp10 failed ; echo
# echo exp10f
# src/common/runtest.exe -w '' src/math/exp10f.exe >src/math/exp10f.err && echo successed ; echo || echo exp10f failed ; echo
echo exp10l
src/common/runtest.exe -w '' src/math/exp10l.exe >src/math/exp10l.err && echo successed ; echo || echo exp10l failed ; echo
echo exp2
src/common/runtest.exe -w '' src/math/exp2.exe >src/math/exp2.err && echo successed ; echo || echo exp2 failed ; echo
echo exp2f
src/common/runtest.exe -w '' src/math/exp2f.exe >src/math/exp2f.err && echo successed ; echo || echo exp2f failed ; echo
echo exp2l
src/common/runtest.exe -w '' src/math/exp2l.exe >src/math/exp2l.err && echo successed ; echo || echo exp2l failed ; echo
echo expf
src/common/runtest.exe -w '' src/math/expf.exe >src/math/expf.err && echo successed ; echo || echo expf failed ; echo
echo expl
src/common/runtest.exe -w '' src/math/expl.exe >src/math/expl.err && echo successed ; echo || echo expl failed ; echo
echo expm1
src/common/runtest.exe -w '' src/math/expm1.exe >src/math/expm1.err && echo successed ; echo || echo expm1 failed ; echo
# echo expm1f
# src/common/runtest.exe -w '' src/math/expm1f.exe >src/math/expm1f.err && echo successed ; echo || echo expm1f failed ; echo
echo expm1l
src/common/runtest.exe -w '' src/math/expm1l.exe >src/math/expm1l.err && echo successed ; echo || echo expm1l failed ; echo
# echo fabs
# src/common/runtest.exe -w '' src/math/fabs.exe >src/math/fabs.err && echo successed ; echo || echo fabs failed ; echo
# echo fabsf
# src/common/runtest.exe -w '' src/math/fabsf.exe >src/math/fabsf.err && echo successed ; echo || echo fabsf failed ; echo
# echo fabsl
# src/common/runtest.exe -w '' src/math/fabsl.exe >src/math/fabsl.err && echo successed ; echo || echo fabsl failed ; echo
echo fdim
src/common/runtest.exe -w '' src/math/fdim.exe >src/math/fdim.err && echo successed ; echo || echo fdim failed ; echo
echo fdimf
src/common/runtest.exe -w '' src/math/fdimf.exe >src/math/fdimf.err && echo successed ; echo || echo fdimf failed ; echo
echo fdiml
src/common/runtest.exe -w '' src/math/fdiml.exe >src/math/fdiml.err && echo successed ; echo || echo fdiml failed ; echo
# echo fenv
# src/common/runtest.exe -w '' src/math/fenv.exe >src/math/fenv.err && echo successed ; echo || echo fenv failed ; echo
# echo floor
# src/common/runtest.exe -w '' src/math/floor.exe >src/math/floor.err && echo successed ; echo || echo floor failed ; echo
# echo floorf
# src/common/runtest.exe -w '' src/math/floorf.exe >src/math/floorf.err && echo successed ; echo || echo floorf failed ; echo
# echo floorl
# src/common/runtest.exe -w '' src/math/floorl.exe >src/math/floorl.err && echo successed ; echo || echo floorl failed ; echo
echo fma
src/common/runtest.exe -w '' src/math/fma.exe >src/math/fma.err && echo successed ; echo || echo fma failed ; echo
echo fmaf
src/common/runtest.exe -w '' src/math/fmaf.exe >src/math/fmaf.err && echo successed ; echo || echo fmaf failed ; echo
echo fmal
src/common/runtest.exe -w '' src/math/fmal.exe >src/math/fmal.err && echo successed ; echo || echo fmal failed ; echo
# echo fmax
# src/common/runtest.exe -w '' src/math/fmax.exe >src/math/fmax.err && echo successed ; echo || echo fmax failed ; echo
# echo fmaxf
# src/common/runtest.exe -w '' src/math/fmaxf.exe >src/math/fmaxf.err && echo successed ; echo || echo fmaxf failed ; echo
# echo fmaxl
# src/common/runtest.exe -w '' src/math/fmaxl.exe >src/math/fmaxl.err && echo successed ; echo || echo fmaxl failed ; echo
# echo fmin
# src/common/runtest.exe -w '' src/math/fmin.exe >src/math/fmin.err && echo successed ; echo || echo fmin failed ; echo
# echo fminf
# src/common/runtest.exe -w '' src/math/fminf.exe >src/math/fminf.err && echo successed ; echo || echo fminf failed ; echo
# echo fminl
# src/common/runtest.exe -w '' src/math/fminl.exe >src/math/fminl.err && echo successed ; echo || echo fminl failed ; echo
echo fmod
src/common/runtest.exe -w '' src/math/fmod.exe >src/math/fmod.err && echo successed ; echo || echo fmod failed ; echo
echo fmodf
src/common/runtest.exe -w '' src/math/fmodf.exe >src/math/fmodf.err && echo successed ; echo || echo fmodf failed ; echo
echo fmodl
src/common/runtest.exe -w '' src/math/fmodl.exe >src/math/fmodl.err && echo successed ; echo || echo fmodl failed ; echo
# echo fpclassify
# src/common/runtest.exe -w '' src/math/fpclassify.exe >src/math/fpclassify.err && echo successed ; echo || echo fpclassify failed ; echo
# echo frexp
# src/common/runtest.exe -w '' src/math/frexp.exe >src/math/frexp.err && echo successed ; echo || echo frexp failed ; echo
# echo frexpf
# src/common/runtest.exe -w '' src/math/frexpf.exe >src/math/frexpf.err && echo successed ; echo || echo frexpf failed ; echo
# echo frexpl
# src/common/runtest.exe -w '' src/math/frexpl.exe >src/math/frexpl.err && echo successed ; echo || echo frexpl failed ; echo
echo hypot
src/common/runtest.exe -w '' src/math/hypot.exe >src/math/hypot.err && echo successed ; echo || echo hypot failed ; echo
echo hypotf
src/common/runtest.exe -w '' src/math/hypotf.exe >src/math/hypotf.err && echo successed ; echo || echo hypotf failed ; echo
echo hypotl
src/common/runtest.exe -w '' src/math/hypotl.exe >src/math/hypotl.err && echo successed ; echo || echo hypotl failed ; echo
echo ilogb
src/common/runtest.exe -w '' src/math/ilogb.exe >src/math/ilogb.err && echo successed ; echo || echo ilogb failed ; echo
echo ilogbf
src/common/runtest.exe -w '' src/math/ilogbf.exe >src/math/ilogbf.err && echo successed ; echo || echo ilogbf failed ; echo
echo ilogbl
src/common/runtest.exe -w '' src/math/ilogbl.exe >src/math/ilogbl.err && echo successed ; echo || echo ilogbl failed ; echo
# echo isless
# src/common/runtest.exe -w '' src/math/isless.exe >src/math/isless.err && echo successed ; echo || echo isless failed ; echo
# echo j0
# src/common/runtest.exe -w '' src/math/j0.exe >src/math/j0.err && echo successed ; echo || echo j0 failed ; echo
# echo j0f
# src/common/runtest.exe -w '' src/math/j0f.exe >src/math/j0f.err && echo successed ; echo || echo j0f failed ; echo
# echo j1
# src/common/runtest.exe -w '' src/math/j1.exe >src/math/j1.err && echo successed ; echo || echo j1 failed ; echo
# echo j1f
# src/common/runtest.exe -w '' src/math/j1f.exe >src/math/j1f.err && echo successed ; echo || echo j1f failed ; echo
# echo jn
# src/common/runtest.exe -w '' src/math/jn.exe >src/math/jn.err && echo successed ; echo || echo jn failed ; echo
# echo jnf
# src/common/runtest.exe -w '' src/math/jnf.exe >src/math/jnf.err && echo successed ; echo || echo jnf failed ; echo
echo ldexp
src/common/runtest.exe -w '' src/math/ldexp.exe >src/math/ldexp.err && echo successed ; echo || echo ldexp failed ; echo
echo ldexpf
src/common/runtest.exe -w '' src/math/ldexpf.exe >src/math/ldexpf.err && echo successed ; echo || echo ldexpf failed ; echo
echo ldexpl
src/common/runtest.exe -w '' src/math/ldexpl.exe >src/math/ldexpl.err && echo successed ; echo || echo ldexpl failed ; echo
echo lgamma
src/common/runtest.exe -w '' src/math/lgamma.exe >src/math/lgamma.err && echo successed ; echo || echo lgamma failed ; echo
echo lgamma_r
src/common/runtest.exe -w '' src/math/lgamma_r.exe >src/math/lgamma_r.err && echo successed ; echo || echo lgamma_r failed ; echo
echo lgammaf
src/common/runtest.exe -w '' src/math/lgammaf.exe >src/math/lgammaf.err && echo successed ; echo || echo lgammaf failed ; echo
echo lgammaf_r
src/common/runtest.exe -w '' src/math/lgammaf_r.exe >src/math/lgammaf_r.err && echo successed ; echo || echo lgammaf_r failed ; echo
echo lgammal
src/common/runtest.exe -w '' src/math/lgammal.exe >src/math/lgammal.err && echo successed ; echo || echo lgammal failed ; echo
echo lgammal_r
src/common/runtest.exe -w '' src/math/lgammal_r.exe >src/math/lgammal_r.err && echo successed ; echo || echo lgammal_r failed ; echo
echo llrint
src/common/runtest.exe -w '' src/math/llrint.exe >src/math/llrint.err && echo successed ; echo || echo llrint failed ; echo
echo llrintf
src/common/runtest.exe -w '' src/math/llrintf.exe >src/math/llrintf.err && echo successed ; echo || echo llrintf failed ; echo
echo llrintl
src/common/runtest.exe -w '' src/math/llrintl.exe >src/math/llrintl.err && echo successed ; echo || echo llrintl failed ; echo
echo llround
src/common/runtest.exe -w '' src/math/llround.exe >src/math/llround.err && echo successed ; echo || echo llround failed ; echo
echo llroundf
src/common/runtest.exe -w '' src/math/llroundf.exe >src/math/llroundf.err && echo successed ; echo || echo llroundf failed ; echo
echo llroundl
src/common/runtest.exe -w '' src/math/llroundl.exe >src/math/llroundl.err && echo successed ; echo || echo llroundl failed ; echo
echo log
src/common/runtest.exe -w '' src/math/log.exe >src/math/log.err && echo successed ; echo || echo log failed ; echo
echo log10
src/common/runtest.exe -w '' src/math/log10.exe >src/math/log10.err && echo successed ; echo || echo log10 failed ; echo
echo log10f
src/common/runtest.exe -w '' src/math/log10f.exe >src/math/log10f.err && echo successed ; echo || echo log10f failed ; echo
echo log10l
src/common/runtest.exe -w '' src/math/log10l.exe >src/math/log10l.err && echo successed ; echo || echo log10l failed ; echo
echo log1p
src/common/runtest.exe -w '' src/math/log1p.exe >src/math/log1p.err && echo successed ; echo || echo log1p failed ; echo
echo log1pf
src/common/runtest.exe -w '' src/math/log1pf.exe >src/math/log1pf.err && echo successed ; echo || echo log1pf failed ; echo
echo log1pl
src/common/runtest.exe -w '' src/math/log1pl.exe >src/math/log1pl.err && echo successed ; echo || echo log1pl failed ; echo
echo log2
src/common/runtest.exe -w '' src/math/log2.exe >src/math/log2.err && echo successed ; echo || echo log2 failed ; echo
echo log2f
src/common/runtest.exe -w '' src/math/log2f.exe >src/math/log2f.err && echo successed ; echo || echo log2f failed ; echo
echo log2l
src/common/runtest.exe -w '' src/math/log2l.exe >src/math/log2l.err && echo successed ; echo || echo log2l failed ; echo
echo logb
src/common/runtest.exe -w '' src/math/logb.exe >src/math/logb.err && echo successed ; echo || echo logb failed ; echo
echo logbf
src/common/runtest.exe -w '' src/math/logbf.exe >src/math/logbf.err && echo successed ; echo || echo logbf failed ; echo
echo logbl
src/common/runtest.exe -w '' src/math/logbl.exe >src/math/logbl.err && echo successed ; echo || echo logbl failed ; echo
echo logf
src/common/runtest.exe -w '' src/math/logf.exe >src/math/logf.err && echo successed ; echo || echo logf failed ; echo
echo logl
src/common/runtest.exe -w '' src/math/logl.exe >src/math/logl.err && echo successed ; echo || echo logl failed ; echo
echo lrint
src/common/runtest.exe -w '' src/math/lrint.exe >src/math/lrint.err && echo successed ; echo || echo lrint failed ; echo
echo lrintf
src/common/runtest.exe -w '' src/math/lrintf.exe >src/math/lrintf.err && echo successed ; echo || echo lrintf failed ; echo
echo lrintl
src/common/runtest.exe -w '' src/math/lrintl.exe >src/math/lrintl.err && echo successed ; echo || echo lrintl failed ; echo
echo lround
src/common/runtest.exe -w '' src/math/lround.exe >src/math/lround.err && echo successed ; echo || echo lround failed ; echo
echo lroundf
src/common/runtest.exe -w '' src/math/lroundf.exe >src/math/lroundf.err && echo successed ; echo || echo lroundf failed ; echo
echo lroundl
src/common/runtest.exe -w '' src/math/lroundl.exe >src/math/lroundl.err && echo successed ; echo || echo lroundl failed ; echo
# echo modf
# src/common/runtest.exe -w '' src/math/modf.exe >src/math/modf.err && echo successed ; echo || echo modf failed ; echo
# echo modff
# src/common/runtest.exe -w '' src/math/modff.exe >src/math/modff.err && echo successed ; echo || echo modff failed ; echo
# echo modfl
# src/common/runtest.exe -w '' src/math/modfl.exe >src/math/modfl.err && echo successed ; echo || echo modfl failed ; echo
# echo nearbyint
# src/common/runtest.exe -w '' src/math/nearbyint.exe >src/math/nearbyint.err && echo successed ; echo || echo nearbyint failed ; echo
# echo nearbyintf
# src/common/runtest.exe -w '' src/math/nearbyintf.exe >src/math/nearbyintf.err && echo successed ; echo || echo nearbyintf failed ; echo
# echo nearbyintl
# src/common/runtest.exe -w '' src/math/nearbyintl.exe >src/math/nearbyintl.err && echo successed ; echo || echo nearbyintl failed ; echo
echo nextafter
src/common/runtest.exe -w '' src/math/nextafter.exe >src/math/nextafter.err && echo successed ; echo || echo nextafter failed ; echo
echo nextafterf
src/common/runtest.exe -w '' src/math/nextafterf.exe >src/math/nextafterf.err && echo successed ; echo || echo nextafterf failed ; echo
echo nextafterl
src/common/runtest.exe -w '' src/math/nextafterl.exe >src/math/nextafterl.err && echo successed ; echo || echo nextafterl failed ; echo
echo nexttoward
src/common/runtest.exe -w '' src/math/nexttoward.exe >src/math/nexttoward.err && echo successed ; echo || echo nexttoward failed ; echo
echo nexttowardf
src/common/runtest.exe -w '' src/math/nexttowardf.exe >src/math/nexttowardf.err && echo successed ; echo || echo nexttowardf failed ; echo
echo nexttowardl
src/common/runtest.exe -w '' src/math/nexttowardl.exe >src/math/nexttowardl.err && echo successed ; echo || echo nexttowardl failed ; echo
echo pow
src/common/runtest.exe -w '' src/math/pow.exe >src/math/pow.err && echo successed ; echo || echo pow failed ; echo
# echo pow10
# src/common/runtest.exe -w '' src/math/pow10.exe >src/math/pow10.err && echo successed ; echo || echo pow10 failed ; echo
# echo pow10f
# src/common/runtest.exe -w '' src/math/pow10f.exe >src/math/pow10f.err && echo successed ; echo || echo pow10f failed ; echo
echo pow10l
src/common/runtest.exe -w '' src/math/pow10l.exe >src/math/pow10l.err && echo successed ; echo || echo pow10l failed ; echo
echo powf
src/common/runtest.exe -w '' src/math/powf.exe >src/math/powf.err && echo successed ; echo || echo powf failed ; echo
echo powl
src/common/runtest.exe -w '' src/math/powl.exe >src/math/powl.err && echo successed ; echo || echo powl failed ; echo
echo remainder
src/common/runtest.exe -w '' src/math/remainder.exe >src/math/remainder.err && echo successed ; echo || echo remainder failed ; echo
echo remainderf
src/common/runtest.exe -w '' src/math/remainderf.exe >src/math/remainderf.err && echo successed ; echo || echo remainderf failed ; echo
echo remainderl
src/common/runtest.exe -w '' src/math/remainderl.exe >src/math/remainderl.err && echo successed ; echo || echo remainderl failed ; echo
echo remquo
src/common/runtest.exe -w '' src/math/remquo.exe >src/math/remquo.err && echo successed ; echo || echo remquo failed ; echo
echo remquof
src/common/runtest.exe -w '' src/math/remquof.exe >src/math/remquof.err && echo successed ; echo || echo remquof failed ; echo
echo remquol
src/common/runtest.exe -w '' src/math/remquol.exe >src/math/remquol.err && echo successed ; echo || echo remquol failed ; echo
echo rint
src/common/runtest.exe -w '' src/math/rint.exe >src/math/rint.err && echo successed ; echo || echo rint failed ; echo
echo rintf
src/common/runtest.exe -w '' src/math/rintf.exe >src/math/rintf.err && echo successed ; echo || echo rintf failed ; echo
echo rintl
src/common/runtest.exe -w '' src/math/rintl.exe >src/math/rintl.err && echo successed ; echo || echo rintl failed ; echo
# echo round
# src/common/runtest.exe -w '' src/math/round.exe >src/math/round.err && echo successed ; echo || echo round failed ; echo
# echo roundf
# src/common/runtest.exe -w '' src/math/roundf.exe >src/math/roundf.err && echo successed ; echo || echo roundf failed ; echo
# echo roundl
# src/common/runtest.exe -w '' src/math/roundl.exe >src/math/roundl.err && echo successed ; echo || echo roundl failed ; echo
echo scalb
src/common/runtest.exe -w '' src/math/scalb.exe >src/math/scalb.err && echo successed ; echo || echo scalb failed ; echo
echo scalbf
src/common/runtest.exe -w '' src/math/scalbf.exe >src/math/scalbf.err && echo successed ; echo || echo scalbf failed ; echo
echo scalbln
src/common/runtest.exe -w '' src/math/scalbln.exe >src/math/scalbln.err && echo successed ; echo || echo scalbln failed ; echo
echo scalblnf
src/common/runtest.exe -w '' src/math/scalblnf.exe >src/math/scalblnf.err && echo successed ; echo || echo scalblnf failed ; echo
echo scalblnl
src/common/runtest.exe -w '' src/math/scalblnl.exe >src/math/scalblnl.err && echo successed ; echo || echo scalblnl failed ; echo
echo scalbn
src/common/runtest.exe -w '' src/math/scalbn.exe >src/math/scalbn.err && echo successed ; echo || echo scalbn failed ; echo
echo scalbnf
src/common/runtest.exe -w '' src/math/scalbnf.exe >src/math/scalbnf.err && echo successed ; echo || echo scalbnf failed ; echo
echo scalbnl
src/common/runtest.exe -w '' src/math/scalbnl.exe >src/math/scalbnl.err && echo successed ; echo || echo scalbnl failed ; echo
echo sin
src/common/runtest.exe -w '' src/math/sin.exe >src/math/sin.err && echo successed ; echo || echo sin failed ; echo
echo sincos
src/common/runtest.exe -w '' src/math/sincos.exe >src/math/sincos.err && echo successed ; echo || echo sincos failed ; echo
echo sincosf
src/common/runtest.exe -w '' src/math/sincosf.exe >src/math/sincosf.err && echo successed ; echo || echo sincosf failed ; echo
echo sincosl
src/common/runtest.exe -w '' src/math/sincosl.exe >src/math/sincosl.err && echo successed ; echo || echo sincosl failed ; echo
echo sinf
src/common/runtest.exe -w '' src/math/sinf.exe >src/math/sinf.err && echo successed ; echo || echo sinf failed ; echo
echo sinh
src/common/runtest.exe -w '' src/math/sinh.exe >src/math/sinh.err && echo successed ; echo || echo sinh failed ; echo
echo sinhf
src/common/runtest.exe -w '' src/math/sinhf.exe >src/math/sinhf.err && echo successed ; echo || echo sinhf failed ; echo
echo sinhl
src/common/runtest.exe -w '' src/math/sinhl.exe >src/math/sinhl.err && echo successed ; echo || echo sinhl failed ; echo
echo sinl
src/common/runtest.exe -w '' src/math/sinl.exe >src/math/sinl.err && echo successed ; echo || echo sinl failed ; echo
echo sqrt
src/common/runtest.exe -w '' src/math/sqrt.exe >src/math/sqrt.err && echo successed ; echo || echo sqrt failed ; echo
echo sqrtf
src/common/runtest.exe -w '' src/math/sqrtf.exe >src/math/sqrtf.err && echo successed ; echo || echo sqrtf failed ; echo
echo sqrtl
src/common/runtest.exe -w '' src/math/sqrtl.exe >src/math/sqrtl.err && echo successed ; echo || echo sqrtl failed ; echo
echo tan
src/common/runtest.exe -w '' src/math/tan.exe >src/math/tan.err && echo successed ; echo || echo tan failed ; echo
echo tanf
src/common/runtest.exe -w '' src/math/tanf.exe >src/math/tanf.err && echo successed ; echo || echo tanf failed ; echo
echo tanh
src/common/runtest.exe -w '' src/math/tanh.exe >src/math/tanh.err && echo successed ; echo || echo tanh failed ; echo
echo tanhf
src/common/runtest.exe -w '' src/math/tanhf.exe >src/math/tanhf.err && echo successed ; echo || echo tanhf failed ; echo
echo tanhl
src/common/runtest.exe -w '' src/math/tanhl.exe >src/math/tanhl.err && echo successed ; echo || echo tanhl failed ; echo
echo tanl
src/common/runtest.exe -w '' src/math/tanl.exe >src/math/tanl.err && echo successed ; echo || echo tanl failed ; echo
echo tgamma
src/common/runtest.exe -w '' src/math/tgamma.exe >src/math/tgamma.err && echo successed ; echo || echo tgamma failed ; echo
echo tgammaf
src/common/runtest.exe -w '' src/math/tgammaf.exe >src/math/tgammaf.err && echo successed ; echo || echo tgammaf failed ; echo
echo tgammal
src/common/runtest.exe -w '' src/math/tgammal.exe >src/math/tgammal.err && echo successed ; echo || echo tgammal failed ; echo
# echo trunc
# src/common/runtest.exe -w '' src/math/trunc.exe >src/math/trunc.err && echo successed ; echo || echo trunc failed ; echo
# echo truncf
# src/common/runtest.exe -w '' src/math/truncf.exe >src/math/truncf.err && echo successed ; echo || echo truncf failed ; echo
# echo truncl
# src/common/runtest.exe -w '' src/math/truncl.exe >src/math/truncl.err && echo successed ; echo || echo truncl failed ; echo
echo y0
src/common/runtest.exe -w '' src/math/y0.exe >src/math/y0.err && echo successed ; echo || echo y0 failed ; echo
echo y0f
src/common/runtest.exe -w '' src/math/y0f.exe >src/math/y0f.err && echo successed ; echo || echo y0f failed ; echo
echo y1
src/common/runtest.exe -w '' src/math/y1.exe >src/math/y1.err && echo successed ; echo || echo y1 failed ; echo
echo y1f
src/common/runtest.exe -w '' src/math/y1f.exe >src/math/y1f.err && echo successed ; echo || echo y1f failed ; echo
echo yn
src/common/runtest.exe -w '' src/math/yn.exe >src/math/yn.err && echo successed ; echo || echo yn failed ; echo
echo ynf
src/common/runtest.exe -w '' src/math/ynf.exe >src/math/ynf.err && echo successed ; echo || echo ynf failed ; echo
# echo pleval-static
# src/common/runtest.exe -w '' src/musl/pleval-static.exe >src/musl/pleval-static.err && echo successed ; echo || echo pleval-static failed ; echo
echo daemon-failure
src/common/runtest.exe -w '' src/regression/daemon-failure.exe >src/regression/daemon-failure.err && echo successed ; echo || echo daemon-failure failed ; echo
# echo dn_expand-empty
# src/common/runtest.exe -w '' src/regression/dn_expand-empty.exe >src/regression/dn_expand-empty.err && echo successed ; echo || echo dn_expand-empty failed ; echo
# echo dn_expand-ptr-0
# src/common/runtest.exe -w '' src/regression/dn_expand-ptr-0.exe >src/regression/dn_expand-ptr-0.err && echo successed ; echo || echo dn_expand-ptr-0 failed ; echo
# echo execle-env
# src/common/runtest.exe -w '' src/regression/execle-env.exe >src/regression/execle-env.err && echo successed ; echo || echo execle-env failed ; echo
echo fflush-exit
src/common/runtest.exe -w '' src/regression/fflush-exit.exe >src/regression/fflush-exit.err && echo successed ; echo || echo fflush-exit failed ; echo
# echo fgets-eof
# src/common/runtest.exe -w '' src/regression/fgets-eof.exe >src/regression/fgets-eof.err && echo successed ; echo || echo fgets-eof failed ; echo
echo fgetwc-buffering
src/common/runtest.exe -w '' src/regression/fgetwc-buffering.exe >src/regression/fgetwc-buffering.err && echo successed ; echo || echo fgetwc-buffering failed ; echo



# echo fpclassify-invalid-ld80
# src/common/runtest.exe -w '' src/regression/fpclassify-invalid-ld80.exe >src/regression/fpclassify-invalid-ld80.err && echo successed ; echo || echo fpclassify-invalid-ld80 failed ; echo
# echo ftello-unflushed-append
# src/common/runtest.exe -w '' src/regression/ftello-unflushed-append.exe >src/regression/ftello-unflushed-append.err && echo successed ; echo || echo ftello-unflushed-append failed ; echo
# echo getpwnam_r-crash
# src/common/runtest.exe -w '' src/regression/getpwnam_r-crash.exe >src/regression/getpwnam_r-crash.err && echo successed ; echo || echo getpwnam_r-crash failed ; echo
# echo getpwnam_r-errno
# src/common/runtest.exe -w '' src/regression/getpwnam_r-errno.exe >src/regression/getpwnam_r-errno.err && echo successed ; echo || echo getpwnam_r-errno failed ; echo
# echo iconv-roundtrips
# src/common/runtest.exe -w '' src/regression/iconv-roundtrips.exe >src/regression/iconv-roundtrips.err && echo successed ; echo || echo iconv-roundtrips failed ; echo
# echo inet_ntop-v4mapped
# src/common/runtest.exe -w '' src/regression/inet_ntop-v4mapped.exe >src/regression/inet_ntop-v4mapped.err && echo successed ; echo || echo inet_ntop-v4mapped failed ; echo
# echo inet_pton-empty-last-field
# src/common/runtest.exe -w '' src/regression/inet_pton-empty-last-field.exe >src/regression/inet_pton-empty-last-field.err && echo successed ; echo || echo inet_pton-empty-last-field failed ; echo
# echo iswspace-null
# src/common/runtest.exe -w '' src/regression/iswspace-null.exe >src/regression/iswspace-null.err && echo successed ; echo || echo iswspace-null failed ; echo
# echo lrand48-signextend
# src/common/runtest.exe -w '' src/regression/lrand48-signextend.exe >src/regression/lrand48-signextend.err && echo successed ; echo || echo lrand48-signextend failed ; echo
# echo lseek-large
# src/common/runtest.exe -w '' src/regression/lseek-large.exe >src/regression/lseek-large.err && echo successed ; echo || echo lseek-large failed ; echo
# echo malloc-0
# src/common/runtest.exe -w '' src/regression/malloc-0.exe >src/regression/malloc-0.err && echo successed ; echo || echo malloc-0 failed ; echo



# echo mbsrtowcs-overflow
# src/common/runtest.exe -w '' src/regression/mbsrtowcs-overflow.exe >src/regression/mbsrtowcs-overflow.err && echo successed ; echo || echo mbsrtowcs-overflow failed ; echo
# echo memmem-oob-read
# src/common/runtest.exe -w '' src/regression/memmem-oob-read.exe >src/regression/memmem-oob-read.err && echo successed ; echo || echo memmem-oob-read failed ; echo
# echo memmem-oob
# src/common/runtest.exe -w '' src/regression/memmem-oob.exe >src/regression/memmem-oob.err && echo successed ; echo || echo memmem-oob failed ; echo
# echo mkdtemp-failure
# src/common/runtest.exe -w '' src/regression/mkdtemp-failure.exe >src/regression/mkdtemp-failure.err && echo successed ; echo || echo mkdtemp-failure failed ; echo
# echo mkstemp-failure
# src/common/runtest.exe -w '' src/regression/mkstemp-failure.exe >src/regression/mkstemp-failure.err && echo successed ; echo || echo mkstemp-failure failed ; echo
# echo printf-1e9-oob
# src/common/runtest.exe -w '' src/regression/printf-1e9-oob.exe >src/regression/printf-1e9-oob.err && echo successed ; echo || echo printf-1e9-oob failed ; echo
# echo printf-fmt-g-round
# src/common/runtest.exe -w '' src/regression/printf-fmt-g-round.exe >src/regression/printf-fmt-g-round.err && echo successed ; echo || echo printf-fmt-g-round failed ; echo
# echo printf-fmt-g-zeros
# src/common/runtest.exe -w '' src/regression/printf-fmt-g-zeros.exe >src/regression/printf-fmt-g-zeros.err && echo successed ; echo || echo printf-fmt-g-zeros failed ; echo
# echo printf-fmt-n
# src/common/runtest.exe -w '' src/regression/printf-fmt-n.exe >src/regression/printf-fmt-n.err && echo successed ; echo || echo printf-fmt-n failed ; echo
echo pthread-robust-detach
src/common/runtest.exe -w '' src/regression/pthread-robust-detach.exe >src/regression/pthread-robust-detach.err && echo successed ; echo || echo pthread-robust-detach failed ; echo
echo pthread_atfork-errno-clobber
src/common/runtest.exe -w '' src/regression/pthread_atfork-errno-clobber.exe >src/regression/pthread_atfork-errno-clobber.err && echo successed ; echo || echo pthread_atfork-errno-clobber failed ; echo
# echo pthread_cancel-sem_wait
# src/common/runtest.exe -w '' src/regression/pthread_cancel-sem_wait.exe >src/regression/pthread_cancel-sem_wait.err && echo successed ; echo || echo pthread_cancel-sem_wait failed ; echo


# echo pthread_exit-cancel
# src/common/runtest.exe -w '' src/regression/pthread_exit-cancel.exe >src/regression/pthread_exit-cancel.err && echo successed ; echo || echo pthread_exit-cancel failed ; echo
echo pthread_exit-dtor
src/common/runtest.exe -w '' src/regression/pthread_exit-dtor.exe >src/regression/pthread_exit-dtor.err && echo successed ; echo || echo pthread_exit-dtor failed ; echo
# echo pthread_once-deadlock
# src/common/runtest.exe -w '' src/regression/pthread_once-deadlock.exe >src/regression/pthread_once-deadlock.err && echo successed ; echo || echo pthread_once-deadlock failed ; echo
# echo pthread_rwlock-ebusy
# src/common/runtest.exe -w '' src/regression/pthread_rwlock-ebusy.exe >src/regression/pthread_rwlock-ebusy.err && echo successed ; echo || echo pthread_rwlock-ebusy failed ; echo
# echo putenv-doublefree
# src/common/runtest.exe -w '' src/regression/putenv-doublefree.exe >src/regression/putenv-doublefree.err && echo successed ; echo || echo putenv-doublefree failed ; echo



# echo regex-backref-0
# src/common/runtest.exe -w '' src/regression/regex-backref-0.exe >src/regression/regex-backref-0.err && echo successed ; echo || echo regex-backref-0 failed ; echo
# echo regex-bracket-icase
# src/common/runtest.exe -w '' src/regression/regex-bracket-icase.exe >src/regression/regex-bracket-icase.err && echo successed ; echo || echo regex-bracket-icase failed ; echo
# echo regex-ere-backref
# src/common/runtest.exe -w '' src/regression/regex-ere-backref.exe >src/regression/regex-ere-backref.err && echo successed ; echo || echo regex-ere-backref failed ; echo
# echo regex-escaped-high-byte
# src/common/runtest.exe -w '' src/regression/regex-escaped-high-byte.exe >src/regression/regex-escaped-high-byte.err && echo successed ; echo || echo regex-escaped-high-byte failed ; echo
# echo regex-negated-range
# src/common/runtest.exe -w '' src/regression/regex-negated-range.exe >src/regression/regex-negated-range.err && echo successed ; echo || echo regex-negated-range failed ; echo
# echo regexec-nosub
# src/common/runtest.exe -w '' src/regression/regexec-nosub.exe >src/regression/regexec-nosub.err && echo successed ; echo || echo regexec-nosub failed ; echo
echo rewind-clear-error
src/common/runtest.exe -w '' src/regression/rewind-clear-error.exe >src/regression/rewind-clear-error.err && echo successed ; echo || echo rewind-clear-error failed ; echo
echo rlimit-open-files
src/common/runtest.exe -w '' src/regression/rlimit-open-files.exe >src/regression/rlimit-open-files.err && echo successed ; echo || echo rlimit-open-files failed ; echo
# echo scanf-bytes-consumed
# src/common/runtest.exe -w '' src/regression/scanf-bytes-consumed.exe >src/regression/scanf-bytes-consumed.err && echo successed ; echo || echo scanf-bytes-consumed failed ; echo
# echo scanf-match-literal-eof
# src/common/runtest.exe -w '' src/regression/scanf-match-literal-eof.exe >src/regression/scanf-match-literal-eof.err && echo successed ; echo || echo scanf-match-literal-eof failed ; echo
# echo scanf-nullbyte-char
# src/common/runtest.exe -w '' src/regression/scanf-nullbyte-char.exe >src/regression/scanf-nullbyte-char.err && echo successed ; echo || echo scanf-nullbyte-char failed ; echo



# echo setvbuf-unget
# src/common/runtest.exe -w '' src/regression/setvbuf-unget.exe >src/regression/setvbuf-unget.err && echo successed ; echo || echo setvbuf-unget failed ; echo
# echo sigaltstack
# src/common/runtest.exe -w '' src/regression/sigaltstack.exe >src/regression/sigaltstack.err && echo successed ; echo || echo sigaltstack failed ; echo
# echo sigprocmask-internal
# src/common/runtest.exe -w '' src/regression/sigprocmask-internal.exe >src/regression/sigprocmask-internal.err && echo successed ; echo || echo sigprocmask-internal failed ; echo
echo sigreturn
src/common/runtest.exe -w '' src/regression/sigreturn.exe >src/regression/sigreturn.err && echo successed ; echo || echo sigreturn failed ; echo
# echo sscanf-eof
# src/common/runtest.exe -w '' src/regression/sscanf-eof.exe >src/regression/sscanf-eof.err && echo successed ; echo || echo sscanf-eof failed ; echo
echo statvfs
src/common/runtest.exe -w '' src/regression/statvfs.exe >src/regression/statvfs.err && echo successed ; echo || echo statvfs failed ; echo
# echo strverscmp
# src/common/runtest.exe -w '' src/regression/strverscmp.exe >src/regression/strverscmp.err && echo successed ; echo || echo strverscmp failed ; echo
# echo syscall-sign-extend
# src/common/runtest.exe -w '' src/regression/syscall-sign-extend.exe >src/regression/syscall-sign-extend.err && echo successed ; echo || echo syscall-sign-extend failed ; echo
echo tls_get_new-dtv
src/common/runtest.exe -w '' src/regression/tls_get_new-dtv.exe >src/regression/tls_get_new-dtv.err && echo successed ; echo || echo tls_get_new-dtv failed ; echo
# echo uselocale-0
# src/common/runtest.exe -w '' src/regression/uselocale-0.exe >src/regression/uselocale-0.err && echo successed ; echo || echo uselocale-0 failed ; echo
# echo wcsncpy-read-overflow
# src/common/runtest.exe -w '' src/regression/wcsncpy-read-overflow.exe >src/regression/wcsncpy-read-overflow.err && echo successed ; echo || echo wcsncpy-read-overflow failed ; echo
# echo wcsstr-false-negative
# src/common/runtest.exe -w '' src/regression/wcsstr-false-negative.exe >src/regression/wcsstr-false-negative.err && echo successed ; echo || echo wcsstr-false-negative failed ; echo



echo main
src/common/runtest.exe -w '' src/api/main.exe >src/api/main.err && echo successed ; echo || echo main failed ; echo



# echo argv-static
# src/common/runtest.exe -w '' src/functional/argv-static.exe >src/functional/argv-static.err && echo successed ; echo || echo argv-static failed ; echo
# echo basename-static
# src/common/runtest.exe -w '' src/functional/basename-static.exe >src/functional/basename-static.err && echo successed ; echo || echo basename-static failed ; echo
# echo clocale_mbfuncs-static
# src/common/runtest.exe -w '' src/functional/clocale_mbfuncs-static.exe >src/functional/clocale_mbfuncs-static.err && echo successed ; echo || echo clocale_mbfuncs-static failed ; echo
# echo clock_gettime-static
# src/common/runtest.exe -w '' src/functional/clock_gettime-static.exe >src/functional/clock_gettime-static.err && echo successed ; echo || echo clock_gettime-static failed ; echo
# echo crypt-static
# src/common/runtest.exe -w '' src/functional/crypt-static.exe >src/functional/crypt-static.err && echo successed ; echo || echo crypt-static failed ; echo
# echo dirname-static
# src/common/runtest.exe -w '' src/functional/dirname-static.exe >src/functional/dirname-static.err && echo successed ; echo || echo dirname-static failed ; echo
# echo env-static
# src/common/runtest.exe -w '' src/functional/env-static.exe >src/functional/env-static.err && echo successed ; echo || echo env-static failed ; echo
echo fcntl-static
src/common/runtest.exe -w '' src/functional/fcntl-static.exe >src/functional/fcntl-static.err && echo successed ; echo || echo fcntl-static failed ; echo
# echo fdopen-static
# src/common/runtest.exe -w '' src/functional/fdopen-static.exe >src/functional/fdopen-static.err && echo successed ; echo || echo fdopen-static failed ; echo
# echo fnmatch-static
# src/common/runtest.exe -w '' src/functional/fnmatch-static.exe >src/functional/fnmatch-static.err && echo successed ; echo || echo fnmatch-static failed ; echo
echo fscanf-static
src/common/runtest.exe -w '' src/functional/fscanf-static.exe >src/functional/fscanf-static.err && echo successed ; echo || echo fscanf-static failed ; echo
# echo fwscanf-static
# src/common/runtest.exe -w '' src/functional/fwscanf-static.exe >src/functional/fwscanf-static.err && echo successed ; echo || echo fwscanf-static failed ; echo
# echo iconv_open-static
# src/common/runtest.exe -w '' src/functional/iconv_open-static.exe >src/functional/iconv_open-static.err && echo successed ; echo || echo iconv_open-static failed ; echo
# echo inet_pton-static
# src/common/runtest.exe -w '' src/functional/inet_pton-static.exe >src/functional/inet_pton-static.err && echo successed ; echo || echo inet_pton-static failed ; echo
echo ipc_msg-static
src/common/runtest.exe -w '' src/functional/ipc_msg-static.exe >src/functional/ipc_msg-static.err && echo successed ; echo || echo ipc_msg-static failed ; echo


echo ipc_shm-static
src/common/runtest.exe -w '' src/functional/ipc_shm-static.exe >src/functional/ipc_shm-static.err && echo successed ; echo || echo ipc_shm-static failed ; echo
# echo mbc-static
# src/common/runtest.exe -w '' src/functional/mbc-static.exe >src/functional/mbc-static.err && echo successed ; echo || echo mbc-static failed ; echo
# echo memstream-static
# src/common/runtest.exe -w '' src/functional/memstream-static.exe >src/functional/memstream-static.err && echo successed ; echo || echo memstream-static failed ; echo
echo popen-static
src/common/runtest.exe -w '' src/functional/popen-static.exe >src/functional/popen-static.err && echo successed ; echo || echo popen-static failed ; echo
echo pthread_cancel-points-static
src/common/runtest.exe -w '' src/functional/pthread_cancel-points-static.exe >src/functional/pthread_cancel-points-static.err && echo successed ; echo || echo pthread_cancel-points-static failed ; echo




echo pthread_robust-static
src/common/runtest.exe -w '' src/functional/pthread_robust-static.exe >src/functional/pthread_robust-static.err && echo successed ; echo || echo pthread_robust-static failed ; echo
# echo pthread_tsd-static
# src/common/runtest.exe -w '' src/functional/pthread_tsd-static.exe >src/functional/pthread_tsd-static.err && echo successed ; echo || echo pthread_tsd-static failed ; echo
# echo qsort-static
# src/common/runtest.exe -w '' src/functional/qsort-static.exe >src/functional/qsort-static.err && echo successed ; echo || echo qsort-static failed ; echo
# echo random-static
# src/common/runtest.exe -w '' src/functional/random-static.exe >src/functional/random-static.err && echo successed ; echo || echo random-static failed ; echo
# echo search_hsearch-static
# src/common/runtest.exe -w '' src/functional/search_hsearch-static.exe >src/functional/search_hsearch-static.err && echo successed ; echo || echo search_hsearch-static failed ; echo
# echo search_insque-static
# src/common/runtest.exe -w '' src/functional/search_insque-static.exe >src/functional/search_insque-static.err && echo successed ; echo || echo search_insque-static failed ; echo
# echo search_lsearch-static
# src/common/runtest.exe -w '' src/functional/search_lsearch-static.exe >src/functional/search_lsearch-static.err && echo successed ; echo || echo search_lsearch-static failed ; echo
# echo search_tsearch-static
# src/common/runtest.exe -w '' src/functional/search_tsearch-static.exe >src/functional/search_tsearch-static.err && echo successed ; echo || echo search_tsearch-static failed ; echo




echo sem_open-static
src/common/runtest.exe -w '' src/functional/sem_open-static.exe >src/functional/sem_open-static.err && echo successed ; echo || echo sem_open-static failed ; echo
echo setjmp-static
src/common/runtest.exe -w '' src/functional/setjmp-static.exe >src/functional/setjmp-static.err && echo successed ; echo || echo setjmp-static failed ; echo
# echo snprintf-static
# src/common/runtest.exe -w '' src/functional/snprintf-static.exe >src/functional/snprintf-static.err && echo successed ; echo || echo snprintf-static failed ; echo


echo spawn-static
src/common/runtest.exe -w '' src/functional/spawn-static.exe >src/functional/spawn-static.err && echo successed ; echo || echo spawn-static failed ; echo
# echo sscanf-static
# src/common/runtest.exe -w '' src/functional/sscanf-static.exe >src/functional/sscanf-static.err && echo successed ; echo || echo sscanf-static failed ; echo
# echo sscanf_long-static
# src/common/runtest.exe -w '' src/functional/sscanf_long-static.exe >src/functional/sscanf_long-static.err && echo successed ; echo || echo sscanf_long-static failed ; echo
# echo stat-static
# src/common/runtest.exe -w '' src/functional/stat-static.exe >src/functional/stat-static.err && echo successed ; echo || echo stat-static failed ; echo
# echo strftime-static
# src/common/runtest.exe -w '' src/functional/strftime-static.exe >src/functional/strftime-static.err && echo successed ; echo || echo strftime-static failed ; echo
# echo string-static
# src/common/runtest.exe -w '' src/functional/string-static.exe >src/functional/string-static.err && echo successed ; echo || echo string-static failed ; echo
# echo string_memcpy-static
# src/common/runtest.exe -w '' src/functional/string_memcpy-static.exe >src/functional/string_memcpy-static.err && echo successed ; echo || echo string_memcpy-static failed ; echo
# echo string_memmem-static
# src/common/runtest.exe -w '' src/functional/string_memmem-static.exe >src/functional/string_memmem-static.err && echo successed ; echo || echo string_memmem-static failed ; echo
# echo string_memset-static
# src/common/runtest.exe -w '' src/functional/string_memset-static.exe >src/functional/string_memset-static.err && echo successed ; echo || echo string_memset-static failed ; echo


# echo string_strchr-static
# src/common/runtest.exe -w '' src/functional/string_strchr-static.exe >src/functional/string_strchr-static.err && echo successed ; echo || echo string_strchr-static failed ; echo
# echo string_strcspn-static
# src/common/runtest.exe -w '' src/functional/string_strcspn-static.exe >src/functional/string_strcspn-static.err && echo successed ; echo || echo string_strcspn-static failed ; echo
# echo string_strstr-static
# src/common/runtest.exe -w '' src/functional/string_strstr-static.exe >src/functional/string_strstr-static.err && echo successed ; echo || echo string_strstr-static failed ; echo
echo strptime-static
src/common/runtest.exe -w '' src/functional/strptime-static.exe >src/functional/strptime-static.err && echo successed ; echo || echo strptime-static failed ; echo
echo strtod-static
src/common/runtest.exe -w '' src/functional/strtod-static.exe >src/functional/strtod-static.err && echo successed ; echo || echo strtod-static failed ; echo
# echo strtod_long-static
# src/common/runtest.exe -w '' src/functional/strtod_long-static.exe >src/functional/strtod_long-static.err && echo successed ; echo || echo strtod_long-static failed ; echo
# echo strtod_simple-static
# src/common/runtest.exe -w '' src/functional/strtod_simple-static.exe >src/functional/strtod_simple-static.err && echo successed ; echo || echo strtod_simple-static failed ; echo
echo strtof-static
src/common/runtest.exe -w '' src/functional/strtof-static.exe >src/functional/strtof-static.err && echo successed ; echo || echo strtof-static failed ; echo
# echo strtol-static
# src/common/runtest.exe -w '' src/functional/strtol-static.exe >src/functional/strtol-static.err && echo successed ; echo || echo strtol-static failed ; echo
echo strtold-static
src/common/runtest.exe -w '' src/functional/strtold-static.exe >src/functional/strtold-static.err && echo successed ; echo || echo strtold-static failed ; echo
# echo swprintf-static
# src/common/runtest.exe -w '' src/functional/swprintf-static.exe >src/functional/swprintf-static.err && echo successed ; echo || echo swprintf-static failed ; echo
# echo tgmath-static
# src/common/runtest.exe -w '' src/functional/tgmath-static.exe >src/functional/tgmath-static.err && echo successed ; echo || echo tgmath-static failed ; echo
# echo time-static
# src/common/runtest.exe -w '' src/functional/time-static.exe >src/functional/time-static.err && echo successed ; echo || echo time-static failed ; echo
# echo tls_align
# src/common/runtest.exe -w '' src/functional/tls_align.exe >src/functional/tls_align.err && echo successed ; echo || echo tls_align failed ; echo
# echo tls_init-static
# src/common/runtest.exe -w '' src/functional/tls_init-static.exe >src/functional/tls_init-static.err && echo successed ; echo || echo tls_init-static failed ; echo
# echo tls_local_exec-static
# src/common/runtest.exe -w '' src/functional/tls_local_exec-static.exe >src/functional/tls_local_exec-static.err && echo successed ; echo || echo tls_local_exec-static failed ; echo
# echo udiv-static
# src/common/runtest.exe -w '' src/functional/udiv-static.exe >src/functional/udiv-static.err && echo successed ; echo || echo udiv-static failed ; echo
# echo ungetc-static
# src/common/runtest.exe -w '' src/functional/ungetc-static.exe >src/functional/ungetc-static.err && echo successed ; echo || echo ungetc-static failed ; echo
echo utime-static
src/common/runtest.exe -w '' src/functional/utime-static.exe >src/functional/utime-static.err && echo successed ; echo || echo utime-static failed ; echo
echo vfork-static
src/common/runtest.exe -w '' src/functional/vfork-static.exe >src/functional/vfork-static.err && echo successed ; echo || echo vfork-static failed ; echo
# echo wcsstr-static
# src/common/runtest.exe -w '' src/functional/wcsstr-static.exe >src/functional/wcsstr-static.err && echo successed ; echo || echo wcsstr-static failed ; echo




echo daemon-failure-static
src/common/runtest.exe -w '' src/regression/daemon-failure-static.exe >src/regression/daemon-failure-static.err && echo successed ; echo || echo daemon-failure-static failed ; echo
# echo dn_expand-empty-static
# src/common/runtest.exe -w '' src/regression/dn_expand-empty-static.exe >src/regression/dn_expand-empty-static.err && echo successed ; echo || echo dn_expand-empty-static failed ; echo
# echo dn_expand-ptr-0-static
# src/common/runtest.exe -w '' src/regression/dn_expand-ptr-0-static.exe >src/regression/dn_expand-ptr-0-static.err && echo successed ; echo || echo dn_expand-ptr-0-static failed ; echo
# echo execle-env-static
# src/common/runtest.exe -w '' src/regression/execle-env-static.exe >src/regression/execle-env-static.err && echo successed ; echo || echo execle-env-static failed ; echo
echo fflush-exit-static
src/common/runtest.exe -w '' src/regression/fflush-exit-static.exe >src/regression/fflush-exit-static.err && echo successed ; echo || echo fflush-exit-static failed ; echo
# echo fgets-eof-static
# src/common/runtest.exe -w '' src/regression/fgets-eof-static.exe >src/regression/fgets-eof-static.err && echo successed ; echo || echo fgets-eof-static failed ; echo
echo fgetwc-buffering-static
src/common/runtest.exe -w '' src/regression/fgetwc-buffering-static.exe >src/regression/fgetwc-buffering-static.err && echo successed ; echo || echo fgetwc-buffering-static failed ; echo





# echo fpclassify-invalid-ld80-static
# src/common/runtest.exe -w '' src/regression/fpclassify-invalid-ld80-static.exe >src/regression/fpclassify-invalid-ld80-static.err && echo successed ; echo || echo fpclassify-invalid-ld80-static failed ; echo
# echo ftello-unflushed-append-static
# src/common/runtest.exe -w '' src/regression/ftello-unflushed-append-static.exe >src/regression/ftello-unflushed-append-static.err && echo successed ; echo || echo ftello-unflushed-append-static failed ; echo
# echo getpwnam_r-crash-static
# src/common/runtest.exe -w '' src/regression/getpwnam_r-crash-static.exe >src/regression/getpwnam_r-crash-static.err && echo successed ; echo || echo getpwnam_r-crash-static failed ; echo
# echo getpwnam_r-errno-static
# src/common/runtest.exe -w '' src/regression/getpwnam_r-errno-static.exe >src/regression/getpwnam_r-errno-static.err && echo successed ; echo || echo getpwnam_r-errno-static failed ; echo
# echo iconv-roundtrips-static
# src/common/runtest.exe -w '' src/regression/iconv-roundtrips-static.exe >src/regression/iconv-roundtrips-static.err && echo successed ; echo || echo iconv-roundtrips-static failed ; echo
# echo inet_ntop-v4mapped-static
# src/common/runtest.exe -w '' src/regression/inet_ntop-v4mapped-static.exe >src/regression/inet_ntop-v4mapped-static.err && echo successed ; echo || echo inet_ntop-v4mapped-static failed ; echo
# echo inet_pton-empty-last-field-static
# src/common/runtest.exe -w '' src/regression/inet_pton-empty-last-field-static.exe >src/regression/inet_pton-empty-last-field-static.err && echo successed ; echo || echo inet_pton-empty-last-field-static failed ; echo
# echo iswspace-null-static
# src/common/runtest.exe -w '' src/regression/iswspace-null-static.exe >src/regression/iswspace-null-static.err && echo successed ; echo || echo iswspace-null-static failed ; echo
# echo lrand48-signextend-static
# src/common/runtest.exe -w '' src/regression/lrand48-signextend-static.exe >src/regression/lrand48-signextend-static.err && echo successed ; echo || echo lrand48-signextend-static failed ; echo
# echo lseek-large-static
# src/common/runtest.exe -w '' src/regression/lseek-large-static.exe >src/regression/lseek-large-static.err && echo successed ; echo || echo lseek-large-static failed ; echo
# echo malloc-0-static
# src/common/runtest.exe -w '' src/regression/malloc-0-static.exe >src/regression/malloc-0-static.err && echo successed ; echo || echo malloc-0-static failed ; echo




# echo mbsrtowcs-overflow-static
# src/common/runtest.exe -w '' src/regression/mbsrtowcs-overflow-static.exe >src/regression/mbsrtowcs-overflow-static.err && echo successed ; echo || echo mbsrtowcs-overflow-static failed ; echo
# echo memmem-oob-read-static
# src/common/runtest.exe -w '' src/regression/memmem-oob-read-static.exe >src/regression/memmem-oob-read-static.err && echo successed ; echo || echo memmem-oob-read-static failed ; echo
# echo memmem-oob-static
# src/common/runtest.exe -w '' src/regression/memmem-oob-static.exe >src/regression/memmem-oob-static.err && echo successed ; echo || echo memmem-oob-static failed ; echo
# echo mkdtemp-failure-static
# src/common/runtest.exe -w '' src/regression/mkdtemp-failure-static.exe >src/regression/mkdtemp-failure-static.err && echo successed ; echo || echo mkdtemp-failure-static failed ; echo
# echo mkstemp-failure-static
# src/common/runtest.exe -w '' src/regression/mkstemp-failure-static.exe >src/regression/mkstemp-failure-static.err && echo successed ; echo || echo mkstemp-failure-static failed ; echo
# echo printf-1e9-oob-static
# src/common/runtest.exe -w '' src/regression/printf-1e9-oob-static.exe >src/regression/printf-1e9-oob-static.err && echo successed ; echo || echo printf-1e9-oob-static failed ; echo
# echo printf-fmt-g-round-static
# src/common/runtest.exe -w '' src/regression/printf-fmt-g-round-static.exe >src/regression/printf-fmt-g-round-static.err && echo successed ; echo || echo printf-fmt-g-round-static failed ; echo
# echo printf-fmt-g-zeros-static
# src/common/runtest.exe -w '' src/regression/printf-fmt-g-zeros-static.exe >src/regression/printf-fmt-g-zeros-static.err && echo successed ; echo || echo printf-fmt-g-zeros-static failed ; echo
# echo printf-fmt-n-static
# src/common/runtest.exe -w '' src/regression/printf-fmt-n-static.exe >src/regression/printf-fmt-n-static.err && echo successed ; echo || echo printf-fmt-n-static failed ; echo
echo pthread-robust-detach-static
src/common/runtest.exe -w '' src/regression/pthread-robust-detach-static.exe >src/regression/pthread-robust-detach-static.err && echo successed ; echo || echo pthread-robust-detach-static failed ; echo
echo pthread_atfork-errno-clobber-static
src/common/runtest.exe -w '' src/regression/pthread_atfork-errno-clobber-static.exe >src/regression/pthread_atfork-errno-clobber-static.err && echo successed ; echo || echo pthread_atfork-errno-clobber-static failed ; echo
# echo pthread_cancel-sem_wait-static
# src/common/runtest.exe -w '' src/regression/pthread_cancel-sem_wait-static.exe >src/regression/pthread_cancel-sem_wait-static.err && echo successed ; echo || echo pthread_cancel-sem_wait-static failed ; echo





# echo pthread_exit-cancel-static
# src/common/runtest.exe -w '' src/regression/pthread_exit-cancel-static.exe >src/regression/pthread_exit-cancel-static.err && echo successed ; echo || echo pthread_exit-cancel-static failed ; echo
echo pthread_exit-dtor-static
src/common/runtest.exe -w '' src/regression/pthread_exit-dtor-static.exe >src/regression/pthread_exit-dtor-static.err && echo successed ; echo || echo pthread_exit-dtor-static failed ; echo
# echo pthread_once-deadlock-static
# src/common/runtest.exe -w '' src/regression/pthread_once-deadlock-static.exe >src/regression/pthread_once-deadlock-static.err && echo successed ; echo || echo pthread_once-deadlock-static failed ; echo
# echo pthread_rwlock-ebusy-static
# src/common/runtest.exe -w '' src/regression/pthread_rwlock-ebusy-static.exe >src/regression/pthread_rwlock-ebusy-static.err && echo successed ; echo || echo pthread_rwlock-ebusy-static failed ; echo
# echo putenv-doublefree-static
# src/common/runtest.exe -w '' src/regression/putenv-doublefree-static.exe >src/regression/putenv-doublefree-static.err && echo successed ; echo || echo putenv-doublefree-static failed ; echo





# echo regex-backref-0-static
# src/common/runtest.exe -w '' src/regression/regex-backref-0-static.exe >src/regression/regex-backref-0-static.err && echo successed ; echo || echo regex-backref-0-static failed ; echo
# echo regex-bracket-icase-static
# src/common/runtest.exe -w '' src/regression/regex-bracket-icase-static.exe >src/regression/regex-bracket-icase-static.err && echo successed ; echo || echo regex-bracket-icase-static failed ; echo
# echo regex-ere-backref-static
# src/common/runtest.exe -w '' src/regression/regex-ere-backref-static.exe >src/regression/regex-ere-backref-static.err && echo successed ; echo || echo regex-ere-backref-static failed ; echo
# echo regex-escaped-high-byte-static
# src/common/runtest.exe -w '' src/regression/regex-escaped-high-byte-static.exe >src/regression/regex-escaped-high-byte-static.err && echo successed ; echo || echo regex-escaped-high-byte-static failed ; echo
# echo regex-negated-range-static
# src/common/runtest.exe -w '' src/regression/regex-negated-range-static.exe >src/regression/regex-negated-range-static.err && echo successed ; echo || echo regex-negated-range-static failed ; echo
# echo regexec-nosub-static
# src/common/runtest.exe -w '' src/regression/regexec-nosub-static.exe >src/regression/regexec-nosub-static.err && echo successed ; echo || echo regexec-nosub-static failed ; echo
echo rewind-clear-error-static
src/common/runtest.exe -w '' src/regression/rewind-clear-error-static.exe >src/regression/rewind-clear-error-static.err && echo successed ; echo || echo rewind-clear-error-static failed ; echo
echo rlimit-open-files-static
src/common/runtest.exe -w '' src/regression/rlimit-open-files-static.exe >src/regression/rlimit-open-files-static.err && echo successed ; echo || echo rlimit-open-files-static failed ; echo
# echo scanf-bytes-consumed-static
# src/common/runtest.exe -w '' src/regression/scanf-bytes-consumed-static.exe >src/regression/scanf-bytes-consumed-static.err && echo successed ; echo || echo scanf-bytes-consumed-static failed ; echo
# echo scanf-match-literal-eof-static
# src/common/runtest.exe -w '' src/regression/scanf-match-literal-eof-static.exe >src/regression/scanf-match-literal-eof-static.err && echo successed ; echo || echo scanf-match-literal-eof-static failed ; echo
# echo scanf-nullbyte-char-static
# src/common/runtest.exe -w '' src/regression/scanf-nullbyte-char-static.exe >src/regression/scanf-nullbyte-char-static.err && echo successed ; echo || echo scanf-nullbyte-char-static failed ; echo






# echo setvbuf-unget-static
# src/common/runtest.exe -w '' src/regression/setvbuf-unget-static.exe >src/regression/setvbuf-unget-static.err && echo successed ; echo || echo setvbuf-unget-static failed ; echo
# echo sigaltstack-static
# src/common/runtest.exe -w '' src/regression/sigaltstack-static.exe >src/regression/sigaltstack-static.err && echo successed ; echo || echo sigaltstack-static failed ; echo
# echo sigprocmask-internal-static
# src/common/runtest.exe -w '' src/regression/sigprocmask-internal-static.exe >src/regression/sigprocmask-internal-static.err && echo successed ; echo || echo sigprocmask-internal-static failed ; echo
echo sigreturn-static
src/common/runtest.exe -w '' src/regression/sigreturn-static.exe >src/regression/sigreturn-static.err && echo successed ; echo || echo sigreturn-static failed ; echo
# echo sscanf-eof-static
# src/common/runtest.exe -w '' src/regression/sscanf-eof-static.exe >src/regression/sscanf-eof-static.err && echo successed ; echo || echo sscanf-eof-static failed ; echo
echo statvfs-static
src/common/runtest.exe -w '' src/regression/statvfs-static.exe >src/regression/statvfs-static.err && echo successed ; echo || echo statvfs-static failed ; echo
# echo strverscmp-static
# src/common/runtest.exe -w '' src/regression/strverscmp-static.exe >src/regression/strverscmp-static.err && echo successed ; echo || echo strverscmp-static failed ; echo
# echo syscall-sign-extend-static
# src/common/runtest.exe -w '' src/regression/syscall-sign-extend-static.exe >src/regression/syscall-sign-extend-static.err && echo successed ; echo || echo syscall-sign-extend-static failed ; echo
# echo uselocale-0-static
# src/common/runtest.exe -w '' src/regression/uselocale-0-static.exe >src/regression/uselocale-0-static.err && echo successed ; echo || echo uselocale-0-static failed ; echo
# echo wcsncpy-read-overflow-static
# src/common/runtest.exe -w '' src/regression/wcsncpy-read-overflow-static.exe >src/regression/wcsncpy-read-overflow-static.err && echo successed ; echo || echo wcsncpy-read-overflow-static failed ; echo
# echo wcsstr-false-negative-static
# src/common/runtest.exe -w '' src/regression/wcsstr-false-negative-static.exe >src/regression/wcsstr-false-negative-static.err && echo successed ; echo || echo wcsstr-false-negative-static failed ; echo

# echo tls_align-static
# src/common/runtest.exe -w '' src/functional/tls_align-static.exe >src/functional/tls_align-static.err && echo successed ; echo || echo tls_align-static failed ; echo
