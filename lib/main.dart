import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const TordsilhasApp());
}

// ============================================================
// MODELOS DE DADOS
// ============================================================

class EstadoCapital {
  final String id;
  final String capital;
  final String estado;
  final String uf;
  final List<Destino> destinos;
  final List<PacoteViagem> pacotes;

  const EstadoCapital({
    required this.id,
    required this.capital,
    required this.estado,
    required this.uf,
    required this.destinos,
    required this.pacotes,
  });
}

class Destino {
  final String id;
  final String nome;
  final String localizacao;
  final List<String> fotosGaleria;
  final String descricao;
  final double nota;
  final int totalAvaliacoes;

  const Destino({
    required this.id,
    required this.nome,
    required this.localizacao,
    required this.fotosGaleria,
    required this.descricao,
    required this.nota,
    required this.totalAvaliacoes,
  });

  String get fotoCapa => fotosGaleria.isNotEmpty ? fotosGaleria.first : '';
}

class PacoteViagem {
  final String hotel;
  final String endereco;
  final int dias;
  final int noites;
  final String origem;
  final double precoPorPessoa;
  final double taxasEImpostos;
  final String servicos;
  final List<String> fotos;
  final String sobreHospedagem;
  final int estrelas;

  const PacoteViagem({
    required this.hotel,
    required this.endereco,
    required this.dias,
    required this.noites,
    required this.origem,
    required this.precoPorPessoa,
    this.taxasEImpostos = 261.0,
    required this.servicos,
    required this.fotos,
    required this.sobreHospedagem,
    this.estrelas = 3,
  });

  String get fotoCapa => fotos.isNotEmpty ? fotos.first : '';
}

// ============================================================
// BANCO DE DADOS
// ============================================================

