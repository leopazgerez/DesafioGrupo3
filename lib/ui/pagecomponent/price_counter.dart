import 'package:flutter/material.dart';

class PriceCounter extends StatefulWidget {
  final String? description;
  final int valueMax;
  final int valueMin;
  final int priceUnit;
  final Color color;
  late int totalPrice = priceUnit;
  late int totalAmount = valueMin ;
  PriceCounter(
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
  //late int totalAmount;
  //late int totalPrice;
  final double _height=35;
  final double _fontsizetext=15;
  final double _fontsizeicon=18;
  final double _padding=5;

  @override
  /*void initState() {
    // TODO: implement initState
    super.initState();
    widget.totalAmount = widget.valueMin;
    widget.totalPrice = widget.priceUnit * widget.valueMin;
  }*/

  void increment() {
    if (widget.totalAmount > 0 && widget.totalAmount < widget.valueMax) {
      setState(() {
        widget.totalAmount++;
        widget.totalPrice = widget.priceUnit * widget.totalAmount;
      });
    }
  }

  void decrement() {
    if (widget.totalAmount > 0 && widget.totalAmount > widget.valueMin) {
      setState(() {
        widget.totalAmount--;
        widget.totalPrice = (widget.priceUnit * widget.totalAmount);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _text(){
      if(widget.description != null){
        return Row(
          children: [
            _description(),
            const SizedBox(width: 10,),
          ],
        );
      }else{
        return SizedBox.shrink();
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: _text()),
          _counter(),
          const SizedBox(width: 10,),
          _totalPrice(),
    ]
    );
  }

  /*Widget _counterWithoutLabel() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _counter(),
        //SizedBox(width: 10,),
        _totalPrice(),
      ],
    );
  }

  Widget _counterWithLabel() {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _description(),
        const SizedBox(width: 15,),
        _counter(),
        const SizedBox(width: 10,),
        _totalPrice(),
      ],
    );
  }*/

  Widget _description() {
    return Row(
      children: [
        Text(widget.description!,
            style: TextStyle(color: widget.color, fontSize: _fontsizetext)),
      ],
    );
  }

  Widget _counter() {
    return Container(
      height: _height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
              color: widget.color,
              width: 1.5
          )),
      child: Row(
        children: [
          IconButton(
              //padding: EdgeInsets.symmetric(horizontal: _padding),
              onPressed: decrement,
              iconSize: _fontsizeicon,
              icon: Icon(
                Icons.remove,
                color: widget.color,
              )),
          Text(
            widget.totalAmount.toString(),
            style: TextStyle(
                color: widget.color, fontSize: _fontsizeicon, fontWeight: FontWeight.bold),
          ),
          IconButton(
              //padding: EdgeInsets.symmetric(horizontal: _padding),
              iconSize: _fontsizeicon,
              onPressed: increment,
              icon: Icon(
                Icons.add,
                color: widget.color
              )),
        ],
      ),
    );
  }

  Widget _totalPrice() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _padding + 8),
      height: _height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: widget.color, width: 1.5)),
      child: Center(
        child: Text(
          "\u0024" + widget.totalPrice.toString(),
          style: TextStyle(
          color: widget.color, fontSize: 20, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
