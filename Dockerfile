FROM google/cloud-sdk:410.0.0

WORKDIR /hate
COPY . /hate

RUN apt update -y && \
    apt-get update && \
    pip install --upgrade pip && \
    apt-get install ffmpeg libsm6 libxext6 -y 
 
RUN apt-get install apt-transport-https ca-certificates gnupg -y 
RUN apt-get install -y python3.10 -y

RUN pip install -r requirements.txt
RUN pip install -e .

CMD ["python3", "app.py"]
