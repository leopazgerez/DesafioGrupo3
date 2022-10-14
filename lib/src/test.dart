import 'package:desafiogrupotres/src/ui/custom_button_circular_component.dart';
import 'package:desafiogrupotres/src/ui/price_counter_component/price_counter.dart';
import 'package:flutter/material.dart';
import 'package:desafiogrupotres/src/models/bingo_ticket_model.dart';


class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  late var bingoTicketModel = BingoTicketModel(priceUnit: 2000);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: const Color(0xff35A4A3),
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
    late int amount=0;
    late int total=0;

    int getAmount(int amountWidget){
      return amountWidget;
    }

    int getTotalPrice(int totalPriceWidget){
      return totalPriceWidget;
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
            valueMax: 30,
            color: const Color(0xff35A4A3),
            label: 'Cantidad de cartones',
            getShop: (int amountBingos,int totalPrice){
              total = getTotalPrice(totalPrice);
              amount = getAmount(amountBingos);
            },
          ),
          const SizedBox(height: 20,),
          CustomButton(
            text: 'Comprar',
            backgroundColor: const Color(0xff35A4A3),
            height: 50,
            textSize: 20,
            onTap: (){
              print("Cartones = " + amount.toString() + " Precio Total = " + total.toString() );
            },
          ),
        ],
      ),
    );
  }
}
