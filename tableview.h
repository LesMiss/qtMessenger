#ifndef TABLEVIEW_H
#define TABLEVIEW_H

#include <QObject>
#include <QAbstractTableModel>
#include <QtSql>
#include <QSqlDatabase>
#include <QDebug>
#include <QTableView>

struct tableViewList {
    QString name;
    QString avocation;
    QString time;
    QString avatar;
};

class TableView : public QAbstractTableModel
{
    Q_OBJECT
public:
    explicit TableView(QObject *parent = nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override;
    int columnCount(const QModelIndex & = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    QImage myImage;

    // Roles -->
    enum {
        UserName,
        UserRole,
        UserTime,
        UserAvatar
    };

signals:

private:
    QVector<tableViewList> table;
};

#endif // TABLEVIEW_H
