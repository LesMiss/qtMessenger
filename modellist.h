#ifndef MODELLIST_H
#define MODELLIST_H

#include <QObject>
#include<QVector>
#include <QtSql>
#include <QSqlDatabase>

struct tableModelList {
    QString name;
    QString profession;
    QString age;
};

class ModelList : public QObject
{
    Q_OBJECT
public:
    explicit ModelList(QObject *parent = nullptr);



signals:
    void preItemAppended();
    void postItemAppended();

public slots:
    void appendItem();

private:
    QVector<tableModelList> tableItems;

};


#endif // MODELLIST_H
