#!/bin/bash

SRC=de
TGT=hsb
DATA=dataset
TRAIN=train
TEST=test
VALID=valid
DEST=preprocessed

fairseq-preprocess \
  --source-lang ${SRC} \
  --target-lang ${TGT} \
  --trainpref ${DATA}/${TRAIN}.spm \
  --testpref ${DATA}/${TEST}.spm \
  --destdir ${DEST} \
  --thresholdtgt 0 \
  --thresholdsrc 0 \
  --task multilingual_denoising \
  --workers 70 \
  --joined-dictionary

mkdir -p $DEST/$SRC
mkdir -p $DEST/$TGT

mv $DEST/$TEST.$SRC-$TGT.$SRC.bin $DEST/$SRC/$VALID.bin
mv $DEST/$TRAIN.$SRC-$TGT.$SRC.bin $DEST/$SRC/$TRAIN.bin
mv $DEST/$TEST.$SRC-$TGT.$SRC.idx $DEST/$SRC/$VALID.idx
mv $DEST/$TRAIN.$SRC-$TGT.$SRC.idx $DEST/$SRC/$TRAIN.idx

mv $DEST/$TEST.$SRC-$TGT.$TGT.bin $DEST/$TGT/$VALID.bin
mv $DEST/$TRAIN.$SRC-$TGT.$TGT.bin $DEST/$TGT/$TRAIN.bin
mv $DEST/$TEST.$SRC-$TGT.$TGT.idx $DEST/$TGT/$VALID.idx
mv $DEST/$TRAIN.$SRC-$TGT.$TGT.idx $DEST/$TGT/$TRAIN.idx

mv $DEST/dict.$SRC.txt $DEST/dict.txt

