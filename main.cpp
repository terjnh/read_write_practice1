#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQuickView>
#include <QUrl>
#include <QQmlContext>

#include "filehandling.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    //Set style
    QQuickStyle::setStyle("Universal");

    QGuiApplication app(argc, argv);

    // Export instantiated object file_handling to QML and make the connection there
    QQuickView mainview(QUrl("qrc:/main.qml"));
    FileHandling file_handling;
    mainview.rootContext()->setContextProperty("file_handling", &file_handling);


    /* Mystery black box below: Commenting the bottom lines out allow me to start the App as a single window
        Communication between QML SIGNAL and C++ SLOT seems to work */
//    QQmlApplicationEngine engine;
//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

//    mainview.show();


    return app.exec();
}
