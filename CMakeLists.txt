cmake_minimum_required(VERSION 3.16)

project(GrayScaleImage VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick ShaderTools)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appGrayScaleImage
    main.cpp
)

qt_add_qml_module(appGrayScaleImage
    URI GrayScaleImage
    VERSION 1.0
    QML_FILES
        Main.qml
        GradientText.qml
        BatteryScreen.qml
        GridMeshTest.qml
    RESOURCES
        Qtlogo.png
)

qt_add_shaders(appGrayScaleImage "shaders"
    PREFIX "/"
    FILES
        myeffect.vert
        myeffect.frag
        mask.frag
        battery.frag
        gridmesh.vert
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appGrayScaleImage PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appGrayScaleImage
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appGrayScaleImage
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appGrayScaleImage
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
