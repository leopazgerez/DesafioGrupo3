import 'package:flutter/material.dart';

class PriceCounter extends StatefulWidget {
  final String? description;
  final int valueMax;
  late int valueMin;
  final int priceUnit;
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
  late int _amount;
  late int _total;

  @override
  void initState() {
  // TODO: implement initState
  super.initState();
  _amount = widget.valueMin;
  _total = widget.priceUnit;
  }
  void increment(){
  setState(() {
    while (_amount <= widget.valueMax){
      _total = widget.priceUnit * widget.valueMin;
    }
    _amount = widget.valueMin++;
  });
  }
  void decrement(){
  setState(() {
    while (_amount >= widget.valueMin){
      _total = widget.priceUnit * widget.valueMin;
    }
    _amount = widget.valueMin--;

  });
  }

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
  _counter(){
    return Container(
        height: 50,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
    border: Border.all(
    color: widget.color,
    width: 2)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: decrement, icon: Icon(Icons.remove,color: widget.color,)),
        Text('$_amount',style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),),
        IconButton(onPressed: increment, icon: Icon(Icons.add, color: widget.color,)),
      ],
    ),
    );
  }
  _totalPrice(){
    return Container(
      padding: const EdgeInsets.only(right: 5),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
              color: widget.color,
              width: 2)
      ),
      child: Row(
        children: [
          Icon(Icons.attach_money, color: widget.color,),
          Center(child: Text('$_total',style: TextStyle(color: widget.color, fontSize: 20, fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }
}
