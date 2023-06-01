FROM python:3.10 

#Set Env Varibles
ENV PYTHONUNBUFFERED=1

#Create work dir inside Container
WORKDIR /app

# Install python3 and dependencies,pipenv,and django
RUN apt-get update && \
    apt-get install -y python3-pip build-essential libssl-dev libffi-dev python3-dev && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install django

# Copy the requirements.txt file to working dir
COPY requirements.txt /app

# Install application dependencies
RUN pip install -r /app/requirements.txt

# Copy files to working dir
COPY . /app

# Run migrations
RUN python /app/manage.py migrate

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
