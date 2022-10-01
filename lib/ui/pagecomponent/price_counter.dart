import 'package:flutter/material.dart';

class PriceCounter extends StatefulWidget {
  String? description;
  int valueMax;
  late int valueMin;
  int priceUnit;
  late Color color;
  PriceCounter({
    required this.valueMax,
    required this.priceUnit,
    this.color = Colors.blue,
    this.description,
    this.valueMin = 1,
    Key? key}) : super(key: key);

  @override
  State<PriceCounter> createState() => _PriceCounterState();
}

class _PriceCounterState extends State<PriceCounter> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _description(),
          _counter(),
          _totalPrice(),
        ],
      ),
    );
  }

  _description(){
    return Text('${widget.description}',style: TextStyle(color: widget.color, fontSize: 20));
  }

  late int numberBingos = widget.valueMin;
  late int total = widget.priceUnit;
  void _incrementCounter() {
    setState(() {
      total += widget.priceUnit;
      numberBingos++;
    });
  }
  void _decrementCounter() {
    setState(() {
      total -= widget.priceUnit;
      numberBingos--;
    });
  }

  _counter(){
    return Container(
        height: 50,
        // width: 300,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
    border: Border.all(
    color: widget.color,
    width: 2)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: _decrementCounter, icon: Icon(Icons.remove,color: widget.color,)),
        Text('$numberBingos',style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),),
        IconButton(onPressed: _incrementCounter, icon: Icon(Icons.add, color: widget.color,)),
      ],
    ),
    );
  }
  _totalPrice(){
    return Container(
        height: 50,
        // width: 50,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
    border: Border.all(
    color: widget.color,
    width: 2)
    ),
      child: Row(
        children: [
          Icon(Icons.add, color: widget.color,),
          Center(child: Text('$total',style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }
}
