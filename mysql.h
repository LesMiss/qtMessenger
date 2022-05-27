#ifndef MYSQL_H
#define MYSQL_H

#include <QObject>
#include <QtSql>
#include <QSqlDatabase>
#include <QDebug>
#include <QTableView>

class mysql : public QObject
{
    Q_OBJECT
public:
    explicit mysql(QObject *parent = nullptr);

signals:

};

#endif // MYSQL_H
