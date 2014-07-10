# css-server-docker

Imagem (experimental) para servidor de CS Source no Docker.

## Uso

Primeiro uso e atualizações futuras:

    docker run -it --name css_s css-server css update
    docker commit css_s myimage && docker rm css_s

Demais usos:

    docker run -d \
        -v /caminho/do/cfg:/cfg \
        -p 27015:27015 $( for p in {27000..27015} ; do echo "-p $p:$p/udp" ; done ) \
        myimage css start

## Licença

Nenhuma (domínio público).
