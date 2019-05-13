# 🐳 SonarQube Scanner CLI

> SonarQube Scanner Docker image

## Build

```bash
docker build . -t magnobiet/sonar-scanner:latest
```

## Run

### SonarQube server

```bash
docker run -d --name sonarqube -p 9000:9000 sonarqube
```

### SonarQube Scanner

```bash
docker run --rm --mount type=bind,source="$(pwd)",target=/project-root --workdir /project-root magnobiet/sonar-scanner:latest sonar-scanner
```

## Setup

### `.bash_functions`

```bash
function __sonar_scanner() {

  docker run --rm \
    --mount type=bind,source="$(pwd)",target=/project-root \
    --workdir /project-root \
    magnobiet/sonar-scanner:latest \
    sonar-scanner

}
```

### `.bash_aliases`

```bash
alias sonar-scanner='__sonar_scanner'
```

## License

This project is licensed under the [MIT License](https://magno.mit-license.org/2019). Copyright © Magno Biét
