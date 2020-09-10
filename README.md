Esse é um pequena template para  criação de um pacote .deb

Por Favor altere as informações do arquivo DEBIAN/control

para Copilar ele temos um script feito pelo Sirherobrine23 que pode copilalo via CI/CD do gitlab, um exemplo do .gitlab-ci.yml
```yml
 image: sirherobrine23/public-debian-packages-copiler:latest
 variables:
  SMB_URL: apt.sh23.org/apt-package
  USERSMB: matheus
  PASSSMB: google124

 Build:
  script: |
    init_23
  artifacts:
    paths:
    - deb-file/
```
