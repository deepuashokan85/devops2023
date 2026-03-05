# 1. Start with an official lightweight Python image
FROM python:3.11-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy only the requirements file first to speed up builds
COPY requirements.txt .

# 4. Install the necessary Python packages
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of your application code
COPY . .

# 6. Tell Docker the app runs on port 5000
EXPOSE 5000

# 7. The command to start your Flask app
CMD ["python", "app.py"]

