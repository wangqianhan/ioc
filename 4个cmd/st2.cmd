#!../../bin/linux-xscale_be/moxa

## You may have to change support to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH","/root/accdaoru/db")
cd "${TOP}"

# AUTOSAVE
epicsEnvSet IOCNAME ioc1
epicsEnvSet SAVE_DIR /root/auto

## Register all support components
dbLoadDatabase "dbd/moxa.dbd"
moxa_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure ("PS1", "192.168.30.170:8000")
#drvAsynIPPortConfigure ("PS2", "192.168.30.172:8000")
#drvAsynIPPortConfigure ("PS3", "192.168.1.127:8000")
## Load record instances
#dbLoadTemplate "db/user.substitutions"
#device1.
dbLoadRecords "db/accdaoru1.db","dev=X1,port=PS1,proto=x,num=1"
dbLoadRecords "db/accdaoru1.db","dev=Y1,port=PS1,proto=y,num=2"
dbLoadRecords "db/accdaoru1.db","dev=Z1,port=PS1,proto=z,num=3"
#dbLoadRecords "db/accdaoru1.db","dev=T1,port=PS1,proto=t,num=4"
#device2.
#dbLoadRecords "db/accdaoru1.db","dev=X2,port=PS2,proto=x,num=5"
#dbLoadRecords "db/accdaoru1.db","dev=Y2,port=PS2,proto=y,num=6"
#dbLoadRecords "db/accdaoru1.db","dev=Z2,port=PS2,proto=z,num=7"
#dbLoadRecords "db/accdaoru1.db","dev=T2,port=PS2,proto=t,num=8"
#device3.
#dbLoadRecords "db/accdaoru1.db","dev=X3,port=PS3,proto=x,num=9"
#dbLoadRecords "db/accdaoru1.db","dev=Y3,port=PS3,proto=y,num=10"
#dbLoadRecords "db/accdaoru1.db","dev=Z3,port=PS3,proto=z,num=11"
#dbLoadRecords "db/accdaoru1.db","dev=T3,port=PS3,proto=t,num=12"

## Set this to see messages from mySub
#var mySubDebug 1

cd ${AUTOSAVE}
## Optional database for autosave status
#dbLoadRecords "db/save_restoreStatus.db", "P=$(IOCNAME):"
set_requestfile_path("$(SAVE_DIR)")
set_savefile_path("$(SAVE_DIR)")
save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(30)
set_pass1_restoreFile("$(IOCNAME).sav")

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

################## AUTOSAVE ##################
## Create request file and start periodic 'save’
makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOCNAME).req","autosaveFields")
#
create_monitor_set("$(IOCNAME).req",5)
################## AUTOSAVE ##################

## Start any sequence programs
seq accdaoru, "unit1=X1"
seq accdaoru, "unit1=Y1"
seq accdaoru, "unit1=Z1"
#seq sncExample, "unit1=T1"
#seq sncExample, "unit1=X2"
#seq sncExample, "unit1=Y2"
#seq sncExample, "unit1=Z2"
#seq sncExample, "unit1=T2"
#seq sncExample, "unit1=X3"
#seq sncExample, "unit1=Y3"
#seq sncExample, "unit1=Z3"
#seq sncExample, "unit1=T3"
#seq sncExample, "unit1=Y1"
