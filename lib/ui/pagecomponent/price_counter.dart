import 'package:flutter/material.dart';

class PriceCounter extends StatefulWidget {
  final String? description;
  final int valueMax;
  final int valueMin;
  final int priceUnit;
  final Color color;
  const PriceCounter(
      {required this.valueMax,
      required this.priceUnit,
      this.color = Colors.blue,
      this.description,
      this.valueMin = 1,
      Key? key})
      : super(key: key);

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

  void increment() {
    if (_amount > 0 && _amount < widget.valueMax) {
      setState(() {
        _amount++;
        _total = widget.priceUnit * _amount;
      });
    }
  }

  void decrement() {
    if (_amount > 0 && _amount > widget.valueMin) {
      setState(() {
        _amount--;
        _total = (widget.priceUnit * _amount);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.description != null) {
      return _counterWithLabel();
    } else {
      return _counterWithoutLabel();
    }
  }

  Row _counterWithoutLabel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _counter(),
        _totalPrice(),
      ],
    );
  }

  Row _counterWithLabel() {
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

  _description() {
    return Text(widget.description ?? '',
        style: TextStyle(color: widget.color, fontSize: 20));
  }

  _counter() {
    return Container(
      height: 40,
      // width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: widget.color, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: decrement,
              icon: Icon(
                Icons.remove,
                color: widget.color,
              )),
          Text(
            '$_amount',
            style: TextStyle(
                color: widget.color, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: increment,
              icon: Icon(
                Icons.add,
                color: widget.color,
              )),
        ],
      ),
    );
  }

  _totalPrice() {
    return Container(
      height: 40,
      // width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: widget.color, width: 2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            '\u0024$_total',
            style: TextStyle(
            color: widget.color, fontSize: 25, fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}
