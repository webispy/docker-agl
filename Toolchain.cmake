set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR x86)
set(CMAKE_LIBRARY_ARCHITECTURE x86)

SET(cross_triple $ENV{CROSS_TRIPLE})
SET(cross_root $ENV{CROSS_ROOT})

SET(CMAKE_C_COMPILER "x86_64-agl-linux-gcc")
SET(CMAKE_CXX_COMPILER "x86_64-agl-linux-g++")

SET(CMAKE_CXX_FLAGS "-march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2 \
                    -fstack-protector-strong \
                    -D_FORTIFY_SOURCE=2 \
                    -Wformat -Wformat-security \
                    -Werror=format-security")

SET(CMAKE_FIND_ROOT_PATH ${cross_root} ${cross_root})
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
SET(CMAKE_SYSROOT $ENV{CROSS_SYSROOT})

SET(CMAKE_CROSSCOMPILING_EMULATOR /usr/bin/qemu-x86_64-static)
