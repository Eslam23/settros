import 'package:flutter/material.dart';
import 'package:service_system/prob_customer.dart';

class VisitorCustomer extends StatefulWidget {
  @override
  _VisitorCustomerState createState() => _VisitorCustomerState();
}

class _VisitorCustomerState extends State<VisitorCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitor Customers'),
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
