# See linux/toolchain-x86_64.cmake for details about multiple load of toolchain file.
include_guard(GLOBAL)

set (CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set (CMAKE_SYSTEM_NAME "Linux")
set (CMAKE_SYSTEM_PROCESSOR "mips64el")
#set (CMAKE_SYSTEM_PROCESSOR "mips64")
set (CMAKE_C_COMPILER clang-17)
set (CMAKE_C_COMPILER_TARGET "mips64el-loongson3a-linux-gnu")
set (CMAKE_CXX_COMPILER clang++-17)
set (CMAKE_CXX_COMPILER_TARGET "mips64el-loongson3a-linux-gnu")
set (CMAKE_ASM_COMPILER clang-17)
set (CMAKE_ASM_COMPILER_TARGET "mips64el-loongson3a-linux-gnu")

set (TOOLCHAIN_PATH "${CMAKE_CURRENT_LIST_DIR}/x-tools/mips64el-loongson3a-linux-gnu-4.19.287-2.31")

# Will be changed later, but somehow needed to be set here.
set (CMAKE_AR     "${TOOLCHAIN_PATH}/bin/mips64el-loongson3a-linux-gnu-ar")
set (CMAKE_RANLIB "${TOOLCHAIN_PATH}/bin/mips64el-loongson3a-linux-gnu-ranlib")

#set (CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_PATH}")
#set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set (CMAKE_SYSROOT "${TOOLCHAIN_PATH}/mips64el-loongson3a-linux-gnu/sysroot")

set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --gcc-install-dir=${TOOLCHAIN_PATH}/lib/gcc/mips64el-loongson3a-linux-gnu/13.2.0")
set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mxgot")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --gcc-install-dir=${TOOLCHAIN_PATH}/lib/gcc/mips64el-loongson3a-linux-gnu/13.2.0")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mxgot -D__STDC_FORMAT_MACROS=1")
set (CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} --gcc-install-dir=${TOOLCHAIN_PATH}/lib/gcc/mips64el-loongson3a-linux-gnu/13.2.0")
set (CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mxgot")

set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --gcc-install-dir=${TOOLCHAIN_PATH}/lib/gcc/mips64el-loongson3a-linux-gnu/13.2.0")
#set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fuse-ld=${TOOLCHAIN_PATH}/bin/mips64el-loongson3a-linux-gnu-ld")
set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mxgot -Wl,-z,notext")
set (CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} --gcc-install-dir=${TOOLCHAIN_PATH}/lib/gcc/mips64el-loongson3a-linux-gnu/13.2.0")
#set (CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -fuse-ld=${TOOLCHAIN_PATH}/bin/mips64el-loongson3a-linux-gnu-ld")
set (CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -mxgot")

set (LINKER_NAME "${TOOLCHAIN_PATH}/bin/mips64el-loongson3a-linux-gnu-ld" CACHE STRING "Linker name or full path" FORCE)

set (HAS_PRE_1970_EXITCODE "0" CACHE STRING "Result from TRY_RUN" FORCE)
set (HAS_PRE_1970_EXITCODE__TRYRUN_OUTPUT "" CACHE STRING "Output from TRY_RUN" FORCE)

set (HAS_POST_2038_EXITCODE "0" CACHE STRING "Result from TRY_RUN" FORCE)
set (HAS_POST_2038_EXITCODE__TRYRUN_OUTPUT "" CACHE STRING "Output from TRY_RUN" FORCE)
