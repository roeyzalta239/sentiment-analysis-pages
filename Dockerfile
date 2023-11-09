# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the entire project directory into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install gunicorn
RUN pip install gunicorn

# Make port 8088 available to the world outside this container
EXPOSE 8088

# Run the app using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8088", "your_flask_app:app"]
