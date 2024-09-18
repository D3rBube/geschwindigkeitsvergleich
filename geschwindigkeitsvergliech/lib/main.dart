import 'package:flutter/material.dart';
import 'package:geschwindigkeitsvergliech/random_number_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geschwindigkeitsrechner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Wer ist der Schnellste?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RandomNumberList randomList;

  List<int> bubbleSorted = [];
  List<int> mergeSorted = [];
  List<int> insertSorted = [];

  String bubbleSortTime = '';
  String mergeSortTime = '';
  String insertSortTime = '';

  @override
  void initState() {
    super.initState();
    _generateNewList(); // Erstelle eine neue Liste bei der Initialisierung
  }

  void _generateNewList() {
    // Erzeuge eine neue zufällige Liste
    randomList = RandomNumberList(
        10000, 1000); // Beispiel: Liste mit 10.000 Zahlen und Maxwert 1000
  }

  void _sortLists() {
    setState(() {
      _generateNewList(); // Neue zufällige Liste generieren

      Stopwatch stopwatch = Stopwatch();

      // Unsortierte Liste im Terminal ausgeben
      print('Unsortierte Liste: ${randomList.numbers}');

      // Bubble Sort
      bubbleSorted = [...randomList.numbers];
      stopwatch.start();
      randomList.bubbleSort(bubbleSorted);
      stopwatch.stop();
      bubbleSortTime = '${stopwatch.elapsedMicroseconds} µs';
      print('BubbleSort sortierte Liste: $bubbleSorted');
      print('BubbleSort Zeit: $bubbleSortTime');
      stopwatch.reset();

      // Merge Sort
      mergeSorted = [...randomList.numbers];
      stopwatch.start();
      randomList.mergeSort(mergeSorted, 0, mergeSorted.length - 1);
      stopwatch.stop();
      mergeSortTime = '${stopwatch.elapsedMicroseconds} µs';
      print('MergeSort sortierte Liste: $mergeSorted');
      print('MergeSort Zeit: $mergeSortTime');
      stopwatch.reset();

      // Insertion Sort
      insertSorted = [...randomList.numbers];
      stopwatch.start();
      randomList.insertionSort(insertSorted);
      stopwatch.stop();
      insertSortTime = '${stopwatch.elapsedMicroseconds} µs';
      print('InsertionSort sortierte Liste: $insertSorted');
      print('InsertionSort Zeit: $insertSortTime');
      stopwatch.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // Bildpfad
                fit: BoxFit
                    .cover, // Das Bild soll den gesamten Bildschirm abdecken
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Sortierzeiten:',
                    style: TextStyle(backgroundColor: Colors.grey),
                  ),
                ),
                const Text(
                  'Bubblesort:',
                  style: TextStyle(
                      color: Colors.red, backgroundColor: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Dauer: $bubbleSortTime',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        backgroundColor: Colors.grey),
                  ),
                ),
                const Text(
                  'Mergesort:',
                  style: TextStyle(
                      color: Colors.yellow, backgroundColor: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Dauer: $mergeSortTime',
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        backgroundColor: Colors.grey),
                  ),
                ),
                const Text(
                  'Insert Sort:',
                  style: TextStyle(
                      color: Colors.blue, backgroundColor: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Dauer: $insertSortTime',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        backgroundColor: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _sortLists, // Beim Klicken wird eine neue Liste generiert und sortiert
        tooltip: 'Sortieren',
        child: const Icon(Icons.sort),
      ),
    );
  }
}
