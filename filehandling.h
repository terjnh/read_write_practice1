#ifndef FILEHANDLING_H
#define FILEHANDLING_H

#include <QObject>
#include <QDebug>

class FileHandling : public QObject
{
    Q_OBJECT
public:
    explicit FileHandling(QObject *parent = nullptr);

signals:

public slots:
    void openFile();

};

#endif // FILEHANDLING_H
