QT += qml quick sql widgets quickcontrols2

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        callback.cpp \
        cppCode/tfchangecolor.cpp \
        cppCode/tfonactivechangecolor.cpp \
        main.cpp \
        mysql.cpp \
        tableview.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    callback.h \
    cppCode/tfchangecolor.h \
    cppCode/tfonactivechangecolor.h \
    mysql.h \
    tableview.h

DISTFILES +=
