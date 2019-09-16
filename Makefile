.PHONY: build build_base run start_jupyter

build:
	docker build -f ./dockerfiles/optimized.Dockerfile -t optimization .

build_base:
	docker build -f ./dockerfiles/base.Dockerfile -t optimization .

build_tensorflow:
	docker build -f ./dockerfiles/tensorflow.Dockerfile -t optimization .

build_ubuntu:
	docker build -f ./dockerfiles/ubuntu.Dockerfile -t optimization .

run: build_tensorflow
	docker run \
	  --runtime "nvidia" \
	  -it --rm \
	  -p 8888:8888 -p 6666:6666 \
	  optimization

start_jupyter:
	jupyter lab \
	  --allow-root \
	  --ip=0.0.0.0 \
	  --NotebookApp.token=""
