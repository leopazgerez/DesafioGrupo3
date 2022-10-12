import 'package:desafiogrupotres/src/ui/price_counter_component/price_counter.dart';
import 'package:flutter/material.dart';
import 'package:desafiogrupotres/src/models/bingo_ticket_model.dart';


class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  late var bingoTicketModel = BingoTicketModel(priceUnit: 1000);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: PriceCounter(
          label: 'Cantidad de cartones',
          bingoTicketModel: bingoTicketModel,
          valueMax: 20,
        ),
      ),
    );
  }
}
