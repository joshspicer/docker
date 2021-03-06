FROM alpine
MAINTAINER hello@joshspicer.com

RUN apk update && apk add --no-cache jq vim curl zsh git file socat tmux openssh zip gnupg tmux bind-tools
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/joshspicer/dotfiles.git ~/.dotfiles \
    && rm ~/.zshrc \
    && ln -s ~/.dotfiles/.common ~/.common \
    && ln -s ~/.dotfiles/.zshrc ~/.zshrc \
    && ln -s ~/.dotfiles/.vimrc ~/.vimrc
RUN echo "PROMPT='%F{red}[js] %1d $ %f'" >> ~/.zshrc
COPY scripts/* /scripts/
COPY well-known/* /well-known/
ENV PATH="/scripts:${PATH}"

ENTRYPOINT ["/bin/zsh"]
