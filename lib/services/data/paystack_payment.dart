import 'dart:io';

import 'package:docs_and_nurs/services/data/paystack_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Screens/Home Screen/appointment_successful.dart';

class MakePayment{
  MakePayment({required this.ctx, required this.email, required this.price});
  BuildContext ctx; int price ; String email;
  PaystackPlugin payStack = PaystackPlugin();

  //make reference
  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //card UI
  PaymentCard _getCardUI(){
    return PaymentCard(number: '', cvc: '', expiryMonth: 0, expiryYear: 0);
  }

  //initialize plugin
  Future initializePlugin() async{
    await payStack.initialize(publicKey: PayStackKey.Pkey);
  }

  //charging card
  chargeCard ()async{
    initializePlugin().then((_) async{
      Charge charge = Charge()
        ..amount = price * 100
        ..reference = _getReference()
        ..email = email
        ..card = _getCardUI();

      CheckoutResponse response = await payStack.checkout(
        ctx,
        method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
        charge: charge,
        fullscreen: false,
        logo: const FlutterLogo(
          size: 24,
        ),
      );
      print('PayStack Response $response');
      if(response.status==true){
        print('Transaction Successful');
        Get.to(()=> const AppointmentSuccessful());
      }
      else{print('Transaction Failed');
      }
    });
  }


}