import 'package:desafiogrupotres/src/ui/custom_button_circular_component.dart';
import 'package:desafiogrupotres/src/ui/price_counter_component/price_counter.dart';
import 'package:flutter/material.dart';
import 'package:desafiogrupotres/src/models/bingo_ticket_model.dart';


class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  late var bingoTicketModel = BingoTicketModel(priceUnit: 1500);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox(width: 100,)),
            _testComponent(context),
          ],
        ),
      ),
    );
  }

  Widget _testComponent(context){
    int bingos = 0;
    int total = 0;

    int getTotal(int total){
      return total;
    }
    int getBingo(int bingo){
      return bingo;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
       color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PriceCounter(
            bingoTicketModel: bingoTicketModel,
            valueMax: 20,
            label: 'Cantidad de cartones',
            getShop: (int bingo,  int totality){
              bingos = getBingo(bingo);
              total = getTotal(totality);
            },
          ),
          const SizedBox(height: 20,),
          CustomButton(
            text: 'Comprar',
            backgroundColor: Theme.of(context).primaryColor,
            height: 50,
            textSize: 20,
            onTap: (){
              print('Cantindad de cartones = ${bingos.toString()}  Total = ${total.toString()}');
            },
          ),
        ],
      ),
    );
  }
}
