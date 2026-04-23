#!/bin/bash
set -e

# Deep Learning VM has Docker and NVIDIA drivers pre-installed.
# Just need to ensure docker is running and start the container.
systemctl start docker

# Run vLLM with the Gemma model
docker run -d \
  --gpus all \
  --restart unless-stopped \
  -p 8000:8000 \
  -e HUGGING_FACE_HUB_TOKEN="${hf_token}" \
  vllm/vllm-openai:latest \
  --model "${model_id}" \
  --dtype half \
  --max-model-len 4096
