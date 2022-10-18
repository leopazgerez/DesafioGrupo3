import 'package:flutter/material.dart';
import '../../models/bingo_ticket_model.dart';


class PriceCounter extends StatefulWidget {
  final String? label;
  final int valueMax;
  final int valueMin=1;
  final BingoTicketModel bingoTicketModel;
  final Color color;
  late int amount = valueMin;
  late int total = bingoTicketModel.priceUnit * amount;
  final Function getShop;
  PriceCounter({
    required this.bingoTicketModel,
    required this.valueMax,
    this.color = Colors.blue,
    this.label,
    required this.getShop,
    Key? key}) : super(key: key);

  @override
  State<PriceCounter> createState() => _PriceCounterState();
}

  class _PriceCounterState extends State<PriceCounter> {
  final double fontSize = 18;
  final double dataSize = 22;
  final double iconSize = 22;
  final double height = 33;
  final double widthBoxBorder = 1.5;
  final EdgeInsets padding = const EdgeInsets.all(5);

  @override
  void initState() {
    // TODO: implement initState
    widget.getShop(widget.amount,widget.total);
    super.initState();
  }

  void increment() {
    if (widget.amount> 0 && widget.amount < widget.valueMax) {
      setState(() {
        widget.amount++;
        widget.total = widget.bingoTicketModel.priceUnit * widget.amount;
      });
    }
  }

  void decrement() {
    if (widget.amount > 0 && widget.amount > widget.valueMin) {
      setState(() {
        widget.amount--;
        widget.total = (widget.bingoTicketModel.priceUnit * widget.amount);
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
            const SizedBox(width: 2.5),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _counter(),
              const SizedBox(width: 10),
              _totalPrice(),
            ],
          ),
        ]
    );
  }

  Widget _label(){
    return Expanded(
      child: Text('${widget.label}',
        style: TextStyle(color: widget.color,fontSize: fontSize),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _counter() {
    return Row(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(
                  color: widget.color,
                  width: widthBoxBorder
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap:(){
                    decrement();
                    widget.getShop(widget.amount,widget.total);
                  },
                  child: Padding(
                    padding: padding,
                    child: Icon(
                      Icons.remove,
                      color: widget.color,
                      size: iconSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: Text(
                    widget.amount.toString(),
                    style: TextStyle(
                        color: widget.color, fontSize:dataSize, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      increment();
                      widget.getShop(widget.amount,widget.total);
                    },
                    child: Padding(
                    padding: padding,
                    child: Icon(
                      Icons.add,
                      color: widget.color,
                      size: iconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _totalPrice() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: widget.color, width: 1.5)),
      child: Center(
        child: Text(
          "\u0024${widget.total}",
          style: TextStyle(
            color: widget.color, fontSize: dataSize, fontWeight: FontWeight.bold,),
        ),
      ),
    );
  }
}
