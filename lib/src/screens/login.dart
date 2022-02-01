/* Massa Marco 5CIA 24/01/2022
AUTENTICAZIONE FIREBASE CON FLUTTER 
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';          /*Firebase Auth fornisce molti metodi e utilità per consentire l'integrazione 
                                                            dell'autenticazione sicura nell'applicazione Flutter nuova o esistente */
import 'package:massa_firebase/src/screens/home.dart';
import 'package:massa_firebase/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Massa_Firebase'),),
      body: Column(
        children: [
          const Text(                           //Testo 1
            "Schermata",                
            style:TextStyle(
              color: Colors.black,              //Imposta il colore del testo
              fontSize:28.0,                    //Imposta la grandezza del font 
              fontWeight: FontWeight.bold,      //Tipo di testo 
              ),
          ),

          const Text(                           //Testo 2
            "Login", 
            style: TextStyle(
              color: Colors.black, 
              fontSize: 44.0, 
              fontWeight: FontWeight.bold,
              ),
            ),

             const SizedBox(                    //Box per creare uno spazio 
              height: 15.0,
            ),

          Padding(                                  //Inserimento della mail
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,         
              decoration: InputDecoration(  
                hintText: 'Email'             
              ),
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(                                              //Inserimento della password
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            RawMaterialButton(                                    //Pulsante 1 per accedere
              elevation: 0.0,
              fillColor: Color(0xFF0069FE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Accedi',
              style:TextStyle(
                  color: Colors.white,
                   fontSize: 18.0,
              ),
              ),
              onPressed: () async {                                      
                try {
                  await auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                    // "signInWithEmailAndPassword" permette di accedere all'applicazione, passando indirizzo email e password dell'utente 
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
                } on FirebaseAuthException catch (e) {
                  var al = AlertDialog(
                    title: const Text('Login Error'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(e.message!),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () { Navigator.pop(context); },
                      ),
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return al;
                    },
                  );
                }    
            }),
            RawMaterialButton(                                   //Pulsante 2 per registrarsi 
               elevation: 0.0,
              fillColor: Color(0xFF0069FE),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text('Iscriviti',
              style:TextStyle(
                  color: Colors.white,
                   fontSize: 18.0,
              ),
              ),
              onPressed: () async {
                try {
                  await auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){         
                    /* "createUserWithEmailAndPassword" funzione per creare 
                    un nuovo account passando l'indirizzo email e la password del nuovo utente */
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));      //Permette di andare alla schermata home
                  });
                } on FirebaseAuthException catch (e) {
                  var al = AlertDialog(
                    title: const Text('Sign Up Error'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(e.message!),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () { Navigator.pop(context); },
                      ),
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return al;
                    },
                  );
                }
                
              },
            )
          ])
        ],),
    );
  }
}