final List<EstadoCapital> capitaisNordeste = [
  EstadoCapital(
    id: 'fortaleza_ce',
    capital: 'Fortaleza',
    estado: 'Ceará',
    uf: 'CE',
    pacotes: [
      PacoteViagem(
        hotel: 'Beira Mar Hotel Fortaleza',
        endereco: 'Av. Beira Mar, 3130 - Meireles',
        dias: 5,
        noites: 4,
        origem: 'Saindo de São Paulo',
        precoPorPessoa: 1850.0,
        taxasEImpostos: 280.0,
        servicos: 'Café da Manhã • Vista para o Mar',
        fotos: [
          'images/nordeste/fortaleza/praia_de_iracema.jpg',
        ],
        sobreHospedagem: 'Localizado no coração da Beira Mar de Fortaleza.',
        estrelas: 4,
      ),
    ],
    destinos: [
      Destino(
        id: 'fort_1',
        nome: 'Praia de Iracema',
        localizacao: 'Fortaleza, Ceará',
        fotosGaleria: [
          'images/nordeste/fortaleza/praia_de_iracema.jpg',
        ],
        descricao:
            'Uma das praias mais famosas da capital cearense, ideal para caminhadas no calçadão, apreciar o pôr do sol na Ponte dos Ingleses e curtir a vida noturna cultural.',
        nota: 4.8,
        totalAvaliacoes: 110,
      ),
      Destino(
        id: 'fort_2',
        nome: 'Praia do Futuro',
        localizacao: 'Fortaleza, Ceará',
        fotosGaleria: [
          'images/nordeste/fortaleza/praia_do_futuro.jpg',
        ],
        descricao:
            'Famosa por suas mega barracas de praia com infraestrutura completa, piscinas, shows ao vivo e o melhor da gastronomia cearense com muito caranguejo.',
        nota: 4.9,
        totalAvaliacoes: 145,
      ),
    ],
  ),
  EstadoCapital(
    id: 'natal_rn',
    capital: 'Natal',
    estado: 'Rio Grande do Norte',
    uf: 'RN',
    pacotes: [
      PacoteViagem(
        hotel: 'Brisa do Mar Beach Hotel – GR',
        endereco: 'AVENIDA PRESIDENTE CAFÉ FILHO, 786',
        dias: 5,
        noites: 4,
        origem: 'Saindo de São Paulo',
        precoPorPessoa: 1564.0,
        taxasEImpostos: 261.0,
        servicos: 'Café da Manhã • Aceita Pets (até 7kg)',
        estrelas: 3,
        fotos: [
          'images/nordeste/natal/pacotes/brisa_do_mar/brisa_0.jpg',
          'images/nordeste/natal/pacotes/brisa_do_mar/brisa_1.jpg',
          'images/nordeste/natal/pacotes/brisa_do_mar/brisa_2.jpg',
          'images/nordeste/natal/pacotes/brisa_do_mar/brisa_3.jpg',
        ],
        sobreHospedagem:
            'Localizado de Frente para o Mar, na Praia dos Artistas, a 600 m do Centro de Artesanato, piscina na sua cobertura com vista panorâmica. O café da manhã incluso na diária. Os 28 apartamentos tem banheiros privativos, TV, ar condicionado, frigobar e telefone. Wi-fi é gratuito em todo hotel. Hotel aceita pet até 7kg, com taxa paga diretamente ao hotel.',
      ),
      PacoteViagem(
        hotel: 'La Belle Beach Hotel',
        endereco: 'AVENIDA PRESIDENTE CAFÉ FILHO, 1176',
        dias: 5,
        noites: 4,
        origem: 'Saindo de São Paulo',
        precoPorPessoa: 1746.0,
        taxasEImpostos: 250.0,
        servicos: 'Café da Manhã • Estacionamento • Recepção 24h',
        estrelas: 3,
        fotos: [
          'images/nordeste/natal/pacotes/la_belle/belle_0.jpg',
          'images/nordeste/natal/pacotes/la_belle/belle_1.jpg',
          'images/nordeste/natal/pacotes/la_belle/belle_2.jpg',
          'images/nordeste/natal/pacotes/la_belle/belle_3.jpg',
        ],
        sobreHospedagem:
            'Hotel à beira-mar com estrutura confortável e vista privilegiada para o Oceano Atlântico. Conta com piscina na cobertura, Wi-Fi gratuito e ambiente familiar acolhedor próximo aos principais pontos culturais.',
      ),
      PacoteViagem(
        hotel: 'Valencia Hotel Natal',
        endereco: 'RUA RENATO GUILHERME KAISER, 70',
        dias: 5,
        noites: 4,
        origem: 'Saindo de São Paulo',
        precoPorPessoa: 1729.0,
        taxasEImpostos: 240.0,
        servicos: 'Café da Manhã • Área Verde e Piscina',
        estrelas: 3,
        fotos: [
          'images/nordeste/natal/pacotes/valencia/valencia_0.jpg',
          'images/nordeste/natal/pacotes/valencia/valencia_1.jpg',
          'images/nordeste/natal/pacotes/valencia/valencia_2.jpg',
          'images/nordeste/natal/pacotes/valencia/valencia_3.jpg',
        ],
        sobreHospedagem:
            'Localizado estrategicamente no bairro de Ponta Negra, oferece suítes aconchegantes, restaurante climatizado com café da manhã variado e piscina ao ar livre cercada por área verde.',
      ),
    ],
    destinos: [
      Destino(
        id: 'nat_1',
        nome: 'Praia de Genipabu',
        localizacao: 'Extremoz, Rio Grande do Norte',
        fotosGaleria: [
          'images/nordeste/natal/genipabu/genipabu_1.jpg',
          'images/nordeste/natal/genipabu/genipabu_2.jpg',
          'images/nordeste/natal/genipabu/genipabu_3.jpg',
          'images/nordeste/natal/genipabu/genipabu_4.jpg',
        ],
        descricao:
            'Famosa no mundo inteiro por suas majestosas dunas móveis, passeios radicais de buggy ("com ou sem emoção"), lagoas cristalinas e os tradicionais dromedários.',
        nota: 4.9,
        totalAvaliacoes: 180,
      ),
      Destino(
        id: 'nat_2',
        nome: 'Praia do Amor',
        localizacao: 'Tibau do Sul / Pipa, RN',
        fotosGaleria: [
          'images/nordeste/natal/praia_do_amor/praia_do_amor_1.jpg',
          'images/nordeste/natal/praia_do_amor/praia_do_amor_2.jpg',
          'images/nordeste/natal/praia_do_amor/praia_do_amor_3.jpg',
          'images/nordeste/natal/praia_do_amor/praia_do_amor_4.jpg',
        ],
        descricao:
            'Conhecida por suas falésias avermelhadas em formato de coração e mar propício para o surf, sendo um dos pontos imperdíveis da região de Pipa.',
        nota: 4.9,
        totalAvaliacoes: 210,
      ),
      Destino(
        id: 'nat_3',
        nome: 'Praia de Ponta Negra',
        localizacao: 'Natal, Rio Grande do Norte',
        fotosGaleria: [
          'images/nordeste/natal/praia_ponta_negra/praia_ponta_negra_1.jpg',
          'images/nordeste/natal/praia_ponta_negra/praia_ponta_negra_2.jpg',
          'images/nordeste/natal/praia_ponta_negra/praia_ponta_negra_3.jpg',
          'images/nordeste/natal/praia_ponta_negra/praia_ponta_negra_4.jpg',
        ],
        descricao:
            'A praia urbana mais famosa de Natal, onde fica localizado o cartão-postal Morro do Careca, rodeada por excelentes restaurantes e hotéis.',
        nota: 4.8,
        totalAvaliacoes: 320,
      ),
    ],
  ),
  EstadoCapital(
    id: 'joao_pessoa_pb',
    capital: 'João Pessoa (Paraíba)',
    estado: 'Paraíba',
    uf: 'PB',
    pacotes: [
      PacoteViagem(
        hotel: 'Pousada Coqueirinho Beach',
        endereco: 'Praia de Coqueirinho, Conde',
        dias: 4,
        noites: 3,
        origem: 'Saindo de São Paulo',
        precoPorPessoa: 1590.0,
        taxasEImpostos: 210.0,
        servicos: 'Café da Manhã • Pé na Areia',
        fotos: [
          'images/nordeste/paraiba/praia_coqueirinho/praia_coqueirinho.jpg',
        ],
        sobreHospedagem: 'Pousada pé na areia na praia mais famosa de Conde.',
        estrelas: 4,
      ),
    ],
    destinos: [
      Destino(
        id: 'pb_1',
        nome: 'Praia de Coqueirinho',
        localizacao: 'Conde, Paraíba',
        fotosGaleria: [
          'images/nordeste/paraiba/praia_coqueirinho/praia_coqueirinho.jpg',
        ],
        descricao:
            'Considerada uma das praias mais bonitas do Brasil, cercada por coqueirais, falésias coloridas e águas calmas ideais para banho.',
        nota: 5.0,
        totalAvaliacoes: 95,
      ),
    ],
  ),
];

