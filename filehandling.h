#ifndef FILEHANDLING_H
#define FILEHANDLING_H

#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QDebug>

class FileHandling : public QObject
{
    Q_OBJECT

public:
    explicit FileHandling(QObject *parent = nullptr);

    Q_PROPERTY(QString source
               READ source
               WRITE setSource
               NOTIFY sourceChanged)

    // Getter & Setter for source
    Q_INVOKABLE QString read();
    Q_INVOKABLE bool write(const QString &data);

    QString source();

signals:
    void sourceChanged(const QString &source);
    void error(const QString &msg);

public slots:
    // void openFile();

    void setSource(const QString &source);

private:
    QString mSource;
};

#endif // FILEHANDLING_H
