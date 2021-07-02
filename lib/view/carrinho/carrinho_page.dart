import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout.dart';

class CarrinhoPage extends StatelessWidget {
  static String tag = '/carrinho';
  @override
  Widget build(BuildContext context) {
    var temFrete = false;

    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Titulo
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'Carrinho',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.light(),
                ),
          ),
        ),
        // Lista
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 18,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                decoration: BoxDecoration(
                  color: Layout.light(),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 3),
                      color: Layout.dark(.1),
                    ),
                  ],
                ),
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          'https://picsum.photos/id/${i + 50}/200/300.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Nome do produto'),
                            SizedBox(height: 5),
                            Text(
                              'Um subtitulo',
                              style: TextStyle(
                                color: Layout.dark(.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('R\$ 125,50'),
                          Container(
                            width: 70,
                            // color: Colors.grey[350],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => print('Esquerda'),
                                  child: FaIcon(FontAwesomeIcons.chevronLeft,
                                      size: 16),
                                ),
                                Text('1', style: TextStyle(fontSize: 18)),
                                GestureDetector(
                                  onTap: () => print('Direita'),
                                  child: FaIcon(FontAwesomeIcons.chevronRight,
                                      size: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Resumo
        Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Layout.light(),
                Layout.light(.6),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      color: Layout.dark(.1),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: temFrete
                          ? Text(
                              'PAC',
                              style: TextStyle(fontSize: 24),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.truck,
                                  color: Layout.primaryDark(),
                                ),
                                Text(
                                  'Selecione o Frete',
                                  style: TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('5 Produtos'),
                            Text('Frete:'),
                            SizedBox(height: 10),
                            Text(
                              'Total:',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('R\$ 150,00'),
                          Text('R\$ 15,80'),
                          SizedBox(height: 10),
                          Text(
                            'R\$ 165,80',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // Botão Finalizar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: temFrete ? () => null : null,
              child: Text('Finalizar Compra'),
              style: ElevatedButton.styleFrom(
                primary: Layout.primary(),
                onPrimary: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );

    return Layout.render(context, content);
  }
}
