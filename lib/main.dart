import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Função para fazer ligação telefônica
  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+552121234567');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      debugPrint('Não foi possível abrir o telefone');
    }
  }

  // Função para abrir rota no Google Maps
  Future<void> _openMaps() async {
    // Coordenadas da Praia de Copacabana
    const double lat = -22.9711;
    const double lng = -43.1822;
    final Uri mapsUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
    );
    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Não foi possível abrir o mapa');
    }
  }

  // Função para compartilhar
  Future<void> _shareDestination() async {
    await Share.share(
      'Confira este destino incrível: Praia de Copacabana, Rio de Janeiro, Brasil! '
      'Avaliação: 4.8 estrelas. '
      'Uma das praias mais famosas do mundo!',
      subject: 'Destino Turístico - Praia de Copacabana',
    );
  }

  @override
  Widget build(BuildContext context) {
    // Passo 5: Construindo a Coluna da Seção Título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Praia de Copacabana',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  'Rio de Janeiro, Brasil',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.amber[500],
          ),
          const SizedBox(width: 4),
          const Text(
            '4.8',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );

    // Passo 6: Método auxiliar para construir colunas de botões com ação
    Widget buildButtonColumn(
      Color color,
      IconData icon,
      String label,
      VoidCallback onPressed,
    ) {
      return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Cor primária do tema
    Color color = Theme.of(context).primaryColor;

    // Seção de Botões com funcionalidades
    Widget buttonSection = Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(color, Icons.call, 'LIGAR', _makePhoneCall),
          buildButtonColumn(color, Icons.near_me, 'ROTA', _openMaps),
          buildButtonColumn(color, Icons.share, 'COMPARTILHAR', _shareDestination),
        ],
      ),
    );

    // Passo 7: Definindo a Seção de Texto
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'A Praia de Copacabana é uma das praias mais famosas do mundo, localizada '
        'na zona sul da cidade do Rio de Janeiro. Com aproximadamente 4 km de '
        'extensão, seu calçadão icônico com ondas em mosaico português é '
        'reconhecido internacionalmente. O local oferece diversas atividades como '
        'vôlei de praia, futevôlei, surf e stand-up paddle. Além disso, a orla '
        'conta com quiosques, restaurantes e uma vista deslumbrante do Pão de '
        'Açúcar. É um destino imperdível para quem visita o Brasil!',
        softWrap: true,
        style: TextStyle(
          fontSize: 14,
          height: 1.5,
        ),
      ),
    );

    // Passo 8 e 9: Organizando os Elementos em uma ListView
    return MaterialApp(
      title: 'Agência de Viagens - Avaliações',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Destinos Turísticos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        body: ListView(
          children: [
            // Imagem do destino
            Image.asset(
              'images/copacabana.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            // Seção do título com nome e avaliação
            titleSection,
            // Seção de botões de ação
            buttonSection,
            // Seção de texto descritivo
            textSection,
          ],
        ),
      ),
    );
  }
}
