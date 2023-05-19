import os, sys

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtCore import QtMsgType, qInstallMessageHandler
from PyQt6.QtCore import QObject, pyqtProperty, pyqtSlot, pyqtSignal


class Backend(QObject):
    def __init__(self):
        super().__init__()


def qt_message_handler(mode, context, message):
    if mode == QtMsgType.QtInfoMsg:
        mode = "Info"
    elif mode == QtMsgType.QtWarningMsg:
        mode = "Warning"
    elif mode == QtMsgType.QtCriticalMsg:
        mode = "critical"
    elif mode == QtMsgType.QtFatalMsg:
        mode = "fatal"
    else:
        mode = "Debug"
    print(f"{mode}: {message}")


if __name__ == "__main__":
    qInstallMessageHandler(qt_message_handler)
    # directory where this file is located
    workdir = os.path.dirname(os.path.abspath(__file__))

    # Qt application setup
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.quit.connect(app.quit)

    # Define our backend object, which we pass to QML.
    backend = Backend()

    # register backend to QML engine
    engine.rootContext().setContextProperty("backend", backend)

    engine.load(os.path.join(workdir, "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)

    # run the application
    sys.exit(app.exec())
