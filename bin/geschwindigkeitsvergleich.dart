

import 'dart:math';



void main() { 
  runApp(MyApp()); 
}




class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      final zahlenliste =  [];
  final randomQGenerator = Random();
  final sortedlist1 = bubblesort(zahlenliste);/ Set the app's primary theme color 
      ), 
      debugShowCheckedModeBanner: false, 
    ); 
  } 


void bubblesort(zahlenliste){

}

// Methode zum Generieren einer zufälligen 4-stelligen Zahl   
void generateRandomNumber() { 
    setState(() { 
      _randomNumber = 
          1000 + _random.nextInt(9000); // Generiert eine zufällige 4-stellige Zahl 
    },); 
  }
