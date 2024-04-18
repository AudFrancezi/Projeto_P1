// ignore_for_fileer_const_constructors

import 'package:flutter/material.dart';

import '../model/lista.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalViewState();
}

class _TelaPrincipalViewState extends State<TelaPrincipal> {
  List<Lista> dados = [];
  var txtNomeLista = TextEditingController();
  var editNomeLista = TextEditingController();

  @override
  void initState() {
    dados.add(Lista('Supermercado'));
    dados.add(Lista('Churrasco'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
        backgroundColor: Colors.green.shade200,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(dados[index].nome),
                  onTap: () {

                    String NomeLista = dados[index].nome;

                    Navigator.pushNamed(
                      context,
                      'lista',
                      arguments: NomeLista,
                    );
                  },
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text('Editar'),
                          value: 'editar',
                        ),
                        PopupMenuItem(
                          child: Text('Excluir'),
                          value: 'excluir',
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 'editar') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Editar nome da Lista'),
                            content: TextFormField(
                              controller: editNomeLista,
                              decoration: InputDecoration(
                                labelText: 'Informe o novo nome da lista',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancelar')),
                              TextButton(
                                onPressed: () => setState(() {
                                  editNomeLista.clear(); 
                                  Navigator.pop(context);
                                }),
                                child: const Text('Editar'),
                              )
                            ],
                          ),
                        );
                      } else if (value == 'excluir') {
                        setState(() {
                          dados.removeAt(index);
                        });
                        //print('Lista ${dados[index].nome} excluída!');
                      }
                    },
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Criar Lista'),
                  content: TextFormField(
                    controller: txtNomeLista,
                    decoration: InputDecoration(
                      labelText: 'Informe o nome da lista',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    TextButton(
                      onPressed: () => setState(() {
                        dados.add(Lista(txtNomeLista.text));
                        txtNomeLista.clear();
                        Navigator.pop(context);
                      }),
                      child: const Text('Criar'),
                    )
                  ],
                )
              ),
        shape: CircleBorder(),
        backgroundColor: Colors.green.shade200,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
