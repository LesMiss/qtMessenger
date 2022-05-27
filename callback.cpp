#include "callback.h"
#include <QtSql>
#include <QSqlDatabase>
#include <QDebug>



Callback::Callback(QObject *parent)
    : QObject{parent}
{

}

void Callback::cppSend(QString nickname, QString avocation, QString name, QString time, QString password, QString img)
{
    qDebug() << nickname << avocation << password;
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

    // Set time and date
    QDateTime local(QDateTime::currentDateTime());
    QDateTime UTC(local);
    UTC.setTimeSpec(Qt::UTC);

    QSqlQuery query;

    query.prepare("INSERT INTO `libUsr`.`usr` (`nickname`, `name`, `avocation`, `time`, `password`, `dateRegister`, `avatar`) "
                  "VALUES (?, ?, ?, ?, ?, ?, ?)");
    query.addBindValue(nickname);
    query.addBindValue(name);
    query.addBindValue(avocation);
    query.addBindValue(time);
    query.addBindValue(password);
    query.addBindValue(UTC.toString().toUtf8().constData());
    QPixmap original("file:///Users/migellestev/Downloads/Telegram Desktop/DSC_1886.JPG");
    QImage rgb2Gray;
    rgb2Gray = original.toImage().convertToFormat(QImage::Format_Grayscale8);
    QPixmap grayScale = original.fromImage(rgb2Gray);
    query.addBindValue(rgb2Gray);
    query.exec();
    cout << "data was uploaded" << endl;
}

//void Callback::getImage(QString img)
//{


//}

void Callback::sendMyMessage(QString message, QString uid)
{
    //    qDebug() << "Table is " << message << "have this id: " << uid;
    //    QSqlQuery query;
    //    QString argument = "CREATE TABLE `messages`.`" + uid + "` (`fromId` INT NOT NULL, `toId` VARCHAR(45) NOT NULL, `id` VARCHAR(45) NULL, PRIMARY KEY (`toId`));";
    //    query.exec(argument);
}


















