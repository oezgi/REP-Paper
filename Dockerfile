FROM jupyter/base-notebook:python-3.9

# Set the working directory
WORKDIR /home/jovyan/work

# Copy requirements
COPY requirements.txt .

# Switch back to the default user
USER jovyan

# Install Python dependencies
RUN pip install -r requirements.txt
