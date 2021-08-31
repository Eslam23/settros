import 'package:flutter/material.dart';
import 'package:service_system/prob_customer.dart';

class LastCustomer extends StatefulWidget {
  @override
  _LastCustomerState createState() => _LastCustomerState();
}

class _LastCustomerState extends State<LastCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Customers'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CustomerItemWidget(),
            CustomerItemWidget(),
            CustomerItemWidget(),
            CustomerItemWidget(),
            CustomerItemWidget(),
            CustomerItemWidget(),
            CustomerItemWidget(),
            //CustomerItemWidget(),
            // CustomerItemWidget(),
          ],
        ),
      ),
    );
  }
}
