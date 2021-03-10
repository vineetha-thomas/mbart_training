#!/bin/bash

SRC=de
TGT=hsb
DATA=dataset
DICT=dataset/dict.txt
TRAIN=train
TEST=test
DEST=preprocessed

fairseq-preprocess \
  --source-lang ${SRC} \
  --target-lang ${TGT} \
  --trainpref ${DATA}/${TRAIN}.spm \
  --testpref ${DATA}/${TEST}.spm \
  --destdir ${DEST} \
  --thresholdtgt 0 \
  --thresholdsrc 0 \
  --srcdict ${DICT} \
  --tgtdict ${DICT} \
  --task multilingual_denoising \
  --workers 70
