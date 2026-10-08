mkdir -p /workspace
cd /workspace

git clone -b qwen3-8B \
https://github.com/38500/RPO-RAG.git

cd /workspace/RPO-RAG

apt update
apt install axel

# 下载数据集
mkdir -p /workspace/datasets
axel -n 16 \
-o /workspace/datasets/Inference.zip \'https://takeout-download-drive.usercontent.google.com/download/Inference-20261003T095257Z-1-001.zip?j=b77af13c-2729-4dc1-a70e-0fb842383ff7&i=0&user=642852858797&authuser=0'
axel -n 16 \
-o /workspace/datasets/Stage1.zip \'https://takeout-download-drive.usercontent.google.com/download/Stage1-20261003T095257Z-1-001.zip?j=f4a52276-4037-4a7a-b3c2-0bba5615f5ff&i=0&user=642852858797&authuser=0'
axel -n 16 \
-o /workspace/datasets/Stage2.zip \'https://takeout-download-drive.usercontent.google.com/download/Stage2-20261003T095257Z-1-001.zip?j=d32f7125-2f2c-40d2-b361-49fc90bb6ed9&i=0&user=642852858797&authuser=0'
# 解压缩
unzip -q /workspace/datasets/Inference.zip \
-d /workspace/datasets/Inference
unzip -q /workspace/datasets/Stage1.zip \
-d /workspace/datasets/Stage1
unzip -q /workspace/datasets/Stage2.zip \
-d /workspace/datasets/Stage2
# 删除压缩包
rm /workspace/datasets/Inference.zip
rm /workspace/datasets/Stage1.zip
rm /workspace/datasets/Stage2.zip

# 下载模型
pip install -U huggingface_hub
mkdir -p /workspace/models
export HF_ENDPOINT=https://hf-mirror.com
hf download Qwen/Qwen3-8B \
  --local-dir /workspace/models/Qwen3-8B
  
#安装依赖
pip install -r train_RPO/requirements.txt
pip install -r predict_result/requirements.txt

# ===== Hugging Face 身份认证 =====
hf auth login 


# ===== 按需下载训练权重 =====

# Stage 1
# hf download Nixiaoyan/RPO-Qwen3-8B \
#   --include "Stage1/*" \
#   --local-dir /workspace/checkpoints

# Stage 2
# hf download Nixiaoyan/RPO-Qwen3-8B \
#   --include "Stage2/*" \
#   --local-dir /workspace/checkpoints