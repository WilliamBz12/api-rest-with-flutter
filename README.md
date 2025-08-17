<p align="center">
  <a href="https://www.figma.com/design/HrwUyyHR6iM8WX1soNgI1q/Teste-Mobile">
    <img src="https://iili.io/dLYPf2a.png" alt="Logo" height=40>
  </a>
 <p align="center">
   UseDev - Sua loja Geek
    </p>
   <br>
    <p align="center">
      <img src="https://img.shields.io/badge/flutter-3.24.3-blue" />
      <img src="https://img.shields.io/badge/dart-%3E=3.4.4%20%3C4.0.0-blue" />
      <img src="https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fatrox%2Fsync-dotenv%2Fbadge" />
    </p>

## Índice

- [Índice](#índice)
- [Início](#início)
- [Build](#build)
- [Run](#Run)
- [Packages e Dependências](#packages-e-dependências)

## Início
Este projeto segue o Clean Architecture com TDD exemplificada pelo [Resocoder](https://resocoder.com/flutter-clean-architecture-tdd/), assim como o [Cubit](https://bloclibrary.dev/) para gestão de estado.

Demais dúvidas pode abrir uma issue ou consultar a [documentação oficial](https://flutter.io/docs/get-started/install).

## Build
Para gerar o build do projeto, você precisará configurar um projeto no Firebase, conforme essa [documentação](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android).
Após adicionar o projeto do Firebase, basta executar os comandos:
```bash
flutter pub get
flutter build apk
```

## Run
Para executar o projeto, você também irá precisar onfigurar um projeto no [Firebase](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android).
Com tudo devidamente configurado, você pode executar o projeto com o comando:

```bash
flutter pub get
flutter run
```
Enjoy!

## Packages e Dependências

Todos os packages e dependências estão no `pubspec.yaml`, mas listamos abaixo as principais com os links para poder consultar:

* [cubit](https://pub.dev/packages/bloc) Para gestão de estado,
* [flutter_bloc](https://pub.dev/packages/flutter_bloc) Integrar o bloc aos Widgets do Flutter,
* [sembast](https://pub.dev/packages/sembast) Banco de dados NoSQL usado no projeto,
* [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) Armazenamento criptografado para guardar o token JWT,
* [go_router](https://pub.dev/packages/go_router) Pacote que gerencia as rotas, tornando sua gestão mais fácil,
* [get_it](https://pub.dev/packages/get_it) Usado para injeção de dependência,
