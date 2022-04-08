import 'package:ennachat_redwan_ecom_app/Providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../Style/style.dart';
import '../Models/order.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<Orders>(context);
    return Dismissible(
      background: Container(
        color: Style.primaryColor,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      key: ValueKey(widget.order),
      onDismissed: (direction) {
        orders.deleteItem(widget.order);
      },
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: ListTile(
              title: Text(
                DateFormat("dd/MMMM/yyyy hh:mm").format(widget.order.date),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '\$${widget.order.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              trailing: _isExpanded
                  ? Icon(
                      Icons.keyboard_arrow_up_sharp,
                      color: Style.primaryColor,
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: Style.primaryColor,
                    ),
            ),
          ),
          if (_isExpanded)
            Column(
              children: widget.order.items
                  .map(
                    (e) => ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Style.backgroundColor,
                        radius: 30,
                        child: FittedBox(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(e.prd.image)),
                        ),
                      ),
                      title: Text(
                        e.prd.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: e.quantity == 1
                          ? Text(
                              '${e.quantity} item',
                            )
                          : Text(
                              '${e.quantity} items',
                            ),
                      trailing: Text(
                        '\$${e.totalPrice}',
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
