/* Massa Marco 5CIA 24/01/2022
AUTENTICAZIONE FIREBASE CON FLUTTER 
*/

import 'package:firebase_auth/firebase_auth.dart';          /*Firebase Auth fornisce molti metodi e utilità per consentire l'integrazione 
                                                            dell'autenticazione sicura nell'applicazione Flutter nuova o esistente */
import 'package:flutter/material.dart';
import 'package:massa_firebase/src/screens/login.dart';


//Classe per permettere il logout dall'account 
class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Center(child: FlatButton(child: Text('Esci',
      style:TextStyle(
        color: Colors.black,
          fontSize: 30.0,
      ),
      ),
      onPressed: (){
        auth.signOut();       // Funzione per disconnettere l'utente corrente.
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
      },),),
    );
  }
}

