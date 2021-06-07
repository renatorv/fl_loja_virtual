import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../layout.dart';

class Destaques extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: PageScrollPhysics(),
      children: List.generate(
        3,
        (int i) {
          return Container(
            decoration: BoxDecoration(
              color: Layout.secondary(.9),
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/produtos/prod-${i + 1}.jpg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 40,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () => null,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red[300],
                                borderRadius: BorderRadius.circular(45),
                              ),
                              child: FaIcon(
                                (i.isEven) ? FontAwesomeIcons.heart : FontAwesomeIcons.solidHeart,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Óculos do Reinaldo.',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Layout.dark(),
                            ),
                      ),
                      Text(
                        'Reinaldo Gianeccine',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Layout.secondaryDark(),
                            ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'R\$ 568,70',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Layout.primary(),
                                fontSize: 24,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
