TEMPLATE = app

QT += qml quick
CONFIG += c++11

linux-arm-gnueabihf-g++ {
    DEFINES+= IS_EMBEDDED=1
}


SOURCES += main.cpp\
           iocontroller.cpp
HEADERS += iocontroller.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
