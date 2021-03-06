#!/usr/bin/env bash
export NCCL_LL_THRESHOLD=0
ARCH=$1
GPUS=$2
OUT_PATH=$3
PORT=${PORT:-29500}
python -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT \
    --use_env main.py --model $ARCH --batch-size 8 --epochs 100 --data-path /datasets01/imagenet_full_size/061417 \
    --output_dir $OUT_PATH ${@:4}