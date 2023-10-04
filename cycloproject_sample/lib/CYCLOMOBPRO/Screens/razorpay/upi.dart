import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import '';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final paymentItems = <PaymentItem>[];
  @override
  void initState() {
    paymentItems.add(PaymentItem(
        amount: '200', label: "Ride1", status: PaymentItemStatus.final_price));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Payment Method"),
      ),
      body: Center(
        child: GooglePayButton(
          
          paymentConfigurationAsset: 'gpay.json',
          paymentItems: paymentItems,
          onPaymentResult: (data) {
            print(data);
          },
          width: 150,
          height: 60,
          
        ),
      ),
    );
  }
}
