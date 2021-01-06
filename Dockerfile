FROM alpine
MAINTAINER hello@joshspicer.com

RUN apk update && apk add --no-cache jq vim curl zsh git file socat tmux openssh
RUN git clone https://github.com/joshspicer/dotfiles.git ~/.dotfiles \
    && ln -s ~/.dotfiles/.zshrc ~/.zshrc \
    && ln -s ~/.dotfiles/.vimrc ~/.vimrc
RUN echo "PROMPT='%F{red}[js] %1d $ %f'" >> ~/.zshrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ENTRYPOINT ["/bin/zsh"]
