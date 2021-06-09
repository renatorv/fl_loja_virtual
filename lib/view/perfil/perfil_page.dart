import 'package:fl_loja_virtual/view/layout.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  static String tag = '/perfil-page';
  @override
  Widget build(BuildContext context) {
    var container = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          child: Text(
            'Editar Perfil',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Layout.light(),
                ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Layout.light(),
            ),
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Nome',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Endereço de entrega',
                  style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'CEP',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Rua',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Layout.primary(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Número',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Layout.primary(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Complemento',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Bairro',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Cidade',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Estado',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Layout.primary(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => null,
              child: Text('Salvar'),
              style: ElevatedButton.styleFrom(
                primary: Layout.primary(),
                onPrimary: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );

    return Layout.render(context, container);
  }
}
