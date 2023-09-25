file = open('pc_program/packet_data.txt', 'r')

data_file = [int(el.strip(), 16) for el in file.readlines()]

print(data_file)