#include "mysql.h"
#include <iostream>
using namespace std;

mysql::mysql(QObject *parent)
    : QObject{parent}
{

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");

    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("Upmisha2005");
    db.setDatabaseName("LibUsr");

    if (!db.open()) {
        qDebug() << "Cannot open database:" << db.lastError();

    } else {
        cout << "success" << endl;
        // testing
        QStringList lst = db.tables();
        foreach (QString str, lst) {
            qDebug() << "Table is " << str;
        }
    }

    string userid, username, userprofession;

    QSqlQuery query;
    query.exec("SELECT * FROM usr");
    while (query.next()) {
        userid = query.value("idusr").toString().toUtf8().constData();
        username = query.value("name").toString().toUtf8().constData();
        userprofession = query.value("profession").toString().toUtf8().constData();

        cout << userid << " " << username << " - " <<  userprofession << endl;

    }

}
