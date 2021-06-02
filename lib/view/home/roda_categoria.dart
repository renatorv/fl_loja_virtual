import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../layout.dart';

// Identifica o lado que a roda deve girar
enum SwypeDirection { left, right }

class RodaCategoria extends StatefulWidget {
  @override
  _RodaCategoriaState createState() => _RodaCategoriaState();
}

class _RodaCategoriaState extends State<RodaCategoria> with SingleTickerProviderStateMixin {
  // Controller da animação
  AnimationController _controller;

  // Para tween 1 => 360 graus
  // Para transform.rotate => pi * 2 => 360 graus

  // Controlar o grau de giro por item
  double _startDeg = 0.0;
  double _endDeg = 0.0;

  // Controle do lado que o usuário está arrastando
  double _dragInitial = 0;

  SwypeDirection _swypeDirection;

  // Model (fixo) de item para serem impressos na roda
  final List<Map<String, dynamic>> items = const [
    {"icon": Icons.favorite, "text": 'Estilo', 'id': 1},
    {"icon": Icons.filter_drama, "text": 'Teen', 'id': 2},
    {"icon": Icons.flight, "text": 'Viagem', 'id': 3},
    {"icon": Icons.store_mall_directory, "text": 'Trabalho', 'id': 4},
    {"icon": Icons.style, "text": 'Casual', 'id': 5},
    {"icon": Icons.supervised_user_circle, "text": 'Executivo', 'id': 6},
    {"icon": Icons.switch_video, "text": 'Esporte', 'id': 7},
    {"icon": Icons.thumb_up, "text": 'Clássico', 'id': 8},
  ];

  @override
  void initState() {
    super.initState();

    // Inicia a animação
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Faz somente a sombra
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(2, 0),
                color: Layout.dark(.4),
              ),
            ],
          ),
        ),
        // Container que será animado
        RotationTransition(
          turns: Tween(begin: _startDeg, end: _endDeg).animate(_controller),
          child: GestureDetector(
            onTap: () {
              // _controller.reset();
              // _startDeg = _endDeg;
              // _endDeg += (1 / items.length);

              // setState(() {
              //   _controller.forward();
              // });
            },
            onHorizontalDragStart: (details) {
              // Poscição onde começou a arrastar
            },
            onHorizontalDragUpdate: (details) {
              // Atualiza a diferença entre uma posição e outra

              // Verificamos se arrastou para a direita ou para esquerda
              _swypeDirection = SwypeDirection.right;

              if ((details.globalPosition.dx - _dragInitial) < 0) {
                _swypeDirection = SwypeDirection.left;
              }
            },
            onHorizontalDragEnd: (details) {
              // Finial do movimento

              _startDeg = _endDeg;
              _controller.reset();

              switch (_swypeDirection) {
                case SwypeDirection.left:
                  _endDeg -= (1 / items.length);

                  break;

                case SwypeDirection.right:
                  break;
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Layout.secondaryDark(),
              ),
              child: Stack(
                children: _getCategorias(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _getCategorias() {
    List<Widget> result = [];

    result.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
        child: Image.asset(
          'assets/images/bg-catwheel.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    var angle = pi * 2;

    for (Map<String, dynamic> item in items) {
      angle += (pi * 2) / items.length;

      result.add(
        Transform.rotate(
          angle: angle, // ( pi * 2 => 360 graus)
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    item['icon'],
                    color: Layout.light(),
                    size: 32,
                  ),
                ),
                Text(
                  item['text'],
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Layout.light(),
                      ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return result;
  }
}