// ============================================================
// APP
// ============================================================

class TordsilhasApp extends StatelessWidget {
  const TordsilhasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TORDSILHAS - Agência de Viagens',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}

// ============================================================
// 1. TELA INICIAL
// ============================================================

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Colors.teal.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.explore,
                size: 90,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'TORDSILHAS',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              const Text(
                'Agência de Viagens & Experiências',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  backgroundColor: Colors.amber[700],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.travel_explore),
                label: const Text(
                  'EXPLORAR DESTINOS NORDESTE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TelaCapitais(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 2. SELEÇÃO DE CAPITAL
// ============================================================

class TelaCapitais extends StatelessWidget {
  const TelaCapitais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinos do Nordeste'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Para onde você quer viajar?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Escolha uma opção abaixo para ver fotos e pacotes.',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: capitaisNordeste.length,
                itemBuilder: (context, index) {
                  final capital = capitaisNordeste[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 14),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.teal,
                        child: Text(
                          capital.uf,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        capital.capital,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${capital.destinos.length} pontos turísticos • '
                        '${capital.pacotes.length} pacotes',
                        style: TextStyle(
                          color: Colors.teal[700],
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.teal,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TelaPontosTuristicos(
                              capital: capital,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 3. PONTOS TURÍSTICOS
// ============================================================

class TelaPontosTuristicos extends StatelessWidget {
  final EstadoCapital capital;

  const TelaPontosTuristicos({
    super.key,
    required this.capital,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontos Turísticos - ${capital.capital}'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.amber[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Colors.amber.shade600,
                width: 1.5,
              ),
            ),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TelaPacotes(
                      capital: capital,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.card_travel,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'PACOTES DE VIAGEM',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Confira voos + hospedagem em ${capital.capital}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pontos Turísticos em Destaque',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...capital.destinos.map(
            (destino) => _CardDestino(destino: destino),
          ),
        ],
      ),
    );
  }
}

class _CardDestino extends StatelessWidget {
  final Destino destino;

  const _CardDestino({
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TelaDetalhesDestino(
                destino: destino,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _AssetImage(
                  path: destino.fotoCapa,
                  height: 220,
                  width: double.infinity,
                  icon: Icons.landscape,
                ),
                if (destino.fotosGaleria.isNotEmpty)
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.photo_library,
                            size: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${destino.fotosGaleria.length} fotos',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destino.nome,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          destino.localizacao,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        destino.nota.toStringAsFixed(1),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// 4. PACOTES
// ============================================================

class TelaPacotes extends StatelessWidget {
  final EstadoCapital capital;

  const TelaPacotes({
    super.key,
    required this.capital,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacotes - ${capital.capital}'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: capital.pacotes.isEmpty
          ? const Center(
              child: Text('Nenhum pacote disponível.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: capital.pacotes.length,
              itemBuilder: (context, index) {
                return ItemCardPacote(
                  pacote: capital.pacotes[index],
                );
              },
            ),
    );
  }
}

class ItemCardPacote extends StatefulWidget {
  final PacoteViagem pacote;

  const ItemCardPacote({
    super.key,
    required this.pacote,
  });

  @override
  State<ItemCardPacote> createState() => _ItemCardPacoteState();
}

class _ItemCardPacoteState extends State<ItemCardPacote> {
  int _fotoIndex = 0;
  Timer? _timerAutoSlide;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    if (widget.pacote.fotos.length > 1) {
      _timerAutoSlide = Timer.periodic(
        const Duration(seconds: 3),
        (_) {
          if (!_pageController.hasClients || !mounted) {
            return;
          }

          final proximaFoto = (_fotoIndex + 1) % widget.pacote.fotos.length;

          _pageController.animateToPage(
            proximaFoto,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _timerAutoSlide?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _abrirModalDetalhesHotel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (_) => ModalDetalhesHotel(
        pacote: widget.pacote,
      ),
    );
  }

  void _mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fotos = widget.pacote.fotos;

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: fotos.isEmpty
                ? _AssetImage(
                    path: '',
                    height: 200,
                    width: double.infinity,
                    icon: Icons.hotel,
                  )
                : Stack(
                    children: [
                      if (fotos.length > 1)
                        PageView.builder(
                          controller: _pageController,
                          itemCount: fotos.length,
                          onPageChanged: (index) {
                            if (mounted) {
                              setState(() {
                                _fotoIndex = index;
                              });
                            }
                          },
                          itemBuilder: (_, index) {
                            return _AssetImage(
                              path: fotos[index],
                              height: 200,
                              width: double.infinity,
                              icon: Icons.hotel,
                            );
                          },
                        )
                      else
                        _AssetImage(
                          path: fotos.first,
                          height: 200,
                          width: double.infinity,
                          icon: Icons.hotel,
                        ),
                      if (fotos.length > 1) ...[
                        Positioned(
                          left: 8,
                          top: 70,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.35),
                            ),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 70,
                          child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.35),
                            ),
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              fotos.length,
                              (idx) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3,
                                ),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _fotoIndex == idx
                                      ? Colors.amber
                                      : Colors.white60,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.pacote.hotel,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: List.generate(
                        widget.pacote.estrelas,
                        (_) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.pacote.endereco,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.indigo,
                        side: const BorderSide(
                          color: Colors.indigo,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () => _abrirModalDetalhesHotel(context),
                      child: const Text('Detalhes do hotel'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.indigo,
                        side: const BorderSide(
                          color: Colors.indigo,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        _mostrarMensagem(
                          'Seleção de quarto disponível em breve.',
                        );
                      },
                      child: const Text('Alterar quarto'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.pacote.servicos,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Divider(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Valor do pacote por viajante',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'R\$ ${widget.pacote.precoPorPessoa.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            'Em até 10x sem juros',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0000B3),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TelaResumoPacote(
                              pacote: widget.pacote,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'SELECIONAR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGET DE IMAGEM SEGURO
// ============================================================

class _AssetImage extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final IconData icon;

  const _AssetImage({
    required this.path,
    this.height,
    this.width,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return _placeholder();
    }

    return Image.asset(
      path,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300],
      child: Center(
        child: Icon(
          icon,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// ============================================================
// 5. RESUMO DO PACOTE
// ============================================================

class TelaResumoPacote extends StatelessWidget {
  final PacoteViagem pacote;

  const TelaResumoPacote({
    super.key,
    required this.pacote,
  });

  @override
  Widget build(BuildContext context) {
    final double valorTotalParaDois =
        (pacote.precoPorPessoa * 2) + (pacote.taxasEImpostos * 2);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: Text(
          '${pacote.hotel} – ${pacote.dias} dias / ${pacote.noites} noites',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildCardHospedagem(context),
            const SizedBox(height: 16),
            _buildCardVoo(context),
            const SizedBox(height: 16),
            _buildCardServicos(context),
            const SizedBox(height: 16),
            _buildCardResumoPreco(
              context,
              valorTotalParaDois,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHospedagem(BuildContext context) {
    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TituloSecao(
            titulo: 'Hospedagem',
          ),
          const SizedBox(height: 12),
          Text(
            pacote.hotel,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              pacote.estrelas,
              (_) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const _InfoLinha(
            icon: Icons.calendar_today_outlined,
            texto: '4 noites | 09/11/26 - 13/11/26',
          ),
          const _InfoLinha(
            icon: Icons.local_cafe_outlined,
            texto: 'Café da Manhã',
          ),
          const _InfoLinha(
            icon: Icons.king_bed_outlined,
            texto: 'STANDARD - FRETE',
          ),
          const _InfoLinha(
            icon: Icons.people_outline,
            texto: '2 adultos',
          ),
          const Divider(height: 24),
          Row(
            children: [
              _DataBox(
                mes: 'nov',
                dia: '9',
              ),
              const SizedBox(width: 8),
              const Text(
                'Check in',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              _DataBox(
                mes: 'nov',
                dia: '13',
              ),
              const SizedBox(width: 8),
              const Text(
                'Check out',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: [
              OutlinedButton(
                style: _estiloBotaoBorda(),
                onPressed: () {
                  _mensagem(
                    context,
                    'Alteração de hotel disponível em breve.',
                  );
                },
                child: const Text('Alterar hotel'),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (_) => ModalDetalhesHotel(
                      pacote: pacote,
                    ),
                  );
                },
                child: const Text(
                  'Detalhes hotel',
                  style: TextStyle(
                    color: Color(0xFF0000B3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardVoo(BuildContext context) {
    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TituloSecao(titulo: 'Voo'),
          const SizedBox(height: 12),
          _VooCard(
            titulo: 'Ida   Seg, 9 de nov. 2026',
            icone: Icons.flight_takeoff,
            origemHorario: '15:20',
            origemCodigo: 'CGH',
            destinoHorario: '23:55',
            destinoCodigo: 'NAT',
            duracao: '8h 35min',
          ),
          const SizedBox(height: 12),
          _VooCard(
            titulo: 'Volta   Sex, 13 de nov. 2026',
            icone: Icons.flight_land,
            origemHorario: '12:25',
            origemCodigo: 'NAT',
            destinoHorario: '21:40',
            destinoCodigo: 'CGH',
            duracao: '9h 15min',
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            children: [
              OutlinedButton(
                style: _estiloBotaoBorda(),
                onPressed: () {
                  _mensagem(
                    context,
                    'Alteração de voo disponível em breve.',
                  );
                },
                child: const Text('Alterar voo'),
              ),
              TextButton(
                onPressed: () {
                  _mensagem(
                    context,
                    'Detalhes completos do voo em breve.',
                  );
                },
                child: const Text(
                  'Detalhes voo',
                  style: TextStyle(
                    color: Color(0xFF0000B3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardServicos(BuildContext context) {
    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TituloSecao(titulo: 'Serviços'),
          const SizedBox(height: 16),
          const Center(
            child: Column(
              children: [
                Icon(
                  Icons.card_travel,
                  size: 40,
                  color: Colors.indigo,
                ),
                SizedBox(height: 8),
                Text(
                  'Aproveite ainda mais a sua viagem!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000080),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Adicione serviços e atrações ao seu pacote e curta ainda mais a sua estadia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: _estiloBotaoBorda(),
                onPressed: () {
                  _mensagem(
                    context,
                    'Serviços adicionais disponíveis em breve.',
                  );
                },
                child: const Text('Adicionar serviços'),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {
                  _mensagem(
                    context,
                    'Detalhes dos serviços disponíveis em breve.',
                  );
                },
                child: const Text(
                  'Detalhes serviços',
                  style: TextStyle(
                    color: Color(0xFF0000B3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardResumoPreco(
    BuildContext context,
    double valorTotal,
  ) {
    return _CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Resumo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Detalhes',
                style: TextStyle(
                  color: Color(0xFF0000B3),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const Text(
            'Para 2 adultos',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          _LinhaPreco(
            titulo: 'Preço por viajante',
            valor: 'R\$ ${pacote.precoPorPessoa.toStringAsFixed(0)}',
          ),
          const SizedBox(height: 6),
          _LinhaPreco(
            titulo: 'Taxas e impostos',
            valor: 'R\$ ${pacote.taxasEImpostos.toStringAsFixed(0)}',
          ),
          const Divider(height: 24),
          _LinhaPreco(
            titulo: 'Valor final para 2 viajantes',
            valor: 'R\$ ${valorTotal.toStringAsFixed(0)}',
            destaque: true,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Em até 10x sem juros',
              style: TextStyle(
                color: Color(0xFF0000B3),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFE600),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              label: const Text(
                'Comprar pacote',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _mensagem(
                  context,
                  'Redirecionando para a finalização do pagamento...',
                  sucesso: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGETS AUXILIARES DO RESUMO
// ============================================================

class _CardContainer extends StatelessWidget {
  final Widget child;

  const _CardContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: child,
    );
  }
}

class _TituloSecao extends StatelessWidget {
  final String titulo;

  const _TituloSecao({
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF000080),
      ),
    );
  }
}

class _InfoLinha extends StatelessWidget {
  final IconData icon;
  final String texto;

  const _InfoLinha({
    required this.icon,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DataBox extends StatelessWidget {
  final String mes;
  final String dia;

  const _DataBox({
    required this.mes,
    required this.dia,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(
            mes,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          Text(
            dia,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _LinhaPreco extends StatelessWidget {
  final String titulo;
  final String valor;
  final bool destaque;

  const _LinhaPreco({
    required this.titulo,
    required this.valor,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            titulo,
            style: TextStyle(
              fontSize: destaque ? 13 : 13,
              fontWeight: destaque ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Text(
          valor,
          style: TextStyle(
            fontSize: destaque ? 20 : 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _VooCard extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final String origemHorario;
  final String origemCodigo;
  final String destinoHorario;
  final String destinoCodigo;
  final String duracao;

  const _VooCard({
    required this.titulo,
    required this.icone,
    required this.origemHorario,
    required this.origemCodigo,
    required this.destinoHorario,
    required this.destinoCodigo,
    required this.duracao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icone,
                size: 18,
                color: Colors.indigo,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'LATAM',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Horario(
                horario: origemHorario,
                codigo: origemCodigo,
              ),
              Column(
                children: [
                  Text(
                    duracao,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 2,
                    ),
                  ),
                  const Text(
                    '1 parada',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              _Horario(
                horario: destinoHorario,
                codigo: destinoCodigo,
                alinhadoDireita: true,
              ),
              const Icon(
                Icons.luggage,
                color: Colors.indigo,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Horario extends StatelessWidget {
  final String horario;
  final String codigo;
  final bool alinhadoDireita;

  const _Horario({
    required this.horario,
    required this.codigo,
    this.alinhadoDireita = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alinhadoDireita ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          horario,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          codigo,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

ButtonStyle _estiloBotaoBorda() {
  return OutlinedButton.styleFrom(
    foregroundColor: const Color(0xFF0000B3),
    side: const BorderSide(
      color: Color(0xFF0000B3),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

void _mensagem(
  BuildContext context,
  String mensagem, {
  bool sucesso = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensagem),
      backgroundColor: sucesso ? Colors.green : null,
    ),
  );
}

// ============================================================
// 6. MODAL DE DETALHES DO HOTEL
// ============================================================

class ModalDetalhesHotel extends StatefulWidget {
  final PacoteViagem pacote;

  const ModalDetalhesHotel({
    super.key,
    required this.pacote,
  });

  @override
  State<ModalDetalhesHotel> createState() => _ModalDetalhesHotelState();
}

class _ModalDetalhesHotelState extends State<ModalDetalhesHotel> {
  int _fotoSelecionadaIndex = 0;

  @override
  Widget build(BuildContext context) {
    final fotos = widget.pacote.fotos;

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Detalhes do hotel',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.pacote.hotel,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.pacote.endereco,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: fotos.isEmpty
                    ? const _AssetImage(
                        path: '',
                        height: 220,
                        width: double.infinity,
                        icon: Icons.hotel,
                      )
                    : _AssetImage(
                        path: fotos[_fotoSelecionadaIndex],
                        height: 220,
                        width: double.infinity,
                        icon: Icons.hotel,
                      ),
              ),
              const SizedBox(height: 12),
              if (fotos.length > 1)
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: fotos.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == _fotoSelecionadaIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _fotoSelecionadaIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? Colors.blue[900]!
                                  : Colors.transparent,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: _AssetImage(
                              path: fotos[index],
                              width: 80,
                              height: 70,
                              icon: Icons.hotel,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20),
              const Text(
                'Sobre a hospedagem',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.pacote.sobreHospedagem,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// 7. DETALHES DO DESTINO
// ============================================================

class TelaDetalhesDestino extends StatefulWidget {
  final Destino destino;

  const TelaDetalhesDestino({
    super.key,
    required this.destino,
  });

  @override
  State<TelaDetalhesDestino> createState() => _TelaDetalhesDestinoState();
}

class _TelaDetalhesDestinoState extends State<TelaDetalhesDestino> {
  bool _isFavorito = false;
  late int _totalAvaliacoes;
  int _fotoAtualIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _totalAvaliacoes = widget.destino.totalAvaliacoes;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleFavorito() {
    setState(() {
      if (_isFavorito) {
        if (_totalAvaliacoes > 0) {
          _totalAvaliacoes--;
        }
        _isFavorito = false;
      } else {
        _totalAvaliacoes++;
        _isFavorito = true;
      }
    });
  }

  Future<void> _abrirGoogleMaps(
    BuildContext context,
    String destinoNome,
  ) async {
    final origem = Uri.encodeComponent('Natal, RN');
    final destino = Uri.encodeComponent(destinoNome);

    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/dir/'
      '?api=1'
      '&origin=$origem'
      '&destination=$destino'
      '&travelmode=driving',
    );

    try {
      final podeAbrir = await canLaunchUrl(
        googleMapsUrl,
      );

      if (podeAbrir) {
        await launchUrl(
          googleMapsUrl,
          mode: LaunchMode.externalApplication,
        );
      } else if (context.mounted) {
        _mensagem(
          context,
          'Não foi possível abrir o Google Maps.',
        );
      }
    } catch (e) {
      if (context.mounted) {
        _mensagem(
          context,
          'Erro ao abrir o mapa.',
        );
      }
    }
  }

  void _abrirWhatsApp(BuildContext context) {
    final mensagem = Uri.encodeComponent(
      'Olá! Gostaria de saber mais sobre ${widget.destino.nome}.',
    );

    final url = Uri.parse(
      'https://wa.me/?text=$mensagem',
    );

    launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    ).catchError((_) {
      if (context.mounted) {
        _mensagem(
          context,
          'Não foi possível abrir o WhatsApp.',
        );
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fotos = widget.destino.fotosGaleria;

    final albumSection = SizedBox(
      height: 280,
      child: fotos.isEmpty
          ? const _AssetImage(
              path: '',
              height: 280,
              width: double.infinity,
              icon: Icons.landscape,
            )
          : Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: fotos.length,
                  onPageChanged: (index) {
                    if (mounted) {
                      setState(() {
                        _fotoAtualIndex = index;
                      });
                    }
                  },
                  itemBuilder: (_, index) {
                    return _AssetImage(
                      path: fotos[index],
                      width: double.infinity,
                      height: 280,
                      icon: Icons.landscape,
                    );
                  },
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_fotoAtualIndex + 1}/${fotos.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (fotos.length > 1)
                  Positioned(
                    bottom: 12,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        fotos.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          width: _fotoAtualIndex == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _fotoAtualIndex == index
                                ? Colors.white
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );

    final titleSection = Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.destino.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.destino.localizacao,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Favoritar',
            icon: Icon(
              _isFavorito ? Icons.star : Icons.star_border,
              color: _isFavorito ? Colors.amber[700] : Colors.grey,
              size: 30,
            ),
            onPressed: _toggleFavorito,
          ),
          Text(
            '$_totalAvaliacoes',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );

    final corTemaApp = Theme.of(context).primaryColor;

    final buttonSection = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(
            icon: Icons.chat,
            label: 'WHATSAPP',
            color: corTemaApp,
            onPressed: () => _abrirWhatsApp(context),
          ),
          _ActionButton(
            icon: Icons.map,
            label: 'ROTAS',
            color: corTemaApp,
            onPressed: () => _abrirGoogleMaps(
              context,
              widget.destino.nome,
            ),
          ),
          _ActionButton(
            icon: Icons.rate_review,
            label: 'AVALIAR',
            color: corTemaApp,
            onPressed: () => _exibirDialogoAvaliacao(context),
          ),
          _ActionButton(
            icon: Icons.share,
            label: 'COMPARTILHAR',
            color: corTemaApp,
            onPressed: () {
              _mensagem(
                context,
                'Link do destino copiado!',
              );
            },
          ),
        ],
      ),
    );

    final descriptionSection = Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sobre o Destino',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.destino.descricao,
            softWrap: true,
            style: const TextStyle(
              height: 1.5,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destino.nome),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          albumSection,
          titleSection,
          buttonSection,
          descriptionSection,
        ],
      ),
    );
  }

  void _exibirDialogoAvaliacao(
    BuildContext context,
  ) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Enviar Avaliação'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Escreva seu comentário sobre este destino...',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.dispose();
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final comentario = controller.text.trim();

                controller.dispose();
                Navigator.pop(dialogContext);

                if (comentario.isEmpty) {
                  _mensagem(
                    context,
                    'Digite um comentário antes de enviar.',
                  );
                  return;
                }

                _mensagem(
                  context,
                  'Avaliação enviada com sucesso!',
                  sucesso: true,
                );
              },
              child: const Text('Enviar'),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================
// BOTÃO DE AÇÃO
// ============================================================

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
