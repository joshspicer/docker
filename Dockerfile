FROM alpine
 
RUN apk update && apk add jq vim curl zsh git
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN echo "PROMPT='%F{red}[josh-docker] %1d $ %f'" >> ~/.zshrc
ENTRYPOINT ["/bin/zsh"]
