## build

```
docker build -t cc .
```

## run

```
docker run -it --rm -v "$(pwd)":/workspace -v cc-config:/root/.claude -v nix-cache:/nix --name cc cc
```

## enter

```
docker exec -it cc fish
```
