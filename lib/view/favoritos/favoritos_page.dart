import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout.dart';

class FavoritosPage extends StatelessWidget {
  static String tag = '/favoritos-page';
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          margin: EdgeInsets.fromLTRB(20, (i == 0 ? 10 : 0), 20, 10),
          decoration: BoxDecoration(
            color: Layout.light(),
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            leading: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 5,
                    color: Layout.dark(.3),
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    'https://picsum.photos/id/${i + 35}/200/300.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Text('Um item'),
            subtitle: Text('Um subtitulo'),
            trailing: IconButton(
              icon: FaIcon(
                i.isEven ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                color: Colors.red[300],
              ),
              onPressed: () => null,
            ),
          ),
        );
      },
    );

    return Layout.render(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Favoritos',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Layout.light(),
                  ),
            ),
          ),
          Expanded(child: content),
        ],
      ),
      bottomItemSelected: 2,
    );
  }
}
