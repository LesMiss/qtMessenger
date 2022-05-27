#include "modellist.h"
#include <iostream>
using namespace std;

ModelList::ModelList(QObject *parent)
    : QObject{parent}
{

}

void ModelList::appendItem()
{
    emit preItemAppended();

    tableModelList item;

    // add DataBase
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("Upmisha2005");
    db.setDatabaseName("LibUsr");

    // testing db if working..
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

    //insert data

    QSqlQuery query;
    query.exec("SELECT * FROM usr");
    while (query.next()) {
        item.name = query.value("name").toString().toUtf8().constData();
        item.profession = query.value("profession").toString().toUtf8().constData();
        item.age = query.value("age").toString().toUtf8().constData();

//        cout << item.name << " " << item.profession << " - " <<  item.age << endl;
        tableItems.append(item);
        postItemAppended();
    }

}
