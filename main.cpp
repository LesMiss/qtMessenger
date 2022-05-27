#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QSessionManager>
#include <QQuickStyle>
#include <QFile>

// my imports
#include <callback.h>
#include <tableview.h>
#include "cppCode/tfchangecolor.h"
#include "cppCode/tfonactivechangecolor.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    // Set and observe all users (file: tableview.cpp/.h, MessagePage.qml) -->
    qmlRegisterType< TableView >("TableView", 1, 0, "TableViewModel");

    // Send messages (file: callback.cpp/.h, MessagePage.qml) -->
    qmlRegisterType< Callback >("Messages", 1, 0, "Callback");

    // Set change colors to password (file: tfchangecolor.cpp/.h, smarttextfield.qml) -->
    qmlRegisterType<  TFChangeColor > ("SmartChangeColor", 1, 0, "TFChangeColor");

    // Set change colors to password (file: tfonactive.cpp/.h, customtextfield.qml) -->
    qmlRegisterType< TFOnActiveChangeColor > ("CustomChangeColor", 1, 0, "TFOnActiveChangeColor");
    // Set change colors to password (file: tfonactive.cpp/.h, customtextfield.qml) -->
    qmlRegisterType< Callback > ("Callback123", 1, 0, "Callback");

    QQmlApplicationEngine engine;
//    const QUrl url(QStringLiteral("qrc:/main.qml"));
    const QUrl url(QStringLiteral("qrc:/allPages/mainWindow/MainWindow.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    Callback callBack;



//    QQmlComponent comp(&engine, QUrl("qrc:/main.qml"));
//    QObject* pobj = comp.create();
//    QObject* pandInfoButton = pobj->findChild<QObject*>("InfoButton");
//    QObject::connect(pandInfoButton, SIGNAL(infoClicked(QString)), &callBack, SLOT(cppSend(QString)));

    return app.exec();
}


