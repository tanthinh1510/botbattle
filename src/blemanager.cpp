#include "blemanager.h"

BLEmanager::BLEmanager(QObject *parent) : QObject(parent), localDevice(new QBluetoothLocalDevice)
{
    m_timer = new QTimer(this);
    power_enable();
    m_bleInterface = new BLEInterface(this);

    connect(m_bleInterface, &BLEInterface::dataReceived,this, &BLEmanager::dataReceived);
    connect(m_bleInterface, &BLEInterface::devivedisconnect,[this]{
        emit device_connect(false);
    });
    connect(m_bleInterface,SIGNAL(connectedChanged(bool)),this,SLOT(update_connect_status(bool)));

}

void BLEmanager::disconnectDevice()
{
    m_bleInterface->disconnectDevice();
}

void BLEmanager::connect_to_device(QString _address)
{
    m_bleInterface->connectCurrentDevice(_address);
}

void BLEmanager::send_command_direct_to_device(unsigned char _value)
{
    unsigned char datapass[] = {_value};
    int size = sizeof(datapass);
    m_bleInterface->write(QByteArray((char*)datapass,size));
}

void BLEmanager::send_command_speed_to_device(unsigned char _value,unsigned char _speed)
{
    qDebug() << "direct" << _value;
    if(_value == 48){

        unsigned char datapass[] = {0x00,_speed};
        int size = sizeof(datapass);
        m_bleInterface->write(QByteArray((char*)datapass,size));
    }
    else if(_value == 49){

        unsigned char datapass[] = {0x01,_speed};
        int size = sizeof(datapass);
        m_bleInterface->write(QByteArray((char*)datapass,size));
    }
    else if(_value == 50){

        unsigned char datapass[] = {0x02,_speed};
        int size = sizeof(datapass);
        m_bleInterface->write(QByteArray((char*)datapass,size));
    }
    else if(_value == 51){

        unsigned char datapass[] = {0x03,_speed};
        int size = sizeof(datapass);
        m_bleInterface->write(QByteArray((char*)datapass,size));
    }
    else if(_value == 52){

        unsigned char datapass[] = {0x04,_speed};
        int size = sizeof(datapass);
        m_bleInterface->write(QByteArray((char*)datapass,size));
    }


}

void BLEmanager::scanBLE(bool _status)
{
    if(_status){
        QAndroidJniObject::callStaticMethod<void>("org/qtproject/botbattle/MainActivity",
                                              "scanNewAdvertise");
    }
    else QAndroidJniObject::callStaticMethod<void>("org/qtproject/botbattle/MainActivity",
                                                   "stopScanNewAdvertise");
}

void BLEmanager::power_enable()
{
    localDevice->powerOn();
}



void BLEmanager::call_frome_java(QString _name, QString _add, int _rssi)
{
    emit ble_name(_name,_add, _rssi);
}

void BLEmanager::update_connect_status(bool _status)
{
    emit device_connect(_status);

}

void BLEmanager::dataReceived(QByteArray data)
{
    qDebug() << "Data receiver: " << data;
}

