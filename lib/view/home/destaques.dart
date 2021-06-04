import 'package:flutter/material.dart';

import '../layout.dart';

class Destaques extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        children: List.generate(
          3,
          (int i) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Layout.secondary(.9),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width - 40,
                  // child: Column(
                  //   children: [Expanded(child: ClipRRect(),),],
                  // ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
