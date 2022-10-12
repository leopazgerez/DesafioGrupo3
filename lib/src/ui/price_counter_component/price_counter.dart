import 'package:flutter/material.dart';
import '../../models/bingo_ticket_model.dart';


class PriceCounter extends StatefulWidget {
  final String? label;
  final int valueMax;
  final int valueMin;
  final BingoTicketModel bingoTicketModel;
  //final int priceUnit;
  final Color color;
  const PriceCounter({
    required this.bingoTicketModel,
    required this.valueMax,
  //required this.priceUnit,
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
  final double _styleSize = 18;

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
      padding: const EdgeInsets.all(8.0),
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
        Text('$_amount',style: TextStyle(color: widget.color, fontSize: _styleSize, fontWeight: FontWeight.bold),),
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
          Center(child: Text('$_total',style: TextStyle(color: widget.color, fontSize: _styleSize, fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }
}
