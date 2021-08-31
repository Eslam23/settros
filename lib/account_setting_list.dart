import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/current_customer.dart';
import 'package:service_system/data_list.dart';
import 'package:service_system/last_customer.dart';
import 'package:service_system/prob_customer.dart';
import 'package:service_system/products.dart';
import 'package:service_system/visitor_customer.dart';
import 'package:service_system/visitor_with_name.dart';

class AccountSettingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    List<DataList> dataList = data(context);
    return Container(
      height: _height,
      width: _width,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            DataPopUp(dataList[index]),
        itemCount: dataList.length,
      ),
    );
  }
}

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);
  final DataList popup;

  @override
  Widget build(BuildContext context) {
    final GlobalKey expansionTileKey = GlobalKey();
    Widget _buildTiles(DataList root) {
      if (root.children.isEmpty)
        return ListTile(
          title: root.title,
          leading: root.icon != null ? root.icon : SizedBox(),
          onTap: () {
            if (root.nextScreen != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => root.nextScreen));
            }
          },
        );
      return ExpansionTile(
        key: expansionTileKey,
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            _scrollToSelectedContent(expansionTileKey: expansionTileKey);
          }
        },
        title: root.title,
        leading: root.icon != null ? root.icon : SizedBox(),
        children: root.children.map(_buildTiles).toList(),
      );
    }

    return _buildTiles(popup);
  }
}

void _scrollToSelectedContent({GlobalKey expansionTileKey}) {
  final keyContext = expansionTileKey.currentContext;
  if (keyContext != null) {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      Scrollable.ensureVisible(keyContext,
          duration: Duration(milliseconds: 200));
    });
  }
}

