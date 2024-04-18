// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
   State<TelaLogin> createState() => _TelaLoginViewState();
  }

class _TelaLoginViewState extends State<TelaLogin> {

  var formKey = GlobalKey<FormState>();

  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                controller: txtUsuario,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  border: OutlineInputBorder(),
                ),

                validator: (value){
                  if(value == null){
                    return 'Informe um usuário!';
                  } else if(value != 'Fatec'){
                    return 'Usuário inválido!';
                  }

                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtSenha,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),

                validator: (value){
                  if(value == null){
                    return 'Informe uma senha!';
                  } else if(value != 'Fatec123'){
                    return 'Senha inválida!';
                  }

                  return null;
                },
              ),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  foregroundColor: Colors.black,
                  minimumSize: Size(200,40),
                ),

                onPressed: (){
                  if(formKey.currentState!.validate()){
                    Navigator.pushNamed(context, 'principal');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuário e/ou senha inválido(s)!'),
                          duration: Duration(seconds: 5),
                        )
                    );
                  }
                }, 
                child: Text('Entrar',
                style: TextStyle(fontSize: 16
                ),
              ),
            ),

            SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade200,
                  foregroundColor: Colors.black,
                  minimumSize: Size(200,40),
                ),
                
                onPressed: (){
                  Navigator.pushNamed(context, 'rec');
                }, 
                child: Text('Esqueci minha senha',
                style: TextStyle(fontSize: 16
                ),
              ),
            ),

            ],
          )
        ),
      ),
      
    );
  }
}