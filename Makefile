.PHONY:	all

IMAGES = $(shell find . -maxdepth 1 -type d | grep -Ev "^\.$$")

all:
	@for IMAGE in $(IMAGES); do BUILD_ONLY=1 $$IMAGE/enter; done
