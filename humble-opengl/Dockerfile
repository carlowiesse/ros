FROM nvidia/opengl:1.0-glvnd-runtime-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

# Graphics driver dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    software-properties-common \
    gpg-agent
RUN add-apt-repository ppa:kisak/kisak-mesa
RUN apt-get update \
 && apt-get install -y --no-install-recommends libqt5svg5

# Install dependencies for ROS installation
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    lsb-release \
    locales \
    dirmngr \
    gnupg2 
RUN dpkg-reconfigure locales

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO humble

# Install ROS Humble
RUN sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros2-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update \
 && apt-get install -y --no-install-recommends ros-humble-desktop
 
# Install ROS tools
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    python3-vcstool \
    python3-rosdep \
    python3-colcon-common-extensions \
    python3-colcon-mixin

# Set up rosdep
RUN rosdep init \
 && rosdep fix-permissions \
 && rosdep update

# Setup entrypoint
COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]