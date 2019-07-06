FROM alpine:latest

# Install core requirements for zsh
RUN apk update \
    && apk add git \
               curl \
               zsh \
               python \
               py-pip \
    && pip install --user powerline-status

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

CMD ["zsh"]

