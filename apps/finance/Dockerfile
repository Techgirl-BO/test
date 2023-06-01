FROM python:3.10 

#Set Env Varibles
ENV PYTHONUNBUFFERED=1

#Create work dir inside Container
WORKDIR /apps/finance

# Copy files from current dir of host OS to Container workdir
COPY apps/finance/ .

# Install python3 and dependencies,pipenv,and django
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev libpq-dev && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install django

# Copy the requirements.txt file to the finance folder
COPY requirements.txt .  

# Copy the manage.py file from the parent directory to the finance folder
COPY ../manage.py .

# Install application dependencies
RUN pip install -r /apps/finance/requirements.txt

# Run migrations
RUN python manage.py migrate 

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

#COPY entrypoint.sh /apps/finance/entrypoint.sh

# # Make it executable
# RUN chmod +x /apps/finance/entrypoint.sh

# # runs the production server
# EXPOSE 8000
# ENTRYPOINT ["/apps/finance/entrypoint.sh"] 
