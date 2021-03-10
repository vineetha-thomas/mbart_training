#!/bin/bash

PREPROCESSED_FILES='test.spm.de train.spm.de test.spm.hsb train.spm.hsb'
DICT='dataset/dict.txt'

python token_counter.py $DICT $PREPROCESSED_FILES 