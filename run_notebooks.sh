#!/bin/bash
IMAGE_NAME="jupyter-notebook-image"

docker build -t $IMAGE_NAME .

echo "Executing all notebooks and generating HTML outputs..."
docker run --rm -v ./notebooks:/home/jovyan/work $IMAGE_NAME bash -c "
    jupyter nbconvert --execute --to notebook --inplace Data-Extraction.ipynb && \
    jupyter nbconvert --execute --to notebook --inplace Reproduce.ipynb && \
    jupyter nbconvert --to html Reproduce.ipynb && \
    jupyter nbconvert --execute --to notebook --inplace Replicate.ipynb && \
    jupyter nbconvert --to html Replicate.ipynb
"

if [ $? -ne 0 ]; then
    echo "Workflow execution failed, exiting."
    exit 1
fi

echo "Workflow completed successfully!"
