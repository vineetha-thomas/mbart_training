#!/bin/bash

CORPUS_PATH='corpus'
OUTPUT_PATH='dataset'
SRC='de'
DST='hsb'

python sample.py --corpus_path $CORPUS_PATH --output_path=$OUTPUT_PATH --src=$SRC --dst=$DST