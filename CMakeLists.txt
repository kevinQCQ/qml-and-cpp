cmake_minimum_required(VERSION 3.16)

project(qml_learn VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Widgets  Multimedia MultimediaWidgets)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appqml_learn
    main.cpp
)

qt_add_qml_module(appqml_learn
    URI qml_learn
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES image/wushi.svg image/back.svg image/love.svg image/close.svg image/next.svg image/pause.svg image/play.svg image/previous.svg image/random_play.svg image/sequence_play.svg
        RESOURCES image/wushi.svg
        QML_FILES LayoutHeaderView.qml
        QML_FILES LayoutBottomView.qml
        QML_FILES LayoutPageView.qml
        QML_FILES MusicIcon.qml
        RESOURCES image/about.svg image/set.svg image/small.svg
        RESOURCES image/混沌武士.jpg
        RESOURCES image/album.svg image/history.svg image/like.svg image/local.svg image/recommend.svg image/search.svg
        RESOURCES image/album.png image/history.png image/like.png image/local.png image/recommend.png image/search.png
        QML_FILES RecommendPage.qml
        QML_FILES BannerPage.qml
        RESOURCES GridPage.qml
        QML_FILES
        SOURCES importmusic.h importmusic.cpp
        QML_FILES SearchPage.qml
        RESOURCES image/list.svg image/play.svg image/search.svg image/upload.svg
        QML_FILES BackgroudColor.qml
        RESOURCES image/aurora.jpg
        RESOURCES image/aurora2.jpg
        QML_FILES ImageButton.qml
        RESOURCES image/new_load.svg image/new_msg.svg image/new_play.svg image/new_search.svg
        SOURCES
        SOURCES
        SOURCES PlaylistModel.h
        QML_FILES Play_song.qml
        RESOURCES image/comeback.svg
        SOURCES lyricshandler.h lyricshandler.cpp

)



# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIERimage/.svg
set_target_properties(appqml_learn PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appqml_learn
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appqml_learn
    PRIVATE Qt6::Quick
    PRIVATE Qt6::Widgets
    PRIVATE Qt6::Multimedia
    PRIVATE Qt6::MultimediaWidgets
)

include(GNUInstallDirs)
install(TARGETS appqml_learn
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
