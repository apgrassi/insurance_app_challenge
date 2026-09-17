# Insurance App Challenge

Aplicação desenvolvida em Flutter como parte de um desafio técnico para uma vaga de Flutter Developer.

O projeto simula um aplicativo de seguros, permitindo autenticação do usuário, visualização de opções de seguros e acesso à cotação de seguro automóvel através de uma WebView.

## Tecnologias utilizadas

- Flutter
- Dart
- Firebase Authentication
- Provider
- Flutter InAppWebView
- FVM (Flutter Version Management)

## Plataformas

O projeto foi desenvolvido para funcionar em:

- Android
- Web

## Versão do Flutter

Este projeto utiliza FVM para manter a versão do Flutter isolada do ambiente global.

Flutter utilizado no projeto:

```text
Flutter 3.47.4
Dart 3.13.3
```


## Funcionalidades

- Login utilizando CPF e senha
- Cadastro de usuário
- Autenticação com Firebase Authentication
- Exibição do nome do usuário autenticado
- Gerenciamento do estado de autenticação com Provider
- Tela inicial com opções de seguros
- Menu lateral com as principais áreas do aplicativo
- Cotação de seguro automóvel através de WebView
- Layout responsivo para Android e Web
- Deploy da versão Web com Firebase Hosting

## Testes

O projeto possui testes automatizados para validar comportamentos da aplicação:

- Teste unitário do estado inicial do `AuthProvider`
- Widget test do componente `InsuranceOption`

Para executar os testes:

```bash
fvm flutter test
```

## Deploy

A versão Web da aplicação está publicada utilizando Firebase Hosting.

**Aplicação Web:**  
https://insurance-app-challenge.web.app


## Autenticação

O Firebase Authentication utiliza e-mail e senha para autenticação.

Como o desafio solicita autenticação através de CPF, o CPF informado pelo usuário é normalizado e convertido internamente em um e-mail utilizado apenas para comunicação com o Firebase.

Exemplo:

```text
CPF informado: 123.456.789-00
CPF normalizado: 12345678900
E-mail interno: 12345678900@insurance.app
```

Dessa forma, a interface continua utilizando CPF e senha, enquanto a autenticação é realizada pelo Firebase.

## Estrutura do projeto

O projeto foi organizado por módulos, separando as responsabilidades da aplicação.

```text
lib/
├── core/
│   └── theme/
├── modules/
│   ├── auth/
│   │   ├── data/
│   │   │   └── service/
│   │   └── presentation/
│   │       ├── pages/
│   │       └── providers/
│   └── home/
│       └── presentation/
│           ├── pages/
│           └── widgets/
├── app.dart
├── firebase_options.dart
└── main.dart
```

## Como executar

Clone o repositório e acesse a pasta do projeto.

Instale as dependências:

```bash
fvm flutter pub get
```

Execute no Android:

```bash
fvm flutter run
```

Para executar no navegador:

```bash
fvm flutter run -d chrome
```

## Decisões técnicas

- **Provider:** utilizado para gerenciamento do estado do usuário autenticado.
- **Firebase Authentication:** responsável pela autenticação e cadastro.
- **FVM:** utilizado para manter a versão do Flutter específica do projeto sem alterar a instalação global.
- **Flutter InAppWebView:** utilizado para exibir a página de cotação do seguro automóvel.
- **Componentização:** elementos da interface foram separados em widgets reutilizáveis para facilitar manutenção e organização.
- **Responsividade:** o layout utiliza constraints e componentes flexíveis para se adaptar às versões mobile e web.