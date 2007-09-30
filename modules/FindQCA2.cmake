# - Try to find QCA2 (Qt Cryptography Architecture 2)
# Once done this will define
#
#  QCA2_FOUND - system has QCA2
#  QCA2_INCLUDE_DIR - the QCA2 include directory
#  QCA2_LIBRARIES - the libraries needed to use QCA2
#  QCA2_DEFINITIONS - Compiler switches required for using QCA2
#
# use pkg-config to get the directories and then use these values
# in the FIND_PATH() and FIND_LIBRARY() calls
#
# Copyright (c) 2006, Michael Larouche, <michael.larouche@kdemail.net>
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

include(FindLibraryWithDebug)

if (QCA2_INCLUDE_DIR AND QCA2_LIBRARIES)

  # in cache already
  set(QCA2_FOUND TRUE)

else (QCA2_INCLUDE_DIR AND QCA2_LIBRARIES)

  INCLUDE(UsePkgConfig)

  IF (NOT WIN32)
    PKGCONFIG(qca QCA2_INCLUDE_DIR _Qca2LinkDir _Qca2LinkFlags _Qca2Cflags)

    set(QCA2_DEFINITIONS ${_Qca2Cflags})

    FIND_LIBRARY(QCA2_LIBRARIES NAMES qca
      PATHS
      ${_Qca2LinkDir}
      NO_DEFAULT_PATH
    )
  ELSE (NOT WIN32)
    FIND_LIBRARY_WITH_DEBUG(QCA2_LIBRARIES
                    WIN32_DEBUG_POSTFIX d
                    NAMES qca)

    FIND_PATH(QCA2_INCLUDE_DIR QtCrypto/qca.h)
    IF(QCA2_INCLUDE_DIR)
      SET(QCA2_INCLUDE_DIR ${QCA2_INCLUDE_DIR}/QtCrypto CACHE TYPE PATH FORCE)
    ENDIF(QCA2_INCLUDE_DIR)
  ENDIF (NOT WIN32)


  if (QCA2_INCLUDE_DIR AND QCA2_LIBRARIES)
    set(QCA2_FOUND TRUE)
  else (QCA2_INCLUDE_DIR AND QCA2_LIBRARIES)
    if (NOT QCA2_INCLUDE_DIR)
      message(STATUS "Could NOT find QCA2 includes")
    endif (NOT QCA2_INCLUDE_DIR)
    if (NOT QCA2_LIBRARIES)
      message(STATUS "Could NOT find QCA2 libraries")
    endif (NOT QCA2_LIBRARIES)
    if (QCA2_FIND_REQUIRED)
      message(FATAL_ERROR "Could NOT find QCA2")
    endif (QCA2_FIND_REQUIRED)
  endif (QCA2_INCLUDE_DIR AND QCA2_LIBRARIES)

  MARK_AS_ADVANCED(QCA2_INCLUDE_DIR QCA2_LIBRARIES)

endif (QCA2_INCLUDE_DIR AND QCA2_LIBRARIES)
