# Use an official Python runtime as a parent image
FROM debian:buster-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update -y && apt-get install python python-pip make -y
RUN pip install --trusted-host pypi.python.org -r requirements.txt
RUN make clean

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
ENV NAME python-repo-27-container

# Run app.py when the container launches
CMD ["make", "test"]