#!/bin/bash

SEED=0
ROOT_DIR=$(git rev-parse --show-toplevel)
DATA_DIR=${ROOT_DIR}/dataset/PDBbind-v2020
EXE_DIR=${ROOT_DIR}/src
EXPERIMENT_NAME=baseline/${SEED}

export CUDA_VISIBLE_DEVICES=$((0+${SEED}))

date
python -u ${EXE_DIR}/exe/train.py \
  experiment_name=${EXPERIMENT_NAME} \
  data=[messi/scoring] \
  data.scoring.root_data_dir=${DATA_DIR}/scoring \
  data.scoring.key_dir=${EXE_DIR}/keys/train/PDBbind_v2020/scoring \
  model=pignet_morse \
  model.short_range_A=2.1 \
  run.dropout_rate=0.1 \
  run.lr=4e-4 \
  run.batch_size=512 \
  run.save_every=1 \
  run.num_epochs=5000 \
  run.num_workers=12 \
  run.pin_memory=true \
  run.seed=${SEED}

date
