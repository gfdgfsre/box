lib_LTLIBRARIES = libmediactl-v4l2.la

libmediactl_v4l2_la_SOURCES = \
	libv4l2subdev.c \
	libmediactl.c \
	mediactl-priv.h \
	mediactl.h \
	tools.h \
	v4l2subdev.h
libmediactl_v4l2_la_LDFLAGS = -shared

extdir = $(includedir)/libmediactl-v4l2
ext_HEADERS = 		\
	mediactl-priv.h	\
	mediactl.h	\
	tools.h		\
	v4l2subdev.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libmediactl-v4l2.pc
