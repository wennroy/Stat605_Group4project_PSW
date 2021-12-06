#!/bin/bash

mkdir output
mkdir err
mkdir log
echo "Downloading the data might take 5 hours and longer since the data are stored in my personal server. It has internet speed restriction."
condor_submit_dag birdsong_analysis.dag
