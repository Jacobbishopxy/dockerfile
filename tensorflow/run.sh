# Run non-GPU container using
docker run -it -p 8888:8888 gcr.io/tensorflow/tensorflow

# For GPU support install NVidia drivers (ideally latest) and nvidia-docker. Run using
nvidia-docker run -it -p 8888:8888 gcr.io/tensorflow/tensorflow:latest-gpu
