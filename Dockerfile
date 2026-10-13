# Docker image for Dauletkan Nursultan (IT2-2313, 37037)
FROM python:3.12-alpine

# All following commands run inside /app
WORKDIR /app

# Copy application code and student info into the image
COPY app/app.py .
COPY Dauletkan_Nursultan_info.txt .

# Check the code compiles and create an unprivileged user
RUN python -m py_compile app.py && adduser -D appuser

USER appuser
EXPOSE 5000

CMD ["python", "-u", "app.py"]
