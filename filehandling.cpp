#include "filehandling.h"

FileHandling::FileHandling(QObject *parent) : QObject(parent)
{

}

QString FileHandling::read()
{
    if(mSource.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(mSource);
    QString fileContent;
    if(file.open(QIODevice::ReadOnly)) {
        QString line;
        QTextStream t(&file);
        do {
            line = t.readAll();
            fileContent += line;
        } while (!line.isNull());

        file.close();
    } else {
        emit error("Unable to open the file");
        return QString();
    }
    return fileContent;
}

bool FileHandling::write(const QString &data)
{
    if(mSource.isEmpty())
        return false;

    QFile file(mSource);
    if(!file.open(QFile::WriteOnly | QFile::Truncate))
        return false;

    QTextStream out(&file);
    out << data;

    file.close();

    return true;
}

QString FileHandling::source()
{
    return mSource;
}

//void FileHandling::openFile()
//{
//    qDebug() << "Open File slot called in C++";
//}

void FileHandling::setSource(const QString &source)
{
    mSource = source;
}
