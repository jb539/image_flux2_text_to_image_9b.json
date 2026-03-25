# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui
# Could not resolve unknown_registry node MarkdownNote (no aux_id) - skipped
# Could not resolve unknown_registry node MarkdownNote (no aux_id) - skipped

# download models into comfyui
RUN comfy model download --url https://plex.bredereck.net/flux/flux-2-klein-9b-fp8.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b-fp8.safetensors
RUN comfy model download --url https://plex.bredereck.net/flux/flux-2-klein-base-9b-fp8.safetensors --relative-path models/diffusion_models --filename flux-2-klein-base-9b-fp8.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/vae-text-encorder-for-flux-klein-9b/resolve/main/split_files/text_encoders/qwen_3_8b_fp8mixed.safetensors --relative-path models/text_encoders --filename qwen_3_8b_fp8mixed.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
