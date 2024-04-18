import 'package:flutter/material.dart';

class TelaRecSenha extends StatefulWidget {
  const TelaRecSenha({super.key});

  @override
   State<TelaRecSenha> createState() => _TelaRecSenhaViewState();
  }

class _TelaRecSenhaViewState extends State<TelaRecSenha> {

  var formKey = GlobalKey<FormState>();

  var txtEmail = TextEditingController();
  var txtSenha1 = TextEditingController();
  var txtSenha2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        backgroundColor: Colors.green.shade200,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              TextFormField(
                controller: txtEmail,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'E-mail cadastrado',
                  border: OutlineInputBorder(),
                ),

                validator: (value){
                  if(value == null){
                    return 'Informe um usuário!';
                  } else if(value != 'fatec@outlook.com'){
                    return 'Usuário inválido!';
                  }

                  return null;
                },
              ),

             /* SizedBox(height: 30),

              TextFormField(
                controller: txtSenha1,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtSenha2,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),

                validator: (value){
                  if(value != txtSenha1){
                    return 'As senhas devem ser iguais';
                  }
                },
              ), */

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  foregroundColor: Colors.black,
                  minimumSize: Size(200,40),
                ),
                
                onPressed: (){
                  if(formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Sua senha é: Fatec123'),
                        duration: Duration(seconds: 3),
                      )
                    );
                  }
              }, 

              child: Text('Recuperar Senha',
                style: TextStyle(fontSize: 16
                ),
              ),
              )
            ],
        )
      )
      )
    );
  }
}