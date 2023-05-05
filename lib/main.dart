import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:relative_frequencies/bar_chartmodel.dart';
import 'dart:math';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Find Relative Frequencies'),
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
  final rnd = Random();

  String remainder = '';
  List<double> arrayDouble = [];
  List<double> p = [];
  List<double> frequencies = [];
  List<int> count = [];

  @override
  void initState() {
    super.initState();
  }

  final List<BarModel> data = [];

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController ncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarModel, String>> series = [
      charts.Series(
        id: 'frequencies',
        data: data,
        domainFn: (BarModel series, _) => series.n.toString(),
        measureFn: (BarModel series, _) => series.freq,
        colorFn: (BarModel series, _) => series.color,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Prob 1',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    height: 36.0,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  const Text(
                    'Prob 2',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    height: 36.0,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller2,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  const Text(
                    'Prob 3',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    height: 36.0,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller3,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  const Text(
                    'Prob 4',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    height: 36.0,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controller4,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  const Text(
                    'Prob 5',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    remainder,
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  const Text(
                    'n',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    height: 36.0,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: ncontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              InkWell(
                onTap: () {
                  //SET REMAINDER VALUE ON SCREEN
                  setState(() {
                    remainder = (1.0 -
                            double.parse(controller1.text) -
                            double.parse(controller2.text) -
                            double.parse(controller3.text) -
                            double.parse(controller4.text))
                        .toStringAsFixed(3)
                        .toString();
                  });

                  //ADD PROBS TO ARRAY
                  arrayDouble.add(double.parse(controller1.text));
                  arrayDouble.add(double.parse(controller2.text));
                  arrayDouble.add(double.parse(controller3.text));
                  arrayDouble.add(double.parse(controller4.text));
                  arrayDouble.add(double.parse((1.0 -
                          double.parse(controller1.text) -
                          double.parse(controller2.text) -
                          double.parse(controller3.text) -
                          double.parse(controller4.text))
                      .toStringAsFixed(3)));
                  print('array = ${arrayDouble}');

                  //JUSTIFY ALL OCCURENCE + FREQUENCIES TO 0
                  for (int i = 0; i < arrayDouble.length; i++) {
                    count.add(0);
                    frequencies.add(0.0);
                  }

                  //FUNCTION
                  for (int i = 0; i < int.parse(ncontroller.text); i++) {
                    var randvalue = (rnd.nextDouble() * (1 - 0) + 0);
                    var p = arrayDouble[0];
                    var j = 0;
                    while (p < randvalue) {
                      j++;
                      p += arrayDouble[j];
                    }
                    count[j] += 1;
                  }

                  for (int a = 0; a < arrayDouble.length; a++) {
                    //FREQUENCIES FUNCTION = Frequency[i] = Statistics[i] / max
                    frequencies[a] = double.parse(
                        (count[a] / int.parse(ncontroller.text))
                            .toStringAsFixed(2));

                    //ADD TO BAR CHART
                    data.add(BarModel(
                        n: a + 1,
                        freq: double.parse(frequencies[a].toStringAsFixed(2)),
                        color: charts.ColorUtil.fromDartColor(Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0))));
                  }

                  print("COUNT ${count}");
                },
                child: Container(
                  height: 60.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      'START',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: 230,
                width: MediaQuery.of(context).size.width,
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              ),
              Text(
                'Frequencies value = $frequencies',
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
