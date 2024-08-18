# Docker Golang Challenge - Full Cycle Rocks

## Caso queira utilizar essa imagem, pode buscar ela da seguinte forma.
```bash
docker pull wagaodev/fullcycle-go:latest
```

Este repositório contém o código para gerar uma imagem Docker minimalista usando Go. O objetivo é criar uma imagem Docker com menos de 2MB que, ao ser executada, imprime "Full Cycle Rocks" no console.

## Requisitos

- [Golang](https://golang.org/doc/install) instalado
- [Docker](https://docs.docker.com/get-docker/) instalado

## Instruções

### 1. Clonar o Repositório

Clone este repositório em sua máquina local:

```bash
git clone <URL_DO_SEU_REPOSITORIO>
cd <NOME_DO_REPOSITORIO>
```

### 2. Compilar o Binário Go

Para compilar o binário Go, execute o seguinte comando:

```bash
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags="-s -w" -o main .
```

### 3. Construir a Imagem Docker

Com o binário Go compilado, você pode construir a imagem Docker com o seguinte comando:

```bash
docker build -t fullcycle-go .
```

### 4. Verificar o Tamanho da Imagem

Verifique o tamanho da imagem Docker para garantir que ela tem menos de 2MB:

```bash
docker images | grep fullcycle-go
```

### 5. Executar o Contêiner

Para rodar o contêiner e verificar se ele imprime "Full Cycle Rocks", execute:

```bash
docker run --rm fullcycle-go
```

Você deverá ver a seguinte saída:

```
Full Cycle Rocks
```

### 6. Limpar os Recursos

Após concluir o teste, você pode remover a imagem Docker para liberar espaço:

```bash
docker rmi fullcycle-go
```

## Notas

- O comando `go build` inclui as flags `-ldflags="-s -w"` para reduzir o tamanho do binário Go removendo informações de depuração.
- A imagem Docker é baseada em `scratch`, uma imagem vazia, para minimizar o tamanho final.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
