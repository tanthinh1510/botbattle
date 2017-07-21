#include "linkmanager.h"

linkManager::linkManager(QObject *parent) : QObject(parent)
{

}

void linkManager::linkConnect(receiverScan *m_receiver, BLEmanager *m_blemanager)
{
    connect(m_receiver,SIGNAL(send_data(QString,QString,int)),m_blemanager,SLOT(call_frome_java(QString,QString,int)));
}

