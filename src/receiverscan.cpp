#include "receiverscan.h"

receiverScan::receiverScan(QObject *parent) : QObject(parent)
{

}

void receiverScan::receiver_data(QString _name, QString _add, int _rssi)
{
//   qDebug() << "data receiver" << _data;
   emit send_data(_name,_add,_rssi);
}

