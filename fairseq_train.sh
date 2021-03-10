#!/bin/bash
PREPROCESSED_DATA=preprocessed
TRAIN_CHECKPOINTS_DIR=checkpoints
langs=de,hsb

fairseq-train $PREPROCESSED_DATA \
  --arch mbart_base \
  --criterion label_smoothed_cross_entropy --label-smoothing 0.2 \
  --optimizer adam --adam-eps 1e-06 --adam-betas '(0.9, 0.98)' \
  --lr-scheduler polynomial_decay --lr 3e-05 --warmup-updates 2500 --total-num-update 40000 \
  --dropout 0.3 --attention-dropout 0.1 --weight-decay 0.0 \
  --max-tokens 1024 --update-freq 2 \
  --save-interval 1 --save-interval-updates 5000 --keep-interval-updates 10 \
  --no-epoch-checkpoints \
  --save-dir $TRAIN_CHECKPOINTS_DIR \
  --seed 222 --log-format simple --log-interval 2 \
  --reset-optimizer --reset-meters --reset-dataloader --reset-lr-scheduler \
  --task multilingual_denoising \
  --replace-length 0

