IMAGE_NAME = ocf-nodejs-image

# These values are changed in each version branch
# This is the only place they need to be changed
# other than the README.md file.
include versions.mk

TARGET=$(IMAGE_NAME):$(IMAGE_TAG)

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test: build
	BUILDER=$(TARGET) NODE_VERSION=$(NODE_VERSION) ./test/run.sh
