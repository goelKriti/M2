###############################################################################
## This directory contains the rules for building M2-interpreter

include(scc) ## CMake macro for calling the Safe C Compiler

# TODO: changing this causes a lot of recompiling
## Configure distributed-packages.h at the destination
string(REPLACE ";" " " DISTRIBUTED_PACKAGES "${DISTRIBUTED_PACKAGES}")
# TODO: configure this header directly in version.dd?
file(GENERATE OUTPUT distributed-packages.h CONTENT "#define DISTRIBUTED_PACKAGES \"${DISTRIBUTED_PACKAGES}\"")

## Configure version.dd at the destination
#configure_file(version.dd.in version.dd #ONLY)

###############################################################################

set(CLIST
  M2types.c M2lib.c M2mem.c types.h
  scclib.c ../c/scc-core.h
  memdebug.c memdebug.h
  debug.c debug.h
  getpagesize.h M2mem.h
  gmp_aux.c gmp_aux.h
  gdbm_interface.c
  )

set(CXXLIST boost-regex.cpp)

# CAUTION: order is important in this list
# TODO: can there be #ifdefs in D sources?
set(DLIST
  arithmetic.d
  atomic.d
  M2.d
  system.d
  strings.d
  varstrin.d
  strings1.d
  errio.d
  vararray.d
  ctype.d
  nets.d
  varnets.d
  interrupts.d
  pthread0.d
  stdiop0.d
  gmp.d
  ballarith.d
  engine.dd
  xml.d		# removed unless WITH_XML
  stdio0.d
  parse.d
  expr.d
  stdio.d
  stdiop.d
  err.d
  gmp1.d
  tokens.d
  getline.d
  lex.d
  parser.d
  binding.d
  basic.d
  common.d
  util.d
  convertr.d
  struct.d
  classes.dd
  buckets.dd
  equality.dd
  hashtables.dd
  regex.dd
  debugging.dd
  evaluate.d
  sets.dd
  mysql.d	# removed unless WITH_SQL
  mysqldummy.d	# removed if WITH_SQL
  pthread.d
  actors.d
  actors2.dd
  actors3.d
  actors4.d
  # tasks.d
  xmlactors.d	# removed unless WITH_XML
  actors5.d
  chrono.dd
  profiler.dd
  threads.dd
  python.d	# removed unless WITH_PYTHON
  interface.dd interface2.d
  monoid.dd
  monomial_ordering.dd
  texmacs.d
  boostmath.dd
  atomic2.d
  ffi.d		# removed unless WITH_FFI
  interp.dd	# this one is last, because it contains the top level interpreter
  version.dd
  )

# Generator expressions conflict with the macro below, so manually remove the ones we don't need
if(NOT WITH_XML)
  list(REMOVE_ITEM DLIST xml.d xmlactors.d)
endif()
if(NOT WITH_SQL)
  list(REMOVE_ITEM DLIST mysql.d)
else()
  list(REMOVE_ITEM DLIST mysqldummy.d)
endif()
if(NOT WITH_PYTHON)
  list(REMOVE_ITEM DLIST python.d)
endif()
if(NOT WITH_FFI)
  list(REMOVE_ITEM DLIST ffi.d)
endif()

###############################################################################
## Generate TAGS file
# TODO: the order is somewhat different, is it a problem?

