#ifndef CALLBACK_H
#define CALLBACK_H

#include <QObject>
#include <QDebug>
#include <iostream>
#include <fstream>
using namespace std;

class Callback : public QObject
{
    Q_OBJECT
public:
    explicit Callback(QObject *parent = nullptr);

public slots:
    void cppSend(QString nickname, QString avocation, QString name, QString time, QString password, QString img);
//    void getImage(QString img);
    void sendMyMessage(QString message, QString uid);

private:

};

#endif // CALLBACK_H
