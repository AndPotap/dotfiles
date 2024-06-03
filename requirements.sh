python3 -m pip install --upgrade pip
# python3 -m pip install torch torchvision torchaudio --no-cache-dir
python3 -m pip install torch==2.2.1 torchvision==0.17.1 torchaudio==2.2.1 --no-cache-dir
python3 -m pip install pytest numpy pandas matplotlib pyarrow dataclasses-json psutil boto3 tensorboard lightning --no-cache-dir
python3 -m pip install docker --no-cache-dir
python3 -m pip install ~/gpustat/.
python3 -m pip install "python-lsp-server[all]" --no-cache-dir
python3 -m pip uninstall autopep8 -y
python3 -m pip install python-lsp-black --no-cache-dir
python3 -m pip install python-lsp-isort --no-cache-dir