if(ETAGS)
  set(TAGS TAGS)
  set_source_files_properties(TAGS PROPERTIES GENERATED true)
  add_custom_command(OUTPUT ${CMAKE_CURRENT_SOURCE_DIR}/TAGS
    COMMENT "Generating d/TAGS file"
    COMMAND ${ETAGS} -o TAGS ${CLIST} ${CXXLIST} ${DLIST}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
endif()

###############################################################################
## Generate the interpreter

foreach(_d_source IN LISTS DLIST)
  # See cmake/scc.cmake
  _SCC_TRANSLATE(${_d_source} _c) # sets _c_source
  list(APPEND CLIST ${_c_source})
endforeach()

###############################################################################
## Compile the interpreter

# TODO: gmp.d, basic.d, and equality.d require elements from M2-engine
# for that reason, interpreter cannot be compiled as a static library, yet
add_library(M2-interpreter OBJECT ${CLIST} ${CXXLIST} ${TAGS}
  distributed-packages.h
  $<$<BOOL:${WITH_XML}>:xml-c.c xml-c.h>
  $<$<BOOL:${WITH_PYTHON}>:python-c.c>)

target_link_libraries(M2-interpreter PRIVATE M2-supervisor
  Boost::boost # boost_regex is now header-only, so we don't link Boost::regex
  $<$<BOOL:${WITH_TBB}>:TBB::tbb>
  $<$<BOOL:${WITH_FFI}>:FFI::ffi>)

# TODO: c.f. https://github.com/Macaulay2/M2/issues/2682
if(NOT APPLE)
  target_link_libraries(M2-interpreter PRIVATE quadmath)
endif()

target_include_directories(M2-interpreter
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/Macaulay2/e> # need newdelete.hpp
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/Macaulay2/c> # need scc-core.h
    $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/Macaulay2/d>
    # for version.dd to get version numbers
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/Macaulay2/e/mathic>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/Macaulay2/e/memtailor>
    $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/Macaulay2/e/mathicgb>
    # for libraries that the interpreter needs
    $<BUILD_INTERFACE:${READLINE_INCLUDE_DIR}>
    $<BUILD_INTERFACE:${LIBXML2_INCLUDE_DIR}>
    $<BUILD_INTERFACE:${EIGEN3_INCLUDE_DIR}>
    $<INSTALL_INTERFACE:include/Macaulay2>
    $<$<BOOL:${WITH_PYTHON}>:$<BUILD_INTERFACE:${Python3_INCLUDE_DIRS}>>
  PRIVATE
    # Note: this shouldn't be necessary since FFI::ffi is linked above
    $<$<BOOL:${WITH_FFI}>:$<BUILD_INTERFACE:${FFI_INCLUDE_DIRS}>>
    ${SQLite3_INCLUDE_DIRS}
  )

# TODO: Including most of these is only necessary because of version.dd
# changing or moving that file would allow moving this to e/CMakeLists.txt
foreach(LIB IN LISTS PKGLIB_LIST)
  if(${LIB}_FOUND)
    target_link_libraries(M2-interpreter PUBLIC PkgConfig::${LIB})
  endif()
endforeach()

foreach(LIB IN LISTS LIBRARIES_LIST)
  if(${LIB}_FOUND)
    target_link_libraries(M2-interpreter PUBLIC ${${LIB}_LIBRARIES})
    target_include_directories(M2-interpreter PUBLIC
        "$<BUILD_INTERFACE:${${LIB}_INCLUDE_DIR}>")
  endif()
endforeach()

foreach(LIB IN LISTS LIBRARY_LIST)
  if(${LIB}_FOUND)
    target_link_libraries(M2-interpreter PUBLIC ${${LIB}_LIBRARY})
    target_include_directories(M2-interpreter PUBLIC
        "$<BUILD_INTERFACE:${${LIB}_INCLUDE_DIR}>")
  endif()
endforeach()

# Compiler warning flags
target_compile_options(M2-interpreter PRIVATE
  -Wno-cast-qual # FIXME: caused by M2lib.c:551:43
  -Wno-sign-compare
  -Wno-uninitialized
  -Wno-unused
  -Wno-array-bounds   # FIXME: caused by scc1's implementation of arrays

  # FIXME: mismatched-tags and parentheses-equality errors are caused by scc1
  $<$<COMPILE_LANG_AND_ID:C,AppleClang,Clang>:-Wno-parentheses-equality>
  $<$<COMPILE_LANG_AND_ID:CXX,AppleClang,Clang>:-Wno-mismatched-tags -Wno-parentheses-equality>
  # FIXME: caused by SIMD macro redefinition in fflas_ffpack
  $<$<COMPILE_LANG_AND_ID:CXX,AppleClang,Clang>:-Wno-macro-redefined>

  # FIXME: __builtin_frame_address M2lib.c:165 causes this:
  $<$<COMPILE_LANG_AND_ID:C,GNU>:-Wno-frame-address>
  # Givaro and fflas_ffpack cause these:
  $<$<COMPILE_LANG_AND_ID:CXX,GNU>:-Wno-deprecated-copy -Wno-unknown-pragmas>
  )
# add other compilers (eg: Intel, MSVC) here
# for Intel: -diag-disable 981,869,383,2259,444 -debug

###############################################################################
## Export the target

install(TARGETS M2-interpreter EXPORT Macaulay2 COMPONENT devel EXCLUDE_FROM_ALL)
