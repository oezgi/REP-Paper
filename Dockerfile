FROM jupyter/base-notebook:latest

# Set the working directory
WORKDIR /home/jovyan/work

# Copy requirements
COPY requirements.txt .

# Switch back to the default user
USER jovyan

# Install Python dependencies
RUN pip install -r requirements.txt
