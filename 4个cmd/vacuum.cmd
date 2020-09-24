#!./streamApp

<envPaths

dbLoadDatabase "streamApp.dbd"
streamApp_registerRecordDeviceDriver

#where can protocols be located?
epicsEnvSet "STREAM_PROTOCOL_PATH", ".:protocols:../db"

#example serial port setup
drvAsynSerialPortConfigure "COM1", "/dev/ttyM0"
asynOctetSetInputEos "COM14",0,"\r\n"
asynOctetSetOutputEos "COM14",0,"\r\n"
asynSetOption ("COM14", 0, "baud", "9600")
asynSetOption ("COM14", 0, "bits", "8")
asynSetOption ("COM14", 0, "parity", "none")
asynSetOption ("COM14", 0, "stop", "1")

drvAsynSerialPortConfigure "COM2", "/dev/ttyM1"
asynOctetSetInputEos "COM15",0,"\r\n"
asynOctetSetOutputEos "COM15",0,"\r\n"
asynSetOption ("COM15", 0, "baud", "9600")
asynSetOption ("COM15", 0, "bits", "8")
asynSetOption ("COM15", 0, "parity", "none")
asynSetOption ("COM15", 0, "stop", "1")

drvAsynSerialPortConfigure "COM3", "/dev/ttyM2"
asynOctetSetInputEos "COM16",0,"\r\n"
asynOctetSetOutputEos "COM16",0,"\r\n"
asynSetOption ("COM16", 0, "baud", "9600")
asynSetOption ("COM16", 0, "bits", "8")
asynSetOption ("COM16", 0, "parity", "none")
asynSetOption ("COM16", 0, "stop", "1")

drvAsynSerialPortConfigure "COM4", "/dev/ttyM3"
asynOctetSetInputEos "COM16",0,"\r\n"
asynOctetSetOutputEos "COM16",0,"\r\n"
asynSetOption ("COM16", 0, "baud", "9600")
asynSetOption ("COM16", 0, "bits", "8")
asynSetOption ("COM16", 0, "parity", "none")
asynSetOption ("COM16", 0, "stop", "1")

#load your records

#load your records

dbLoadRecords "vacuum.db",""
dbLoadRecords "vacuumbutton.db","NUM=G0,PORT=COM1,CH=1"
dbLoadRecords "vacuumbutton.db","NUM=G3,PORT=COM1,CH=2"
dbLoadRecords "vacuumbutton.db","NUM=G12,PORT=COM1,CH=3"
dbLoadRecords "vacuumbutton.db","NUM=G14,PORT=COM1,CH=4"
dbLoadRecords "vacuumbutton.db","NUM=G1,PORT=COM1,CH=5"
dbLoadRecords "vacuumbutton.db","NUM=G2,PORT=COM1,CH=6"
dbLoadRecords "vacuumbutton.db","NUM=G15,PORT=COM2,CH=1"
dbLoadRecords "vacuumbutton.db","NUM=G16,PORT=COM2,CH=2"
dbLoadRecords "vacuumbutton.db","NUM=G17,PORT=COM2,CH=3"
dbLoadRecords "vacuumbutton.db","NUM=G4,PORT=COM2,CH=4"
dbLoadRecords "vacuumbutton.db","NUM=G5,PORT=COM2,CH=5"
dbLoadRecords "vacuumbutton.db","NUM=G6,PORT=COM2,CH=6"
dbLoadRecords "vacuumbutton.db","NUM=G7,PORT=COM3,CH=1"
dbLoadRecords "vacuumbutton.db","NUM=G8,PORT=COM3,CH=2"
dbLoadRecords "vacuumbutton.db","NUM=G9,PORT=COM3,CH=3"
dbLoadRecords "vacuumbutton.db","NUM=G10,PORT=COM3,CH=4"
dbLoadRecords "vacuumbutton.db","NUM=G11,PORT=COM3,CH=5"
dbLoadRecords "vacuumbutton.db","NUM=G13,PORT=COM3,CH=6"
dbLoadRecords "vacuumbutton.db","NUM=G18,PORT=COM4,CH=1"
dbLoadRecords "vacuumbutton.db","NUM=G19,PORT=COM4,CH=2"
dbLoadRecords "vacuumbutton.db","NUM=G20,PORT=COM4,CH=3"
dbLoadRecords "vacuumbutton.db","NUM=G21,PORT=COM4,CH=4"
#iocstate
#dbLoadRecords("iocAdminSoft.db", "IOC=VAIOC01")
#dbLoadRecords("iocRelease.db", "IOC=VAIOC01")

## Start any sequence programs
#seq sncxxx,"user=epicsHost"

iocInit
#var streamDebug 1

