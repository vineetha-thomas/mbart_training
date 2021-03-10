#!/bin/bash

SRC=de
DST=hsb
DATA=dataset
DICT=dataset/dict.txt
TRAIN=train
TEST=test

fairseq-preprocess \
  --source-lang ${SRC} \
  --target-lang ${TGT} \
  --trainpref ${DATA}/${TRAIN}.spm \
  --testpref ${DATA}/${TEST}.spm \
  --destdir ${DEST}/${NAME} \
  --thresholdtgt 0 \
  --thresholdsrc 0 \
  --srcdict ${DICT} \
  --tgtdict ${DICT} \
  --workers 70