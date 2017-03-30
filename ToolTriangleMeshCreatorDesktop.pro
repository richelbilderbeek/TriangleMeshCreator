include(../RibiLibraries/Apfloat.pri)
include(../RibiLibraries/GeneralConsole.pri)
include(../RibiLibraries/GeneralDesktop.pri)

#Console
include(../RibiClasses/CppContainer/CppContainer.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppGeometry/CppGeometry.pri)
include(../RibiClasses/CppOpenFoam/CppOpenFoam.pri)
include(../RibiClasses/CppPhp/CppPhp.pri)
include(../plane/plane.pri)
include(../RibiClasses/CppPolyFile/CppPolyFile.pri)
include(../RibiClasses/CppPolyFileFromPolygons/CppPolyFileFromPolygons.pri)
include(../RibiClasses/CppRibiRegex/CppRibiRegex.pri)
include(../RibiClasses/CppTriangleFile/CppTriangleFile.pri)
include(../RibiClasses/CppTriangleMesh/CppTriangleMesh.pri)
include(../RibiClasses/CppXml/CppXml.pri)
#include(../Triangle/ToolTriangleConsole.pri)
#include(../TriangleCpp/ToolTriangleCppConsole.pri)

#Desktop
include(../RibiClasses/CppQtNavigationableGraphicsView/CppQtNavigationableGraphicsView.pri)
include(ToolTriangleMeshCreatorDesktop.pri)

SOURCES += qtmain.cpp

# C++14
CONFIG += c++14
QMAKE_CXXFLAGS += -std=c++14

# High warning levels
# Qt does not go well with -Weffc++
QMAKE_CXXFLAGS += -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic -Werror

# Debug and release mode
CONFIG += debug_and_release

# In release mode, define NDEBUG
CONFIG(release, debug|release) {

  DEFINES += NDEBUG

  # gprof
  QMAKE_CXXFLAGS += -pg
  QMAKE_LFLAGS += -pg

  # GSL
  DEFINES += GSL_UNENFORCED_ON_CONTRACT_VIOLATION
}

# In debug mode, turn on gcov and UBSAN
CONFIG(debug, debug|release) {

  # gcov
  QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
  LIBS += -lgcov

  # UBSAN
  QMAKE_CXXFLAGS += -fsanitize=undefined
  QMAKE_LFLAGS += -fsanitize=undefined
  LIBS += -lubsan

  # gprof
  QMAKE_CXXFLAGS += -pg
  QMAKE_LFLAGS += -pg

  # GSL
  #DEFINES += GSL_THROW_ON_CONTRACT_VIOLATION
  DEFINES += GSL_UNENFORCED_ON_CONTRACT_VIOLATION
}

# Qt
QT += core gui widgets svg

# Prevent Qt for failing with this error:
# qrc_[*].cpp:400:44: error: ‘qInitResources_[*]__init_variable__’ defined but not used
# [*]: the resource filename
QMAKE_CXXFLAGS += -Wno-unused-variable

# Fixes
#/usr/include/boost/math/constants/constants.hpp:277: error: unable to find numeric literal operator 'operator""Q'
#   BOOST_DEFINE_MATH_CONSTANT(half, 5.000000000000000000000000000000000000e-01, "5.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-01")
#   ^
QMAKE_CXXFLAGS += -fext-numeric-literals
