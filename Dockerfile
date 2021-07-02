FROM ubuntu
MAINTAINER hello@joshspicer.com

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y jq vim curl zsh git file socat tmux zip gnupg tmux
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
