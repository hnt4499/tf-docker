FROM ubuntu:16.04

# Install core requirements for oh-my-zsh
# The package 'software-properties-common is to add package directory using add-apt-repository.
RUN apt-get update \
    && apt-get -y --no-install-recommends \
    install git-core \
            curl \
            zsh \
            software-properties-common 

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/hnt4499/oh-my-zsh/master/tools/install.sh)"

# Install and generate locales as well as fonts for "agnoster" theme.
RUN apt-get -y --no-install-recommends \
    install locales \
            fonts-powerline \
    && locale-gen en_US.UTF-8

# Install vim 8.0 and SpaceVim
RUN add-apt-repository ppa:jonathonf/vim \
    && apt-get update \
    && apt-get -y --no-install-recommends install vim \
    && curl -sLf https://spacevim.org/install.sh | bash

# Install necessary packages for "make" and compile vimproc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/hnt4499/oh-my-zsh/master/tools/vimproc.sh)"

CMD ["zsh"]

