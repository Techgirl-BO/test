FROM python:3.10 

#Set Env Varibles
ENV PYTHONUNBUFFERED=1

#Create work dir inside Container
WORKDIR /apps/corecode

# Copy files from current dir of host OS to Container workdir
COPY apps/corecode .

# Install python3 and dependencies,pipenv,and django
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev libpq-dev && \
    pip install --upgrade pip && \
    pip install pipenv && \
    pipenv install django

# Copy the requirements.txt file to the corecode folder
COPY requirements.txt .

 # Copy the manage.py file from the parent directory to the finance folder
COPY ../manage.py .

# Install application dependencies
RUN pip install -r /apps/corecode/requirements.txt

# Run migrations
RUN python manage.py migrate

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

#COPY entrypoint.sh /apps/corecode/entrypoint.sh    

# # Make it executable
# RUN chmod +x /apps/corecode/entrypoint.sh

# # runs the production server
# EXPOSE 8000
# ENTRYPOINT ["/apps/corecode/entrypoint.sh"] 
