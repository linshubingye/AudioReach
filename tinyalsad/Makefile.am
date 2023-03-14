pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = tinyalsa.pc
EXTRA_DIST = $(pkgconfig_DATA)

AM_CFLAGS = -Wundef \
        -Wstrict-prototypes \
        -Wno-trigraphs \
        -g -O0 \
        -fno-inline \
        -fno-short-enums \
        -fpic \
        -I $(top_srcdir)/include

h_sources = ./include/tinyalsa/asoundlib.h \
            ./include/tinyalsa/mixer_plugin.h \
            ./include/tinyalsa/pcm_plugin.h

c_sources = ${top_srcdir}/mixer.c \
            ${top_srcdir}/pcm.c \
            ${top_srcdir}/mixer_hw.c \
            ${top_srcdir}/mixer_plugin.c \
            ${top_srcdir}/pcm_hw.c \
            ${top_srcdir}/pcm_plugin.c \
            ${top_srcdir}/snd_utils.c

library_includedir = $(includedir)/tinyalsa/
library_include_HEADERS = $(h_sources)

lib_LTLIBRARIES = libtinyalsa.la
libtinyalsa_la_SOURCES = $(c_sources)
libtinyalsa_la_LIBADD = $(GLIB_LIBS) -llog -lcutils
libtinyalsa_la_CFLAGS := $(AM_CFLAGS)
libtinyalsa_la_CFLAGS += $(GLIB_CFLAGS) -Dstrlcpy=g_strlcpy -Dstrlcat=g_strlcat -include glib.h
libtinyalsa_la_CFLAGS += -D__unused=__attribute__\(\(__unused__\)\)
libtinyalsa_la_CFLAGS += -DNDEBUG
libtinyalsa_la_LDFLAGS = -shared -avoid-version
