#include <QCoreApplication>
#include <QQmlApplicationEngine>
#include <QScopedPointer>
#include <QQmlComponent>
#include <QQmlContext>
#include <QDebug>
#include "iocontroller.h"

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    QQmlEngine engine;

    #ifdef IS_EMBEDDED
    //Add correct qml import path for embedded bbb
    engine.addImportPath("/usr/local/Qt5.5.1/qml/");
    #endif

    qmlRegisterType<IoController>("Bfh",1,0,"IoController"); //IoController will be created from main.qml

    QQmlContext objectContext(engine.rootContext());

    QQmlComponent component(&engine);
    component.loadUrl(QUrl("qrc:///main.qml"));

    QScopedPointer<QObject> comp(component.create(&objectContext));
    if(comp.isNull()) {
        qDebug() << component.errorString();
        return EXIT_FAILURE;
    } else {
        QObject::connect(comp.data(),SIGNAL(quit()),&app,SLOT(quit()));
        return app.exec();
    }
}
