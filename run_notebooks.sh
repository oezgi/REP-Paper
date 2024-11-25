#!/bin/bash
IMAGE_NAME="jupyter-notebook-image"

docker build -t $IMAGE_NAME .

if [ ! -f "notebooks/database.csv" ]; then
    echo "database.csv not found. Executing Data-Extraction.ipynb..."

    docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME \
        jupyter nbconvert --execute --to notebook --inplace Data-Extraction.ipynb

    if [ $? -ne 0 ]; then
        echo "Data-Extraction notebook failed, exiting."
        exit 1
    fi
else
    echo "database.csv found. Skipping Data-Extraction.ipynb."
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

echo "Workflow completed successfully!"
