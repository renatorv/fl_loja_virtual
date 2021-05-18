import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../layout.dart';

class RodaCategoria extends StatefulWidget {
  @override
  _RodaCategoriaState createState() => _RodaCategoriaState();
}

class _RodaCategoriaState extends State<RodaCategoria> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
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
          turns: Tween(begin: 0.0, end: -0.25).animate(_controller),
          child: GestureDetector(
            onTap: () {
              _controller.forward().then((value) {
                // _controller.reset();
              });
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
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                    child: Image.asset(
                      'assets/images/bg-catwheel.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
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
                            Icons.favorite,
                            color: Layout.light(),
                            size: 32,
                          ),
                        ),
                        Text(
                          'Estilo',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Layout.light(),
                              ),
                        )
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
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
                              Icons.filter_drama,
                              color: Layout.light(),
                              size: 32,
                            ),
                          ),
                          Text(
                            'Teen',
                            style: Theme.of(context).textTheme.subtitle1.copyWith(
                                  color: Layout.light(),
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
