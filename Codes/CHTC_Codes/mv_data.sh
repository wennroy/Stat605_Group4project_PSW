#!/bin/bash

mv mspectra* spec/
mv label_file* label/

tar -cvf spec.tar spec/
tar -cvf label.tar label/
