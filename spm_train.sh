#!/bin/bash

INPUT_FILES=corpus/de/train.hsb-de.de,corpus/hsb/sorbian_institute_monolingual.hsb
MODEL_NAME=tokenizer/spm.model
VOCAB_SIZE=8000

spm_train --input=$INPUT_FILES --model_prefix=$MODEL_NAME --vocab_size=$VOCAB_SIZE