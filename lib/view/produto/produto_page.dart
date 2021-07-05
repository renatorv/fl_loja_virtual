import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProdutoPage extends StatelessWidget {
  static String tag = '/produto-page';

  final int id;
  int currentPic = 0;

  ProdutoPage(this.id);

  @override
  Widget build(BuildContext context) {
    var sController = ScrollController();
    var listViewItemWidth = MediaQuery.of(context).size.width - 40;

    var content = Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              children: [
                ListView.builder(
                  controller: sController,
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, i) {
                    return Container(
                      width: listViewItemWidth,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Image.asset(
                          'assets/images/produtos/prod-${i + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: listViewItemWidth,
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
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
                          FontAwesomeIcons.solidHeart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: listViewItemWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        color: Layout.light(),
                      ),
                      onPressed: () {
                        sController.animateTo(
                          (currentPic - 1) * listViewItemWidth,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.ease,
                        );

                        currentPic--;
                        if (currentPic < 0) {
                          currentPic = 0;
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  width: listViewItemWidth,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: Layout.light(),
                      ),
                      onPressed: () {
                        sController.animateTo(
                          (currentPic + 1) * listViewItemWidth,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.ease,
                        );

                        currentPic++;
                        if (currentPic > 0) {
                          currentPic = 0;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Layout.light(),
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (MediaQuery.of(context).size.width - 60) * .65,
                        child: Text(
                          'Título',
                          style:
                              Theme.of(context).textTheme.headline6.copyWith(),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Preço',
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Layout.primary(),
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text('Vermelho'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text('Preto'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          label: Text('Azul'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          'Detalhes',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(height: 10),
                        Text(
                            'aasdklfjlaç a kdfljasçdklfj kjasdfkasjfçlkjij jkasdjfoij asjdiofjaw iejfkj kçljasdifjawie'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Layout.primary(),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Center(
              child: Text(
                'COMPRAR',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );

    return Layout.render(context, content);
  }
}
