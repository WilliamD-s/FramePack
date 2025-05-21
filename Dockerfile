FROM python:3.10-slim

WORKDIR /app

RUN mkdir -p /app/hf_download /app/outputs

COPY . .

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install torchvision

EXPOSE 7860

CMD ["python", "demo_gradio.py", "--port=7880", "--server=0.0.0.0", "--share"]
