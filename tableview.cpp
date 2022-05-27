#include "tableview.h"
#include <iostream>
using namespace std;

TableView::TableView(QObject *parent)
    : QAbstractTableModel{parent}
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
    tableViewList model;
    query.exec("SELECT * FROM usr");
    while (query.next()) {
        model.name = query.value("name").toString().toUtf8().constData();
        model.avocation = query.value("avocation").toString().toUtf8().constData();
        model.time = query.value("time").toString().toUtf8().constData();

        /// __________________

//        QByteArray bArray;
//        QBuffer buffer(&bArray);
//        buffer.open(QIODevice::WriteOnly);
//        myImage.save(&buffer, "JPEG");

        model.avatar = query.value("avatar").toString().toUtf8().constData();

        qDebug("success");
        table.append(model);

    }
}

//const QString TableView::picture()
//{
//   QImage myImage;
//  // Some init code to setup the image (e.g. loading a PGN/JPEG, etc.)
//  QByteArray bArray;
//  QBuffer buffer(&bArray);
//  buffer.open(QIODevice::WriteOnly);
//  myImage.save(&buffer, "JPEG");

//  QString image("data:image/jpg;base64,");
//  image.append(QString::fromLatin1(bArray.toBase64().data()));

//  return image;
//}

// 1. rowCount
int TableView::rowCount(const QModelIndex &) const
{
    return table.count();
}

// 2. columnCount
int TableView::columnCount(const QModelIndex &) const
{
    return 4;
}

// 3. data
QVariant TableView::data(const QModelIndex &index, int role) const
{

        const tableViewList model = table.at(index.row());

        if (!index.isValid())
            return QVariant();
        switch (role) {
        case UserName:
            return model.name;
        case UserRole:
            return model.avocation;;
        case UserTime:
            return model.time;
        case UserAvatar:
            return model.avatar;
        }
        return QVariant();


}

QHash<int, QByteArray> TableView::roleNames() const
{
    QHash<int, QByteArray> names;
    names[UserName] = "name";
    names[UserRole] = "avocation";
    names[UserTime] = "time";
    return names;
}
