# Python official image using as Base Image
FROM python:3.9-slim-buster 
# Setting the working Dir
WORKDIR /app
# Copying the requirements.txt file
COPY requirements.txt .
# Installing the dependencies
RUN pip3 install --no-cache-dir -r requirements.txt
# Copying the App Code
COPY . .
# Setting the Env Variable for file
ENV FLASK_RUN_HOST=0.0.0.0
# Exposing the application on port 5000
EXPOSE 5000
# Running the Application
CMD ["flask", "run"]