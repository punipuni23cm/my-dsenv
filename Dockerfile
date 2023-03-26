FROM ubuntu:latest
RUN apt update && apt install -y graphviz libsm6 libxext6 libxrender-dev libglib2.0-0 sudo wget vim
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh && \
	sh Anaconda3-2022.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
	rm -f Anaconda3-2022.10-Linux-x86_64.sh

ENV PATH=/opt/anaconda3/bin:$PATH

RUN pip install --upgrade pip && \
	pip install --upgrade scikit-learn && \
	pip install opencv-python && \
	pip install nibabel && \
	pip install --upgrade plotly && \
	pip install chart_studio && \
	pip install jupyter-dash && \
	pip install --upgrade "ipywidgets>=7.6" && \
	pip install lightgbm && \
	pip install xgboost && \
	pip install graphviz && \
	pip install catboost && \
	pip install category_encoders && \
	pip install hyperopt && \
	pip install hpsklearn

WORKDIR /
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]