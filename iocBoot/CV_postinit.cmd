dbpf $(PREFIX)CV1:CompVisionFunction1.PROC 1
dbpf $(PREFIX)VIDEOREC:CompVisionFunction3.PROC 1

#ARV1->CV1->Proc2->CODEC1->Pva1
#CV1: Median filter
dbpf $(PREFIX)CV1:NDArrayPort "ARV1"
dbpf $(PREFIX)CV1:CompVisionFunction1 "Median Filter"
dbpf $(PREFIX)CV1:CompVisionCamDepth "16 bit"
dbpf $(PREFIX)CV1:Input1 5
dbpf $(PREFIX)CV1:EnableCallbacks 1
dbpf $(PREFIX)CV1:ArrayCallbacks 1

#CODEC1: JPEG compression
dbpf $(PREFIX)Codec1:NDArrayPort "CV1"
dbpf $(PREFIX)Codec1:Mode "Compress"
dbpf $(PREFIX)Codec1:JPEGQuality 75
dbpf $(PREFIX)Codec1:EnableCallbacks 1
dbpf $(PREFIX)Codec1:ArrayCallbacks 1

#Pva1: PVAccess output
dbpf $(PREFIX)Pva1:NDArrayPort "CODEC1"
dbpf $(PREFIX)Pva1:EnableCallbacks 1
dbpf $(PREFIX)Pva1:ArrayCallbacks 1

#VIDEOREC: Record video
dbpf $(PREFIX)VIDEOREC:CompVisionFunction3 4
dbpf $(PREFIX)VIDEOREC:NDArrayPort "CV1"
dbpf $(PREFIX)VIDEOREC:EnableCallbacks 1
dbpf $(PREFIX)VIDEOREC:ArrayCallbacks 1
dbpf $(PREFIX)VIDEOREC:FilePath "/srv/data/ndwarp/videos"
#MP4 codec
dbpf $(PREFIX)VIDEOREC:Input3 3
#.mp4 suffix
dbpf $(PREFIX)VIDEOREC:Input4 1
