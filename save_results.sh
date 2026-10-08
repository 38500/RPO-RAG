#!/usr/bin/env bash
set -e

# ===== 保存 RPO-RAG 实验结果到 B2 =====

# B2 连接配置由服务器环境变量提供
# 请勿将 Account ID 和 Application Key 写入本文件

# 上传实验结果
rclone copy -P \
  /workspace/RPO-output \
  myb2:nixiaoyan/RPO-Qwen3-8B/results