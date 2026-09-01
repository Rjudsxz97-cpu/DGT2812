# ✈️ TORDSILHAS / Explore Mundo

[![Flutter](https://img.shields.io/badge/Flutter-3.44.2-02569B?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev/)
[![Disciplina](https://img.shields.io/badge/Estácio-DGT2812-blue)](https://estacio.br/)

Aplicativo mobile desenvolvido em **Flutter** para a disciplina **DGT2812 - Desenvolvimento de Aplicativos Móveis com Flutter** (Universidade Estácio de Sá). O **Tordsilhas** é uma plataforma focada no turismo do Nordeste brasileiro, permitindo explorar destinos turísticos, consultar pacotes de viagens e simular reservas.

---

## 📌 Informações Acadêmicas

- **Estudante:** Judson Felipe da Silva
- **Disciplina:** DGT2812 - Desenvolvimento de Aplicativos Móveis com Flutter
- **Turma / Código:** DGT2812/9001
- **Tutora:** Simone Gama
- **Modalidade:** Disciplina Digital (EaD)

---

## 📱 Funcionalidades do Aplicativo

- **Tela Inicial:** Apresentação da marca em layout degradê e botão de acesso rápido para exploração.
- **Seleção de Cidades:** Listagem de capitais do Nordeste (Fortaleza, Natal, João Pessoa) com indicação de pontos e pacotes.
- **Pontos Turísticos & Galeria:** Detalhamento de atrações com notas de avaliação e contador de fotos em *Stack*.
- **Carrossel Interativo de Pacotes:** Transição automática de fotos de hotéis (3s) com opção de navegação manual.
- **Resumo da Reserva:** Painel com detalhamento financeiro, voos, check-in/out e opções de passeios.
- **Integração Externa:** Abertura de rotas direto no **Google Maps** e atendimento imediato via **WhatsApp**.

---

## 🛠️ Tecnologias e Pacotes

- **[Flutter SDK](https://flutter.dev/):** Framework para desenvolvimento multiplataforma (Channel stable 3.44.2).
- **[Dart](https://dart.dev/):** Linguagem de programação principal.
- **`url_launcher`:** Para integração com Google Maps e chamadas do WhatsApp.
- **`cupertino_icons`:** Pacote de ícones.
- **Material Design 3:** Padrão de interface moderna e responsiva.

---

## 📂 Estrutura de Arquivos

```text
DGT2812/
├── assets/
│   └── images/          # Mídias locais organizadas por regiões, atrações e hotéis
├── lib/
│   └── main.dart        # Código-fonte completo (Modelos, UI, Navegação e APIs)
├── pubspec.yaml         # Configuração de dependências e assets
└── README.md            # Documentação do repositório

Passo a passo no Terminal

1. Clone este repositório:

git clone [https://github.com/Rjudsxz97-cpu/DGT2812.git](https://github.com/Rjudsxz97-cpu/DGT2812.git)

2.Acesse a pasta do projeto:

cd DGT2812

3.Instale as dependências:


flutter pub get

4.Execute o aplicativo:

flutter run
