import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BodyMassIndex extends StatefulWidget {
  const BodyMassIndex({super.key, required this.title});

  final String title;

  @override
  State<BodyMassIndex> createState() => _BodyMassIndexState();
}

class _BodyMassIndexState extends State<BodyMassIndex> {
  double _imc = 0;
  String _imcCategorie = "";
  var controllerTaille = TextEditingController();
  var controllerPoids = TextEditingController();

  List<Map<String, dynamic>> weightCategories = [
    {
      'underweight': [0, 18.5]
    },
    {
      'normal': [18.5, 24.9]
    },
    {
      'overweight': [24.9, 34.9]
    },
    {
      'obesity': [34.9, 99.9]
    }
  ];

  void _calculPoids(taille, poids) {
    var pTaille = double.parse(taille);
    var pPoids = double.parse(poids);
    setState(() {
      _imc = pPoids / (pTaille * pTaille);
      _imcCategorie = _getConcernedCategorie(_imc);
    });
  }

  String _getConcernedCategorie(double imc) {
    for (var category in weightCategories) {
      String key = category.keys.first;
      List<num> range = category[key];

      if (imc >= range[0] && imc <= range[1]) {
        return key;
      }
    }
    return 'Catégorie inconnue';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                ],
                controller: controllerTaille,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Donner la taille en mètre',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
                ],
                controller: controllerPoids,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Donner le poids en KG',
                ),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: () {
                _calculPoids(controllerTaille.text, controllerPoids.text);
              },
              child: const Text('Calculer mon imc'),
            ),
            if (_imcCategorie.isNotEmpty)
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Votre imc : $_imcCategorie",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            SfRadialGauge(axes: <RadialAxis>[
              RadialAxis(minimum: 0, maximum: 60, ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 18.5,
                    color: const Color.fromARGB(255, 4, 243, 243)),
                GaugeRange(
                    startValue: 18.5,
                    endValue: 24.9,
                    color: const Color.fromARGB(255, 99, 223, 99)),
                GaugeRange(
                    startValue: 24.9,
                    endValue: 34.9,
                    color: const Color.fromARGB(255, 252, 122, 0)),
                GaugeRange(startValue: 34.9, endValue: 60, color: Colors.red)
              ], pointers: <GaugePointer>[
                NeedlePointer(value: _imc)
              ], annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text(_imc.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 0.5)
              ])
            ])
          ],
        ),
      ),
    );
  }
}
