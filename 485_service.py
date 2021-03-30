from pymongo import MongoClient
import datetime
import time
import re
import serial
from serial import Serial

client = MongoClient('localhost', 27017)

db = client.test_database

collection = db.sensors


ser = serial.Serial('/dev/ttyUSB0',9600,timeout=4);

while True:
    #percorre dados da collection
    for item in collection.find():
        print("Buscando no sensor:");
        print(item['id_485']);
        print('\n');
        ser.write(str(item['id_485']))
        ser.write("|\n");
        line = ser.readline();
        slices = line.split('|');
        
        if(len(slices) > 1):
            print(slices)
            item['valor_atual'] = slices[1]
            collection.update({'_id':item['_id']},item,True)
        print(line);


            
time.sleep(1)




