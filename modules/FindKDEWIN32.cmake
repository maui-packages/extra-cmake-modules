# - Try to find the KDEWIN32 library
# Once done this will define
#
#  KDEWIN32_FOUND - system has KDEWIN32
#  KDEWIN32_INCLUDES - the KDEWIN32 include directories
#  KDEWIN32_LIBRARIES - The libraries needed to use KDEWIN32

if (WIN32)

INCLUDE(MacroGetenvWinPath)

MACRO_GETENV_WIN_PATH(_program_FILES_DIR PROGRAMFILES)

FIND_PACKAGE(Qt4 REQUIRED)

FIND_PATH(KDEWIN32_INCLUDE_DIR winposix_export.h
   ${_program_FILES_DIR}/kdewin32/include
)


# at first find the kdewin32 library, this has to be compiled and installed before kdelibs/
# search for kdewin32 in the default install directory for applications (default of (n)make install)
if (CMAKE_BUILD_TYPE MATCHES Debug)
   set(_KDEWIN32_POSTFIX d)
else (CMAKE_BUILD_TYPE MATCHES Debug)
   set(_KDEWIN32_POSTFIX )
endif (CMAKE_BUILD_TYPE MATCHES Debug)

FIND_LIBRARY(KDEWIN32_LIBRARY NAMES kdewin32${_KDEWIN32_POSTFIX}
  PATHS
  ${_program_FILES_DIR}/kdewin32/lib
)

if (NOT KDEWIN32_LIBRARY AND NOT MSVC)
  # We can mix release/debug builds
  FIND_LIBRARY(KDEWIN32_LIBRARY NAMES kdewin32 kdewin32d
  PATHS
  ${_program_FILES_DIR}/kdewin32/lib
  )
endif (NOT KDEWIN32_LIBRARY AND NOT MSVC)

# kdelibs/win/ has to be built before the rest of kdelibs/
# eventually it will be moved out from kdelibs/
if (KDEWIN32_LIBRARY AND KDEWIN32_INCLUDE_DIR)
   set(KDEWIN32_FOUND TRUE)
   # add the winsock2 library, using find_library or something like this would probably be better
   set(KDEWIN32_LIBRARIES ${KDEWIN32_LIBRARY} user32 shell32 ws2_32)

   if (MINGW)
      #mingw compiler
      set(KDEWIN32_INCLUDES ${KDEWIN32_INCLUDE_DIR} ${KDEWIN32_INCLUDE_DIR}/mingw ${QT_INCLUDES})
   else (MINGW)
      # msvc compiler
      # add the MS SDK include directory if available
      MACRO_GETENV_WIN_PATH(MSSDK_DIR MSSDK)
      set(KDEWIN32_INCLUDES ${KDEWIN32_INCLUDE_DIR} ${KDEWIN32_INCLUDE_DIR}/msvc  ${QT_INCLUDES} ${MSSDK_DIR})
   endif (MINGW)
   
endif (KDEWIN32_LIBRARY AND KDEWIN32_INCLUDE_DIR)

if (KDEWIN32_FOUND)
   if (NOT KDEWIN32_FIND_QUIETLY)
      message(STATUS "Found KDEWIN32: ${KDEWIN32_LIBRARY}")
   endif (NOT KDEWIN32_FIND_QUIETLY)
else (KDEWIN32_FOUND)
   if (KDEWIN32_FIND_REQUIRED)
      message(FATAL_ERROR "Could NOT find KDEWIN32 library\nPlease build and install kdelibs/win/ first")
   endif (KDEWIN32_FIND_REQUIRED)
endif (KDEWIN32_FOUND)

endif (WIN32)
