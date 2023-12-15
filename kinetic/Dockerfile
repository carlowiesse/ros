FROM ubuntu:xenial
 
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies for ROS installation
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    locales \
    lsb-release
RUN dpkg-reconfigure locales

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO kinetic

# Install ROS Kinetic
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update \
 && apt-get install -y --no-install-recommends ros-kinetic-desktop-full

# Install ROS tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    python-vcstool \
    python-rosdep \
    python-catkin-tools

# Set up rosdep
RUN rosdep init \
 && rosdep fix-permissions \
 && rosdep update --include-eol-distros

# Setup entrypoint
COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
