all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make build            - build all images"
	@echo "   2. make pull             - pull all images"
	@echo "   3. make clean            - remove all images"
	@echo ""

build:
	@docker build --tag=carlowiesse/ros:humble          humble/.
	@docker build --tag=carlowiesse/ros:humble-opengl   humble-opengl/.
	@docker build --tag=carlowiesse/ros:kinetic         kinetic/.
	@docker build --tag=carlowiesse/ros:kinetic-opengl  kinetic-opengl/.

pull:
	@docker pull carlowiesse/ros:humble
	@docker pull carlowiesse/ros:humble-opengl
	@docker pull carlowiesse/ros:kinetic
	@docker pull carlowiesse/ros:kinetic-opengl

clean:
	@docker rmi -f carlowiesse/ros:humble
	@docker rmi -f carlowiesse/ros:humble-opengl
	@docker rmi -f carlowiesse/ros:kinetic
	@docker rmi -f carlowiesse/ros:kinetic-opengl
