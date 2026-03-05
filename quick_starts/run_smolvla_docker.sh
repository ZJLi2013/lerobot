#!/bin/bash
# SmolVLA 训练测试 Docker 启动脚本
# 用法: bash quick_starts/run_smolvla_docker.sh
# 在远端节点的 ~/github/lerobot 目录下运行

docker run --rm --gpus all \
  -v ~/github/lerobot:/workspace/lerobot \
  -v ~/hf_cache:/root/.cache/huggingface \
  -w /workspace/lerobot \
  pytorch/pytorch:2.8.0-cuda12.6-cudnn9-devel \
  bash -c 'pip install -e ".[smolvla]" -q && pip uninstall torchcodec -y -q && python quick_starts/test_smolvla_so101.py'
