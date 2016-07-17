#gprof
#DEFINES += NDEBUG
QMAKE_CXXFLAGS_DEBUG += -pg
QMAKE_LFLAGS_DEBUG += -pg

include(../RibiLibraries/ConsoleApplicationNoWeffcpp.pri)
include(../RibiLibraries/Apfloat.pri)
include(../RibiLibraries/Boost.pri)
include(../RibiLibraries/GeneralConsole.pri)
include(../RibiClasses/CppContainer/CppContainer.pri)
include(../RibiClasses/CppFuzzy_equal_to/CppFuzzy_equal_to.pri)
include(../RibiClasses/CppGeometry/CppGeometry.pri)
include(../RibiClasses/CppOpenFoam/CppOpenFoam.pri)
include(../RibiClasses/CppPhp/CppPhp.pri)
include(../RibiClasses/CppPlane/CppPlane.pri)
include(../RibiClasses/CppPolyFile/CppPolyFile.pri)
include(../RibiClasses/CppPolyFileFromPolygons/CppPolyFileFromPolygons.pri)
include(../RibiClasses/CppRibiRegex/CppRibiRegex.pri)
include(../RibiClasses/CppTriangleFile/CppTriangleFile.pri)
include(../RibiClasses/CppTriangleMesh/CppTriangleMesh.pri)
include(../RibiClasses/CppXml/CppXml.pri)
include(../Triangle/ToolTriangleConsole.pri)
include(ToolTriangleMeshCreatorConsole.pri)

SOURCES += main.cpp

# QResources give this error
QMAKE_CXXFLAGS += -Wno-unused-variable
