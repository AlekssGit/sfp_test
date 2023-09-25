import sys
import typing

from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine
from PyQt6.QtCore import QObject, pyqtSlot, pyqtSignal

import device_eth as dev

from time import sleep

app = QGuiApplication(sys.argv)

device = None

def connect_dev():
    global device
    device = dev.EthDevice()
    print('Device connected!')
    read_ddr_status()

def read_ddr_status():
    print(f'DDR status: {device.read_ddr_status()}')

def init_ddr():
    device.init_ddr()
    sleep(0.2)
    read_ddr_status()

def start_def_pack():
    device.start_send_one_packet(ddr_addr=0x1)

def stop_def_pack():
    device.stop_send_one_packet(ddr_addr=0x1)

def set_pack_ddr():
    file = open('pc_program/packet_data.txt', 'r')

    data_file = [int(el.strip(), 16) for el in file.readlines()]

    device.place_packet_to_ddr(start_addr=0x10, packet_data=data_file)

class PacketTimer(QObject):
    updated = pyqtSignal(str)

    def __init__(self):
        super().__init__()

        self._text_timer_reg = 'data from FGPA'

    def update_text_timer_reg(self):
        tmp_str = device.read_reg(addr=0x60)
        self._text_timer_reg = tmp_str
        self.updated.emit(self._text_timer_reg)

    @pyqtSlot(str)
    def value_changed(self, str):
        device.write_reg(addr=0x60, data=int(str, 16))
        sleep(0.2)
        print(f'New value from FPGA: {device.read_reg(addr=0x60)}')
        self.update_text_timer_reg()

class Btn(QObject):

    def __init__(self, func_click=None) -> None:
        super().__init__()

        self._func = func_click

    @pyqtSlot()
    def click(self):
        if not self._func is None: self._func()
        else:
            packet_timer.update_text_timer_reg() 
            print("click")

btn_click           = Btn()
btn_connect         = Btn(connect_dev)
btn_rd_ddr_st       = Btn(read_ddr_status)
btn_init_ddr        = Btn(init_ddr)
btn_start_def       = Btn(start_def_pack)
btn_stop_def        = Btn(stop_def_pack)
btn_set_pack_ddr    = Btn(set_pack_ddr)


packet_timer = PacketTimer()
btn_update_timer_val   = Btn(packet_timer.update_text_timer_reg)


engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)
engine.load('pc_program/main.qml')

engine.rootObjects()[0].setProperty('btn_click', btn_click)
engine.rootObjects()[0].setProperty('btn_connect_dev', btn_connect)
engine.rootObjects()[0].setProperty('btn_read_ddr_status', btn_rd_ddr_st)
engine.rootObjects()[0].setProperty('btn_init_ddr', btn_init_ddr)
engine.rootObjects()[0].setProperty('btn_start_send_def', btn_start_def)
engine.rootObjects()[0].setProperty('btn_stop_send_def', btn_stop_def)
engine.rootObjects()[0].setProperty('btn_set_pack_to_ddr', btn_set_pack_ddr)
engine.rootObjects()[0].setProperty('packet_time', packet_timer)
engine.rootObjects()[0].setProperty('btn_update_timer', btn_update_timer_val)

packet_timer.updated.emit(packet_timer._text_timer_reg)
sys.exit(app.exec())