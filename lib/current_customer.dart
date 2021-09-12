import 'package:flutter/material.dart';
import 'package:service_system/prob_customer.dart';

class CurrentCustomer extends StatefulWidget {
  @override
  _CurrentCustomerState createState() => _CurrentCustomerState();
}

class _CurrentCustomerState extends State<CurrentCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Customers'),
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
