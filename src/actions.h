#ifndef ACTIONS_H
#define ACTIONS_H

#include <QObject>
#include <QDebug>

class Actions : public QObject
{
    Q_OBJECT
public:
    Actions(QObject *parent = 0);

signals:

public slots:
    void rotation();
};

#endif // ACTIONS_H
