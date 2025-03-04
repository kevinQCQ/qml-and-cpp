#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>



int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    app.setWindowIcon(QIcon("image/wushi.svg"));
    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("qml_learn", "Main");

    return app.exec();
}
