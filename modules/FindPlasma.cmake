# PLASMA_INCLUDE_DIR
# PLASMA_LIBS
# Copyright (C) 2007 Brad Hards <bradh@frogmouth.net>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.


set(PLASMA_LIBS ${KDE4_PLASMA_LIBS} )
set(PLASMA_INCLUDE_DIR ${KDE4_INCLUDE_DIR})
set(PLASMA_FOUND true)

find_file(PLASMA_OPENGL_FOUND plasma/glapplet.h
          PATHS ${PLASMA_INCLUDE_DIR}
          NO_DEFAULT_PATH)

mark_as_advanced(PLASMA_INCLUDE_DIR PLASMA_LIBS)
