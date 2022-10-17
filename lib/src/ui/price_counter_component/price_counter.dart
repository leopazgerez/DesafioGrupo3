import 'package:flutter/material.dart';
import '../../models/bingo_ticket_model.dart';


class PriceCounter extends StatefulWidget {
  final String? label;
  final int valueMax;
  final int valueMin;
  final BingoTicketModel bingoTicketModel;
  final Color color;
  final double fontSize;
  final double dataSize;
  final double iconSize;
  final double height;
  final Function getShop;
  const PriceCounter({
    required this.bingoTicketModel,
    required this.valueMax,
    this.color = Colors.blue,
    this.label,
    this.valueMin = 1,
    this.fontSize = 15,
    this.dataSize = 20,
    this.iconSize = 22,
    this.height = 40,
    required this.getShop,
    Key? key}) : super(key: key);

  @override
  State<PriceCounter> createState() => _PriceCounterState();
}

  class _PriceCounterState extends State<PriceCounter> {

  late int _amount = widget.valueMin;
  late int _total = widget.bingoTicketModel.priceUnit * _amount;
  final double _widthBoxBorder = 1.5;
  final EdgeInsets _padding = const EdgeInsets.all(5);

  @override
  void initState(){
    widget.getShop(_amount,_total);
    super.initState();
  }

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
            const SizedBox(width: 5,),
          ],
        );
      }else{
        return const SizedBox.shrink();
      }
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: visibleText()),
          _counter(),
          // const SizedBox(width: 15,),
          _totalPrice(),
        ]
    );
  }

  Widget _label(){
    return Expanded(
      child: Text('${widget.label}',style: TextStyle(
        color: widget.color,
        fontSize: widget.fontSize,
        overflow: TextOverflow.ellipsis,
      )),
    );
  }

  Widget _counter() {
    return Row(
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(
                  color: widget.color,
                  width: _widthBoxBorder
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: decrement,
                  child: Padding(
                    padding: _padding,
                    child: Icon(
                      Icons.remove,
                      color: widget.color,
                      size: widget.iconSize,
                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Text(
                  _amount.toString(),
                  style: TextStyle(
                      color: widget.color, fontSize: widget.dataSize, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: increment,
                  child: Padding(
                    padding: _padding,
                    child: Icon(
                      Icons.add,
                      color: widget.color,
                      size: widget.iconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _totalPrice() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: widget.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: widget.color, width: 1.5)),
      child: Center(
        child: Text(
          "\u0024$_total",
          style: TextStyle(
            color: widget.color, fontSize: widget.dataSize, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
