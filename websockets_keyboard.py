import numpy as np
import socket

HOST = ''                 # Symbolic name meaning all available interfaces
PORT = 5000              # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print('Connected by', addr)


while True:
    data = conn.recv(1024)
    if not data: break
    raw_data = data.decode()
    #print(raw_data) # note that raw_data sometimes returns 
    
    #y = np.array([b == "1" for b in raw_data.split('\n')[0].split()]) # store data here "0 1 0 1"
    y = np.array([int(i) for i in raw_data.split('\n')[0]])
    print(y)
