#include "actions.h"

using namespace std;

Actions::Actions(QObject *parent) :
    QObject(parent)
{
}

void Actions::rotation()
{
    qDebug() << "test";
}
