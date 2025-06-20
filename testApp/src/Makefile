TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

# private headers
USR_CPPFLAGS += -I$(TOP)/warpApp/src

#=============================
# Build the IOC application

PROD_IOC = test
# test.dbd will be created and installed
DBD += test.dbd

test_DBD += seqRecord.dbd calc.dbd
test_DBD += busySupport.dbd
test_DBD += base.dbd

test_LIBS += busy seq calc pv

# test_registerRecordDeviceDriver.cpp derives from test.dbd
test_SRCS += test_registerRecordDeviceDriver.cpp
test_SRCS += testMain.cpp
ifneq ($(ADCOMPVISION),)
test_DBD += NDPluginCV.dbd
test_LIBS += NDPluginCV
endif

test_DBD  += NDPluginWarp.dbd
test_LIBS += NDPluginWarp

test_SNCFLAGS += +s
test_SNCFLAGS += +r

test_SRCS += sncPDURecovery.stt
test_DBD += sncPDURecovery.dbd
test_LIBS += seq pv

ifneq ($(ADEXAMPLE),)
test_DBD += simDetectorSupport.dbd
test_LIBS += simDetector
endif

ifneq ($(ARAVISGIGE),)
ADAravis_DIR = $(ARAVISGIGE)/lib/$(EPICS_HOST_ARCH)
USR_LDFLAGS += -Wl,-rpath $(ADAravis_DIR)
test_DBD += ADAravisSupport.dbd
test_LIBS += ADAravis
PROD_SYS_LIBS += microhttpd aravis-0.8
endif

# used by commonDriverMakefile
PROD_NAME = test

include $(DIAGSTD)/configure/fribdiagstdMakefile
USR_CPPFLAGS += -g
USR_LDFLAGS += -g 
#===========================
#
include /etc/epics/configure/commonDriverMakefile
include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
