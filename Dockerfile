# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

#Insatll python dependencies
RUN pip install --no-cache-dir -r requirements.txt

#copy project files into the container
COPY . .

#Expose the port the app runs on
EXPOSE 5000

#Set the environment variable
ENV FLASK_APP=main.py
ENV FLASK_ENV=production

#Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]

