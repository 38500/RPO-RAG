HF_REPO="Nixiaoyan/RPO-Qwen3-8B"

# Stage 1：上传权重
# hf upload "$HF_REPO" <Stage1实际权重目录> Stage1 --repo-type model

# Stage 2：上传权重
# hf upload "$HF_REPO" <Stage2实际权重目录> Stage2 --repo-type model

hf upload 用户名/模型仓库 本地文件夹 仓库中的文件夹 --repo-type model

