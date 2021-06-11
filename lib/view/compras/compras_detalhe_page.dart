import 'package:flutter/material.dart';

import '../layout.dart';

class ComprasDetalhePage extends StatelessWidget {
  static String tag = '/compras-detalhe-page';
  final int id;

  ComprasDetalhePage(this.id);

  @override
  Widget build(BuildContext context) {
    var content = Container(
      decoration: BoxDecoration(
        color: Layout.light(),
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Em 20/03/2020 às 14:36'),
          Text('Status: Em análise'),
          SizedBox(height: 10),
          Text('Total em Itens: R\$ 70,00'),
          Text('Frete por PAC: R\$ 30,00'),
          SizedBox(height: 10),
          Text('Total: R\$ 100,00'),
          SizedBox(height: 20),
          Text(
            'Itens: ',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Layout.dark(.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    dense: true,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://picsum.photos/id/${i + 50}/200/300.jpg'),
                    ),
                    title: Text('Óculos Lindão'),
                    subtitle: Text('3 X R\$ 15,00'),
                    trailing: Text('R\$ 45,00'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    return Layout.render(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 0),
            child: Text(
              'Compra #$id',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Layout.light(),
                  ),
            ),
          ),
          Expanded(child: content),
        ],
      ),
      bottomItemSelected: 1,
    );
  }
}
