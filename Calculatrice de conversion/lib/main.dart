import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Convertisseur d''unite',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      //  secondaryHeaderColor: Colors.amberAccent
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _inputController = TextEditingController();
  double resultat;
  String _de = 'grammes';
  String _a = 'kilogrammes';

  final Map<String, double> _conversion = {
    'grammes': 1,
    'kilogrammes': 1 / 1000,
    'pounds (lb.)': 1 / 454,
    'ounces': 1 / 28.35
  };

  double calcul() {
    var value = double.tryParse(_inputController.text);
    if (value != null) {
      return value * (_conversion[_a] / _conversion[_de]);
    }
  }

  @override
  void initState() {
    _inputController.addListener(() {
      setState(() {
        resultat = calcul();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertisseur d'unité"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            children: [
              const Text(
                'Valeur  pour convertir',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'mettre le nombre ici'),
                
              ),
              const SizedBox(height: 16),
              DropdownButton<String>(
                value: _de,
                isExpanded: true,
                items: _conversion.entries
                    .map((MapEntry<String, double> mapEntry) {
                  return DropdownMenuItem(
                    child: Text(mapEntry.key),
                    value: mapEntry.key,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _de = value as String;
                    resultat = calcul();
                  });
                },
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _a,
                isExpanded: true,
                items: _conversion.entries
                    .map((MapEntry<String, double> mapEntry) {
                  return DropdownMenuItem(
                    child: Text(mapEntry.key),
                    value: mapEntry.key,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _a = value as String;
                    resultat = calcul();
                  });
                },
              ),
              const SizedBox(height: 30),
              Text(
                (resultat == null || resultat == 0)
                    ? ''
                    : resultat.toStringAsFixed(4),
                style: const TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}
