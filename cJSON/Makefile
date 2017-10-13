CC = arm-hisiv600-linux-gcc

CJSON_OBJ = cJSON.o
CJSON_LIBNAME = libcjson

LIBVERSION = 1.5.7

# validate gcc version for use fstack-protector-strong
MIN_GCC_VERSION = "4.9"
GCC_VERSION := "`gcc -dumpversion`"
IS_GCC_ABOVE_MIN_VERSION := $(shell expr "$(GCC_VERSION)" ">=" "$(MIN_GCC_VERSION)")
ifeq "$(IS_GCC_ABOVE_MIN_VERSION)" "1"
    CFLAGS += -fstack-protector-strong
else
    CFLAGS += -fstack-protector
endif

R_CFLAGS = -fPIC -std=c89 -pedantic -Wall -Werror -Wstrict-prototypes -Wwrite-strings -Wshadow -Winit-self -Wcast-align -Wformat=2 -Wmissing-prototypes -Wstrict-overflow=2 -Wcast-qual -Wc++-compat -Wundef -Wswitch-default -Wconversion $(CFLAGS)

#library file extensions
SHARED = so
STATIC = a

#cJSON library names
CJSON_SHARED = $(CJSON_LIBNAME).$(SHARED)
CJSON_STATIC = $(CJSON_LIBNAME).$(STATIC)

.PHONY: all shared static clean

all: shared static
	$(RM) $(CJSON_OBJ) #delete object files

shared: $(CJSON_SHARED)

static: $(CJSON_STATIC)

.c.o:
	$(CC) -c $(R_CFLAGS) $<

#static libraries
#cJSON
$(CJSON_STATIC): $(CJSON_OBJ)
	$(AR) rcs $@ $<

#shared libraries .so.1.0.0
#cJSON
$(CJSON_SHARED): $(CJSON_OBJ)
	$(CC) -shared -o $@ $< $(LDFLAGS)

clean:
	$(RM) $(CJSON_OBJ) #delete object files
	$(RM) $(CJSON_SHARED) $(CJSON_STATIC) #delete cJSON
