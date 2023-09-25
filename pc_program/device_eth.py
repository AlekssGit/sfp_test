import asdpci.asdpci as pci



def addZeroes(hex_str):
    return hex_str[0:2] + '0'*(10 - len(hex_str)) + hex_str[2:]

# device = connectDevice()
# dev_config = device.config()

class EthDevice():

    def __init__(self) -> None:
        self.connectDevice()

    def connectDevice(self):
        devs_info = pci.list_devices()
        print(f'devs_info: {devs_info}')
        self.device = pci.Device(devs_info[0])
        self.device_config = self.device.config()

    def read_ddr_status(self):
        # read status reg ddr
        data_read = self.device_config.read(address=0xC0, count=4)

        tmp_data = data_read
        four_byte = 0
        for k in range(len(tmp_data)):
            four_byte += tmp_data[k] << 8*k

        four_byte = addZeroes(hex(four_byte))

        return four_byte
    
    def init_ddr(self):
        self.device_config.write(address=0xB0, data=0x1, mode='word') 

    def start_send_one_packet(self, ddr_addr):
        self.device_config.write(address=0x50, data=0x120, mode='word') 

    def stop_send_one_packet(self, ddr_addr):
        data = self.device_config.read(address=0x50, count=1, mode='word')
        self.device_config.write(address=0x50, data=data and 0xfeff, mode='word')

    def read_reg(self, addr):
        return str(hex(self.device_config.read(address=addr, count=1, mode='word')))

    def write_reg(self, addr, data):
        self.device_config.write(address=addr, data=data, mode='word')

    def place_packet_to_ddr(self, start_addr, packet_data):
        for el in packet_data:
            self.device.write(address=start_addr, data=el, mode='word')