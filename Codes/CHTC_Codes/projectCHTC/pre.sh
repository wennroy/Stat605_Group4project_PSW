#!/bin/bash

mkdir data
cd data
echo "It might take 5 hours to finish the download from my server. The server has internet speed restriction."
echo "The training process was eventually run in our own computer."

wget http://www.wennroy.com:8080/download/tar_files/{1..30}.tar

cd ..

# It downloaded the data from my server, and it takes 5 hours to finish.
