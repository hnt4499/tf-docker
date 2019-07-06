# This dockerfile (and also all dockerfiles in `tf-docker/dockerfiles` repo) should
# be used to build image under the `tf-docker` (`context`) folder by issuing the
# following command in the `tf-docker` folder:
#
#   docker image build -t <your-image-tag> -f dockerfiles/ubuntu_zsh.Dockerfile .

FROM ubuntu:16.04

ARG home_dir=
ENV HOME=$home_dir

WORKDIR $HOME
# Install core requirements for `oh-my-zsh`
# The use of package `software-properties-common` is to 
# add package directory using `add-apt-repository`
RUN apt-get update \
    && apt-get -y --no-install-recommends \
    install git-core \
            curl \
            zsh \
            software-properties-common 

# Copy the entire `./oh-my-zsh` folder
COPY .oh-my-zsh /tmp/.oh-my-zsh
WORKDIR /tmp/.oh-my-zsh/tools

# Install `oh-my-zsh`
RUN sh install.sh

# Install and generate `locales` as well as fonts for `agnoster` theme
RUN apt-get -y --no-install-recommends \
    install locales \
            fonts-powerline \
    && locale-gen en_US.UTF-8

# Install vim 8.0 and SpaceVim, then install necessary packages
# for `make` and compile `vimproc`
RUN add-apt-repository ppa:jonathonf/vim \
    && apt-get update \
    && apt-get -y --no-install-recommends install vim \
    && curl -sLf https://spacevim.org/install.sh | bash \
    && sh vimproc.sh


WORKDIR /
# Clean up
RUN apt-get clean \
    && rm -r /tmp/.oh-my-zsh

# Set default command
CMD ["zsh"]

