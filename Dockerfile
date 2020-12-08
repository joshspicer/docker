FROM ubuntu:latest
 
RUN apt update && apt install -y jq vim curl zsh git
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN "PROMPT='%F{red}[josh-docker] %1d $ %f'" >> ~/.zshrc
ENTRYPOINT ["/bin/zsh"]
