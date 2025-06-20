#Second Processing plugin to convert formats
NDProcessConfigure("PROC2", 20, 0, "ARV1", 0, 0, 0)
dbLoadRecords("NDProcess.template",   "P=$(PREFIX), R=Proc2:,  PORT=PROC2,ADDR=0,TIMEOUT=1,NDARRAY_PORT=ARV1")

#CV1 to perform median filter
NDCVConfigure("CV1", 16, 0, "$(PORT)", 0, 0, 0, 0, 0, $(MAX_THREADS=5))
dbLoadRecords("NDCV.template", "P=$(PREFIX), R=CV1:, PORT=CV1, ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(PORT), NAME=CV1, NCHANS=$(XSIZE)")

#VIDEOREC for video recording
NDCVConfigure("VIDEOREC", 16, 0, "$(PORT)", 0, 0, 0, 0, 0, $(MAX_THREADS=5))
dbLoadRecords("NDCV.template", "P=$(PREFIX), R=VIDEOREC:, PORT=VIDEOREC, ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(PORT), NAME=VIDEOREC, NCHANS=$(XSIZE)")

#CV2 for anything else
NDCVConfigure("CV2", 16, 0, "$(PORT)", 0, 0, 0, 0, 0, $(MAX_THREADS=5))
dbLoadRecords("NDCV.template", "P=$(PREFIX), R=CV2:, PORT=CV2, ADDR=0, TIMEOUT=1, NDARRAY_PORT=$(PORT), NAME=CV2, NCHANS=$(XSIZE)")
