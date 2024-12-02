#!/bin/bash
IMAGE_NAME="jupyter-notebook-image"

docker build -t $IMAGE_NAME .

echo "Executing Data-Extraction.ipynb..."
docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME \
    jupyter nbconvert --execute --to notebook --inplace Data-Extraction.ipynb

if [ $? -ne 0 ]; then
    echo "Data-Extraction notebook execution failed, exiting."
    exit 1
fi

echo "Executing Reproduce.ipynb..."
docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME \
    jupyter nbconvert --execute --to notebook --inplace Reproduce.ipynb

if [ $? -ne 0 ]; then
    echo "Reproduce notebook execution failed, exiting."
    exit 1
fi

echo "Converting Reproduce.ipynb to HTML..."
docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME \
    jupyter nbconvert --to html Reproduce.ipynb

if [ $? -ne 0 ]; then
    echo "HTML conversion failed, exiting."
    exit 1
fi

echo "Executing Replicate.ipynb..."
docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME \
    jupyter nbconvert --execute --to notebook --inplace Replicate.ipynb

if [ $? -ne 0 ]; then
    echo "Replicate notebook execution failed, exiting."
    exit 1
fi

echo "Converting Replicate.ipynb to HTML..."
docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME \
    jupyter nbconvert --to html Replicate.ipynb

if [ $? -ne 0 ]; then
    echo "HTML conversion failed, exiting."
    exit 1
fi

echo "Workflow completed successfully!"
