FROM alpine
MAINTAINER hello@joshspicer.com

RUN apk update && apk add --no-cache jq vim curl zsh git file socat tmux openssh zip gpg
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/joshspicer/dotfiles.git ~/.dotfiles \
    && rm ~/.zshrc \
    && ln -s ~/.dotfiles/.zshrc ~/.zshrc \
    && ln -s ~/.dotfiles/.vimrc ~/.vimrc
RUN echo "PROMPT='%F{red}[js] %1d $ %f'" >> ~/.zshrc
ENTRYPOINT ["/bin/zsh"]
