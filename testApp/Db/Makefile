TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

DB += bandwidth.template
DB += clamp.template
DB += asg.template
DB += dummy.db
DB += recovery.template
DB += recover-with-pdu.db
DB += recover-without-pdu.db
DB += TISCamMenu.req
DB += configMenu.req
DB += configMenu_settings.req

ifneq ($(ADEXAMPLE),)
DB_INSTALLS += $(ADEXAMPLE)/db/simDetector.template
endif
ifneq ($(ARAVISGIGE),)
DB_INSTALLS += $(ARAVISGIGE)/db/aravisCamera.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dmk_33GR0134.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dmk_33GX174.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dmk_33GX265.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dzk_33GX250.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dmk_33GX236.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dmk_33GX273.template
DB_INSTALLS += $(ADGENICAM)/db/TIS_dmk_33GX546.template
DB_INSTALLS += $(ADGENICAM)/db/ADGenICam.template
DB_INSTALLS += $(ADGENICAM)/db/ADGenICam_settings.req
DB_INSTALLS += $(ARAVISGIGE)/db/aravisCamera_settings.req
endif
DB_INSTALLS += $(EPICS_BASE)/db/ADBase.template
DB_INSTALLS += $(EPICS_BASE)/db/NDArrayBase.template
DB_INSTALLS += $(EPICS_BASE)/db/NDPluginBase.template
DB_INSTALLS += $(EPICS_BASE)/db/NDStdArrays.template

ifneq ($(ADCOMPVISION),)
DB_INSTALLS += $(ADCOMPVISION)/db/NDCV.template
endif

#DB_INSTALLS += $(EPICS_BASE)/db/configMenu.db
#DB_INSTALLS += $(EPICS_BASE)/db/ADAutoSaveMenu.req
DB_INSTALLS += $(EPICS_BASE)/db/ADBase_settings.req

DB_INSTALLS += $(EPICS_BASE)/db/NDStats.template
DB_INSTALLS += $(EPICS_BASE)/db/NDFile.template
DB_INSTALLS += $(EPICS_BASE)/db/NDFileTIFF.template
DB_INSTALLS += $(EPICS_BASE)/db/NDROI.template
DB_INSTALLS += $(EPICS_BASE)/db/NDROIStat.template
DB_INSTALLS += $(EPICS_BASE)/db/NDROIStatN.template
DB_INSTALLS += $(EPICS_BASE)/db/NDProcess.template
DB_INSTALLS += $(EPICS_BASE)/db/NDOverlay.template
DB_INSTALLS += $(EPICS_BASE)/db/NDOverlayN.template

ifneq ($(DEVIOCSTATS),)
DB_INSTALLS += $(DEVIOCSTATS)/db/iocAdminSoft.db
endif
ifneq ($(AUTOSAVE),)
DB_INSTALLS += $(AUTOSAVE)/db/save_restoreStatus.db
endif

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
