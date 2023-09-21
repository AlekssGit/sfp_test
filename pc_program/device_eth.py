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

    def start_send_def_packet(self):
        self.device_config.write(address=0x50, data=0x120, mode='word') 

    def stop_send_def_packet(self):
        self.device_config.write(address=0x50, data=0x0, mode='word')

    def read_reg(self, addr):
        return str(hex(self.device_config.read(address=addr, count=1, mode='word')))

    def write_reg(self, addr, data):
        self.device_config.write(address=addr, data=data, mode='word')

# # read test packet after set up ddr
# data_read = device.read(address=0x20, count=6*4*4)

# count_four_byte = len(data_read)//4

# four_byte_li = []

# for i in range(count_four_byte):
#     tmp_data = data_read[i*4:i*4 + 4]
#     four_byte = 0
#     for k in range(len(tmp_data)):
#         four_byte += tmp_data[k] << 8*k
    
#     four_byte = addZeroes(hex(four_byte))
#     four_byte_li.append(four_byte)

# for i, el in enumerate(four_byte_li):
#     print(el) if i > 0 and (i + 1) % 4 == 0 else print(el, end=' ')


