#include <auroraapp.h>
#include <QtQuick>
#include <QObject>
#include <QDebug>
#include "actions.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("com.alexbayker"));
    application->setApplicationName(QStringLiteral("TetrisAurora"));

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/TetrisAurora.qml")));
    view->show();

    QObject *rotationButton = view->findChild<QObject*>("rotationButton");

    qDebug() << "TEST" << &rotationButton;

    //Actions actions;
    //&rotationButton->root->setContextProperty(QStringLiteral("_actions"), &actions);

    return application->exec();
}
