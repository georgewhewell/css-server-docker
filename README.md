# css-server-docker

Imagem (experimental) para servidor de Counter-Strike: Source no Docker.

## Uso

Primeiro uso e atualizações do servidor:

    docker run -i -t --name css_s flaudisio/css-server css update
    docker commit css_s myimage && docker rm css_s

Inicialização:

    docker run -d \
        -v /caminho/do/cfg:/cfg \
        -p 27015:27015 $( for p in {27000..27015} ; do echo "-p $p:$p/udp" ; done ) \
        myimage css start

## Licença

Nenhuma (domínio público).
