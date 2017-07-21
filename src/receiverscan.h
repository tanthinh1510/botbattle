#ifndef RECEIVERSCAN_H
#define RECEIVERSCAN_H

#include <QObject>
#include <QDebug>

class receiverScan : public QObject
{
    Q_OBJECT
public:
    explicit receiverScan(QObject *parent = 0);

signals:
    void send_data(QString _name, QString _add, int _rssi);
public slots:
    void receiver_data(QString _name, QString _add, int _rssi);
};

#endif // RECEIVERSCAN_H
