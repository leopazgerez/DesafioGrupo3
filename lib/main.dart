import 'package:desafiogrupotres/ui/pagecomponent/price_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // backgroundColor: Colors.red,
        body:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              PriceCounter(valueMax:10, priceUnit: 1400,valueMin: 2,),
              SizedBox(height: 20,),
              PriceCounter(description: 'Cantidad de cartones',valueMax:30, priceUnit:1300,),
            ],
          ),
        )
      ),
    );
  }
}