List<DataList> data(BuildContext context) {
  double size = 25;
  return <DataList>[
    /*
    DataList(
      title: Text('profile'),

      icon: Icon(Icons.person),
      //nextScreen: ClientHomePage()
    ),
    */
    DataList(
      title: Text('Application Setting'),
      icon: Icon(Icons.manage_accounts),
      children: <DataList>[
        DataList(
          title: Text('Language'),
          icon: Icon(Icons.password),
          //nextScreen: ChangePass()
        ),
        DataList(
          title: Text('Dark Mode'),
          icon: Icon(Icons.edit),
          //nextScreen: EditAccountInfo()
        ),
        DataList(
          title: Text('Notification Sound'),
          icon: Icon(Icons.phone_android),
          //nextScreen: PhoneVerification()
        ),
        DataList(
          title: Text('Chat Sound'),
          icon: Icon(Icons.receipt),
          //nextScreen: EditBillingInfo()
        ),
        /*
        DataList(
          title: Text('create_sub_account'),
          icon: Icon(Icons.group),
          //nextScreen: CreateSubAccount()
        ),
        DataList(
          title: Text('customer_records'),
          icon: Icon(Icons.table_view),
          //nextScreen: CustomerRecords()
        ),
        */
      ],
    ),
    DataList(
        title: Text('Customers'),
        icon: Icon(Icons.account_balance_wallet),
        children: [
          DataList(
            title: Text('Probably Customers'),
            icon: Icon(Icons.add_box),
            nextScreen: ProbCustomer(),
          ),
          DataList(
              title: Text('Current Customers'),
              icon: Icon(Icons.local_atm),
              nextScreen: CurrentCustomer()),
          DataList(
              title: Text('Last Customers'),
              icon: Icon(Icons.local_atm),
              nextScreen: LastCustomer()),
          DataList(
              title: Text('Visitor Customers'),
              icon: Icon(Icons.local_atm),
              nextScreen: VisitorCustomer()),
        ]),
    // hosting taps
    DataList(
      title: Text('Visitos'),
      icon: Icon(Icons.gite),
      children: <DataList>[
        DataList(
            title: Text('Visitors Have Name'),
            icon: Image.asset(
              "assets/icons/shared_hosting.png",
              width: size,
              height: size,
            ),
            nextScreen: VisitorWithName()),
        DataList(
          title: Text('Visitors With No Name'),
          icon: Image.asset(
            "assets/icons/vps.png",
            width: size,
            height: size,
          ),
          //nextScreen: VPSScreen()
        ),
        /*
        DataList(
          title: Text('servers'),
          icon: Image.asset(
            "assets/icons/servers.png",
            width: size,
            height: size,
          ),
          //nextScreen: ServersScreen()
        ),
        DataList(
          title: Text('addons'),
          icon: Image.asset(
            "assets/icons/addons.png",
            width: size,
            height: size,
          ),
          //nextScreen: AddonsScreen()
        ),
        */
      ],
    ),

    //domain Taps
    DataList(
      title: Text('Groups'),
      icon: Image.asset(
        "assets/icons/domains.png",
        width: size,
        height: size,
      ),
      /*
      children: <DataList>[
        DataList(
          title: Text('search'),
          icon: Icon(Icons.search),
          //nextScreen: DomainSearchScreen(TextEditingController())
        ),
        DataList(
          title: Text('dns_setting'),
          icon: Icon(Icons.dns),
          //nextScreen: DnsSettingScreen()
        ),
        DataList(
          title: Text('domain_management'),
          icon: Image.asset(
            "assets/icons/domain_management.png",
            width: size,
            height: size,
          ),
          //nextScreen: DomainManagement()
        ),
      ],
      */
    ),

    //Serves taps
    DataList(
        title: Text('Products'),
        icon: Image.asset(
          "assets/icons/services.png",
          width: size,
          height: size,
        ),
        nextScreen: Products()
        /*
      children: <DataList>[
        DataList(
          title: Text('all_services'),
          icon: Image.asset(
            "assets/icons/services.png",
            width: size,
            height: size,
          ),
          //nextScreen: AllServicesScreen()
        ),
        DataList(
          title: Text('services_panel'),
          icon: Image.asset(
            "assets/icons/services_panel.png",
            width: size,
            height: size,
          ),
          //nextScreen: ServiceManagementPanel()
        ),
        DataList(
          title: Text('service_setting'),
          icon: Image.asset(
            "assets/icons/service_setting.png",
            width: size,
            height: size,
          ),
          //nextScreen: ServiceSetting()
        ),
        DataList(
          title: Text('terms_of_service'),
          icon: Image.asset(
            "assets/icons/terms_of_service.png",
            width: size,
            height: size,
          ),
          //nextScreen: LicenseView(licenseText),
        ),
      ],
      */
        ),
    //orders taps

    /*DataList(
  title: Text(getTranslated(context, 'orders')),
  icon: Image.asset("assets/icons/orders.png",width: size,height: size,),
  children: <DataList>[
  DataList(
  title: Text(getTranslated(context, 'add_new_order')),
  icon: Image.asset("assets/icons/add_new_order.png",width: size,height: size,),
  //Todo add screen
  ),*/

    /*
    DataList(
        title: Text(getTranslated(context, 'all_orders')),
        icon: Image.asset(
          "assets/icons/all_orders.png",
          width: size,
          height: size,
        ),
        nextScreen: AllOrdersScreen()),
    // ]),
    */

    //invoices taps

    DataList(
      title: Text('Plans'),
      icon: Image.asset(
        "assets/icons/invoices.png",
        width: size,
        height: size,
      ),
      //nextScreen: InvoicesScreen()
    ),
    //offers taps
    DataList(
      title: Text('Meeting'),
      icon: Image.asset(
        "assets/icons/offers.png",
        width: size,
        height: size,
      ),
      //nextScreen: OfferScreen()
      children: <DataList>[
        DataList(
          title: Text('Video Call'),
          icon: Image.asset(
            "assets/icons/services.png",
            width: size,
            height: size,
          ),
          //nextScreen: AllServicesScreen()
        ),
        DataList(
          title: Text('Voice Call'),
          icon: Image.asset(
            "assets/icons/services_panel.png",
            width: size,
            height: size,
          ),
          //nextScreen: ServiceManagementPanel()
        ),
        /*
        DataList(
          title: Text('service_setting'),
          icon: Image.asset(
            "assets/icons/service_setting.png",
            width: size,
            height: size,
          ),
          //nextScreen: ServiceSetting()
        ),
        DataList(
          title: Text('terms_of_service'),
          icon: Image.asset(
            "assets/icons/terms_of_service.png",
            width: size,
            height: size,
          ),
          //nextScreen: LicenseView(licenseText),
        ),
        */
      ],
    ),
    //notification taps
    DataList(
      title: Text('Others'),
      icon: Icon(Icons.notifications_active),
      //nextScreen: NotificationScreen()
    ),
    // support taps
    /*
    DataList(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('support'),
          Image.asset(
            "assets/icons/live.png",
            width: size,
            height: size,
          )
        ],
      ),
      icon: Icon(Icons.support_agent),
      children: <DataList>[
        DataList(
          title: Text('technical_support'),
          icon: Image.asset(
            "assets/icons/technical_support.png",
            width: size,
            height: size,
          ),
          // nextScreen: SupportChatScreen()
        ),
        DataList(
          title: Text('invoices'),
          icon: Image.asset(
            "assets/icons/invoices.png",
            width: size,
            height: size,
          ),
          // nextScreen: SupportChatScreen()
        ),
        //customers_service //removed
        DataList(
          title: Text('sales_support'),
          icon: Image.asset(
            "assets/icons/create_ticket.png",
            width: size,
            height: size,
          ),
          // nextScreen: SupportChatScreen()
          //Todo add shared_hosting screen
        ),
        DataList(
          title: Text('create_ticket'),
          icon: Image.asset(
            "assets/icons/create_ticket.png",
            width: size,
            height: size,
          ),
          //nextScreen: CreateSupportTicket()
        ),
        DataList(
          title: Text('all_tickets'),
          icon: Image.asset(
            "assets/icons/all_tickets.png",
            width: size,
            height: size,
          ),
          //nextScreen: AllTickets()
        ),
        
      ],
    
    ),
  */
  ];
}
