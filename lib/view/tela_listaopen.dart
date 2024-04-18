// ignore_for_fileer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_p1/model/itens.dart';
//import 'package:easy_search_bar/easy_search_bar.dart';

class TelaListaOpen extends StatefulWidget {
  const TelaListaOpen({super.key});

  @override
  State<TelaListaOpen> createState() => _TelaListaOpenViewState();
}

class _TelaListaOpenViewState extends State<TelaListaOpen> {
  List<Itens> dados = [];
  var txtNomeItem = TextEditingController();
  var txtQntdItem = TextEditingController();
  var txtCategItem = TextEditingController();
  var txtAdicItem = TextEditingController();

  var editNomeItem = TextEditingController();
  var editQntdItem = TextEditingController();

  TextEditingController editController = TextEditingController();

  List<bool> _isChecked = [];

  @override

  void initState() {
    dados.add(Itens('Guaraná', '2 un', 'Refrigerante', ' '));
    dados.add(Itens('Coxão mole', '2 kg', 'Carne', 'Bovina'));
    for(int i=0; i<dados.length;i++){
    _isChecked.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final String NomeLista = ModalRoute.of(context)!.settings.arguments as String;
    

    return Scaffold(
      appBar: AppBar(
        title: Text('${NomeLista}'),
        backgroundColor: Colors.green.shade200,
        
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: 

        ListView.builder(

            itemCount: dados.length,

            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Checkbox(
                      checkColor: Colors.white,
                      value: _isChecked[index],
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked[index] = value!;
                        });
                      },
                      activeColor: Colors.green.shade200,
                    ),

                  title: Text(dados[index].nome),
                  subtitle: Column(
                    children: [
                      Text('Quantidade: ${dados[index].qntd}'),
                      Text('Categoria:  ${dados[index].categoria}'),
                      Text(dados[index].adicional),
                    ],
                  ),
                  //onTap: () {},
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
                            title: const Text('Editar Item'),
                            content: 
                            Column(
                              children: [
                            TextFormField(
                              controller: editNomeItem,
                              decoration: InputDecoration(
                                labelText: 'Informe o novo nome do item',
                                border: OutlineInputBorder(),
                              ),
                            ),
                              
                              SizedBox(height: 10),

                            TextFormField(
                              controller: txtQntdItem,
                              decoration: InputDecoration(
                                labelText: 'Informe a quantidade de itens',
                                border: OutlineInputBorder(),
                              ),
                            ),

                              ]
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancelar')),
                              TextButton(
                                onPressed: () => setState(() {
                                  editNomeItem.clear(); 
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
                      }
                    },
                  ),
                ),
              );
            }
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Criar Item'),
                  content: 
                    Column(
                      children: [ 
                      
                      TextFormField(
                    controller: txtNomeItem,
                    decoration: InputDecoration(
                      labelText: 'Informe o nome do item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                    
                    SizedBox(height: 10),

                    TextFormField(
                    controller: txtQntdItem,
                    decoration: InputDecoration(
                      labelText: 'Informe a quantidade de itens',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    controller: txtCategItem,
                    decoration: InputDecoration(
                      labelText: 'Informe a categoria do item',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    controller: txtAdicItem,
                    decoration: InputDecoration(
                      labelText: 'Campo adicional do item',
                      border: OutlineInputBorder(),
                    ),
                  ),

                    ],
                  ),

                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    
                    TextButton(
                      onPressed: () => setState(() {
                        dados.add(Itens(
                          txtNomeItem.text,
                          txtQntdItem.text,
                          txtCategItem.text,
                          txtAdicItem.text
                        ));

                        _isChecked.add(false);

                        txtNomeItem.clear();
                        txtQntdItem.clear();
                        txtCategItem.clear();
                        txtAdicItem.clear();
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
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
