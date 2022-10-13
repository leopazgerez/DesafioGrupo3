import 'package:flutter/material.dart';
import '../../models/bingo_ticket_model.dart';


class PriceCounter extends StatefulWidget {
  final String? label;
  final int valueMax;
  final int valueMin;
  final BingoTicketModel bingoTicketModel;
  final Color color;
  const PriceCounter({
    required this.bingoTicketModel,
    required this.valueMax,
    this.color = Colors.blue,
    this.label,
    this.valueMin = 1,
    Key? key}) : super(key: key);

  @override
  State<PriceCounter> createState() => _PriceCounterState();
}

  class _PriceCounterState extends State<PriceCounter> {

  late int _amount = widget.valueMin;
  late int _total = widget.bingoTicketModel.priceUnit * _amount;

  final double _fontSize = 15;
  final double _dataSize = 20;
  final double _height = 35;
  final double _iconSize = 22;
  final double _widthBoxBorder = 1.5;
  final EdgeInsets _padding = const EdgeInsets.all(5);

  void increment() {
    if (_amount > 0 && _amount < widget.valueMax) {
      setState(() {
        _amount++;
        _total = widget.bingoTicketModel.priceUnit * _amount;
      });
    }
  }

  void decrement() {
    if (_amount > 0 && _amount > widget.valueMin) {
      setState(() {
        _amount--;
        _total = (widget.bingoTicketModel.priceUnit * _amount);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget visibleText(){
      if(widget.label != null){
        return Row(
          children: [
            _label(),
            const SizedBox(width: 10,),
          ],
        );
      }else{
        return const SizedBox.shrink();
      }
    }
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: visibleText()),
            _counter(),
            const SizedBox(width: 10,),
            _totalPrice(),
          ]
      ),
    );
  }

  _label(){
    return Text('${widget.label}',style: TextStyle(color: widget.color, fontSize: _fontSize));
  }

  Widget _counter() {
    return Container(
      height: _height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
              color: widget.color,
              width: _widthBoxBorder
          )),
      child: Row(
        children: [
          GestureDetector(
            onTap: decrement,
            child: Padding(
              padding: _padding,
              child: Icon(
                Icons.remove,
                color: widget.color,
                size: _iconSize,
              ),
            ),
          ),
          const SizedBox(width: 5,),
          Text(
            _amount.toString(),
            style: TextStyle(
                color: widget.color, fontSize: _dataSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 5,),
          GestureDetector(
            onTap: increment,
            child: Padding(
              padding: _padding,
              child: Icon(
                Icons.add,
                color: widget.color,
                size: _iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _totalPrice() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: _height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: widget.color, width: 1.5)),
      child: Center(
        child: Text(
          "\u0024$_total",
          style: TextStyle(
            color: widget.color, fontSize: _dataSize, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
