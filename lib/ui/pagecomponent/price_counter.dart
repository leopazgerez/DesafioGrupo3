import 'package:flutter/material.dart';

class PriceCounter extends StatefulWidget {
  String? description;
  int valueMax;
  int valueMin;
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
  late int _amount;
  late int _total;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amount = widget.valueMin;
    _total = widget.priceUnit * widget.valueMin;
  }

void increment(){
  if(_amount > 0 && _amount <= widget.valueMax) {
    setState(() {
      _amount++;
      _total = widget.priceUnit * _amount;
    });
  }
}
void decrement(){
  if(_amount > 0 && _amount >= widget.valueMin) {
    setState(() {
      _amount--;
      _total = (widget.priceUnit * _amount) - widget.priceUnit;
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _description(),
        _counter(),
        _totalPrice(),
      ],
    );
  }

  _description(){
    return Text('${widget.description}',style: TextStyle(color: widget.color, fontSize: 20));
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
        IconButton(onPressed: decrement, icon: Icon(Icons.remove,color: widget.color,)),
        Text('$_amount',style: TextStyle(color: widget.color, fontSize: 25, fontWeight: FontWeight.bold),),
        IconButton(onPressed: increment, icon: Icon(Icons.add, color: widget.color,)),
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
      child: Center(child: Text('$_total',style: TextStyle(color: widget.color, fontSize: 25, fontWeight: FontWeight.bold),)),
    );
  }
}
