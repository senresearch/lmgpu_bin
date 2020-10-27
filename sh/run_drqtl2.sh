#!/bin/bash

######################
# This file will run with data using Rqtl2 format 
######################


# Assuming you are in LMGPU directory

# Input in Rqtl2 format.
URL=./data/UTHSC_SPL_RMA_1210.zip

input_dir=./data/UTHSC_SPL_RMA_1210/
# Intermediate and final scan result will be stored here.
output_dir=./data/SPLEEN_CLEAN_DATA/
# Do genome scan with R/qtl2, default is False. Only True if we need to compare genome scan results produced by LMGPU.
scan="FALSE"

unzip -q $URL -d input_dir
# time Rscript --vanilla ./r/cleaning.R $URL $output_dir $scan

# If export_matrix set to true, then the entire LOD score matrix will be exported. If false, only maximum lod and related gmpa info will be exported.
export_matrix="false"
# genome scan results.
output_file="julia_result.csv"
# rqtl_file is needed to find gmap.csv.

time JULIA_NUM_THREADS=16 ./Compiled/bin/MyApp $output_dir $output_file $input_dir $export_matrix