# 情况

## 成功 

run argv
run basename
run clocale_mbfuncs
run clock_gettime
run crypt
run dirname
run dlopen
run env

run fdopen
run fnmatch

run fwscanf
run iconv_open
run inet_pton
run mbc
run memstream
run pthread_tsd
run qsort
run random
run search_hsearch
run search_insque
run search_lsearch
run search_tsearch
run snprintf

run sscanf
run sscanf_long
run stat
run strftime
run string
run string_memcpy
run string_memmem
run string_memset
run string_strchr
run string_strcspn
run string_strstr

run strtod_long
run strtod_simple
run strtol
run swprintf
run tgmath
run time
run tls_align_dlopen
run tls_init
run tls_init_dlopen
run tls_local_exec
run udiv
run ungetc

run wcsstr
run wcstol

run cbrt
run cbrtf
run cbrtl
run ceil
run ceilf
run ceill
run copysign
run copysignf
run copysignl

run erf
run erfc
run erff
run erfl
run exp10
run exp10f

run expm1f

run fabs
run fabsf
run fabsl

run fenv
run floor
run floorf
run floorl

run fmax
run fmaxf
run fmaxl
run fmin
run fminf
run fminl


run fpclassify
run frexp
run frexpf
run frexpl


run isless
run j0
run j0f
run j1
run j1f
run jn
run jnf


run modf
run modff
run modfl
run nearbyint
run nearbyintf
run nearbyintl

run pow10
run pow10f


run round
run roundf
run roundl


run trunc
run truncf
run truncl

run pleval-static

run dn_expand-empty
run dn_expand-ptr-0
run execle-env



## 失败

...

## 执行、会崩溃  32个
1. ipc_sem

1. pthread_cancel

1. pthread_cond

1. pthread_mutex

1. pthread_mutex_pi

1. sem_init

1. socket

1. flockfile-list

1. malloc-brk-fail

1. malloc-oom

1. pthread_cond-smasher

1. pthread_cond_wait-cancel_ignored

1. pthread_condattr_setclock

1. pthread_create-oom

1. raise-race

1. setenv-oom

--------------
1. ipc_sem-static

1. pthread_cancel-static

1. pthread_cond-static

1. pthread_mutex-static

1. pthread_mutex_pi-static

1. sem_init-static

1. socket-static

1. flockfile-list-static

1. malloc-brk-fail-static

1. malloc-oom-static

1. pthread_cond-smasher-static

1. pthread_cond_wait-cancel_ignored-static

1. pthread_condattr_setclock-static

1. pthread_create-oom-static

1. raise-race-static

1. setenv-oom-static
