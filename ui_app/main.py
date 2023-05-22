from pathlib import Path
import sys

from PyQt6.QtWidgets import QApplication, QWidget
from PyQt6 import uic


class MainWindow(QWidget):
    def __init__(self) -> None:
        super().__init__()
        ui_file = Path(__file__).parent / Path("ui_app/ui/main.ui").resolve()
        uic.loadUi(ui_file, self)


if __name__ == "__main__":
    # Qt application setup
    app = QApplication(sys.argv)
    app.setStyle("Fusion")
    win = MainWindow()
    win.show()
    sys.exit(app.exec())
