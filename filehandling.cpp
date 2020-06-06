#include "filehandling.h"

FileHandling::FileHandling(QObject *parent) : QObject(parent)
{

}

void FileHandling::openFile()
{
    qDebug() << "Open File slot called in C++";
}
