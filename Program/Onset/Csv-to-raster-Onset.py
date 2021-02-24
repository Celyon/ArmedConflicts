## author:DFY ##
## time: 20210224  ##
from osgeo import gdal
import numpy as np
import os 
import copy
import csv


referencetif = "E:\\Conflict\\Data\\NDVI-used.tif"
dataset = gdal.Open(referencetif)

im_width = dataset.RasterXSize
im_height = dataset.RasterYSize
im_bands = dataset.RasterCount

im_geotrans = dataset.GetGeoTransform()
im_proj = dataset.GetProjection()
im_band = dataset.GetRasterBand(1)
im_array = im_band.ReadAsArray()    

del dataset

filepath  = 'E:\\Conflict\\Tables\\Simulation-Onset\\'

files = os.listdir(filepath)

i = 1
for fi in files:
   fi_d = os.path.join(filepath,fi)  
   tempfilename = os.path.splitext(fi)[0]
   if os.path.isdir(fi_d):
     gci(fi_d)                  
   else:
     print os.path.join(filepath,fi_d)
     tempfile = os.path.join(filepath,fi_d)
     with open(tempfile,'r') as csvfile:
         reader = csv.reader(csvfile)
         data = [row for row in reader]
         nms = data[0][1:3]
         data = map(list,zip(*data[1:]))
         lat,lon,risk = data[0],data[1],data[2]
         
         initial_layer = {}
         nrow, ncol = im_height, im_width
         
         temparray = im_array
         z = 0
         for z in xrange(im_height):                        
               y = 0
               for y in xrange(im_width):
                  temparray[z,y] = -10    
         
            
         my_length = len(lat)
         
         x = 0
         for x in xrange(my_length):
            temp_i = int(lat[x])
            temp_j = int(lon[x])
            temparray[temp_i,temp_j] = risk[x]
             
         datatype = gdal.GDT_Float32      
         driver = gdal.GetDriverByName("GTiff")
         dataset = driver.Create('E:\\Conflict\\Product\\Step1\\'+tempfilename+'.tif',im_width,im_height,im_bands,datatype)
         dataset.SetGeoTransform(im_geotrans)
         dataset.SetProjection(im_proj)    
         dataset.GetRasterBand(1).SetNoDataValue(float(-10))
         dataset.GetRasterBand(1).WriteArray(temparray)    
         del dataset
         del reader
         del nms
         del data
         del lat 
         del lon 
         del risk
         i = i + 1