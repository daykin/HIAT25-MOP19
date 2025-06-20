#!../../bin/linux-x86_64-debug/test

< envPaths

epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES", "6000100")
#epicsEnvSet("DIAGSTD_DISABLE_AUTOSAVE", "YES")
# Prefix for all records
epicsEnvSet("PREFIX", "MY_TEST_CAMERA:")
# The port name for the detector
epicsEnvSet("PORT",   "ARV1")
# The queue size for all plugins
epicsEnvSet("QSIZE",  "20")
# The maximim image width; used for row profiles in the NDPluginStats plugin
epicsEnvSet("XSIZE",  "2000")
# The maximim image height; used for column profiles in the NDPluginStats plugin
epicsEnvSet("YSIZE",  "1500")
# The maximum number of time series points in the NDPluginStats plugin
epicsEnvSet("NCHANS", "2048")

# libaravis camera name (use arv-tool to list accessible cameras)
epicsEnvSet("ARVCAM", "YOUR_CAMERA_NAME")

epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(TOP)/db:$(ADCORE)/db")

scanOnceSetQueueSize(5000)
callbackSetQueueSize(10000)
dbLoadDatabase("../../dbd/test.dbd")
test_registerRecordDeviceDriver(pdbbase)

aravisConfig("$(PORT)", "$(ARVCAM)")
dbLoadRecords("aravisCamera.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=100")
dbLoadRecords("/var/adgenicam/db/TIS_dmk_33GX273.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=100")

NDStdArraysConfigure("Image1", 3, 0, "$(PORT)", 0)
dbLoadRecords("NDStdArrays.template", "P=$(PREFIX),R=image1:,PORT=Image1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=ARV1,TYPE=Int16,FTVL=SHORT,NELEMENTS=5100000")

< ../CV.cmd
< $(EPICS_BASE)/iocBoot/commonPlugins.cmd

dbLoadRecords("recover-with-pdu.db", "P=$(PREFIX), R=cam1:, CONFIG=$(ASCONFIG)")

iocInit

set_requestfile_path("$(TOP)/db")
set_requestfile_path("/usr/lib/epics/db")
set_requestfile_path(".")

create_manual_set("TISCamMenu.req", "P=$(PREFIX), CONFIG=$(ASCONFIG), CONFIGMENU=1")
seq sncPDURecovery, "CAM=$(PREFIX), PDU=YOUR_PDU_PV_PREFIX:, O=1"

< ../CV_postinit.cmd

