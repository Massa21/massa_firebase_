/* Massa Marco 5CIA 24/01/2022
AUTENTICAZIONE FIREBASE CON FLUTTER 
*/

import 'package:firebase_core/firebase_core.dart';    /*Firebase core plug-in è responsabile della connessione 
                                                      dell'app Flutter al progetto Firebase  */
import 'package:flutter/material.dart';
import 'package:massa_firebase/src/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //"Firebase.initializeApp" crea e inizializza un'istanza dell'app Firebase.
  
  await Firebase.initializeApp(                      /* Keyword "await" dice: vai avanti ed esegui questa funzione 
                                                    in modo asincrono e, al termine, continua alla riga di codice successiva */
  );
  runApp(App());
}
