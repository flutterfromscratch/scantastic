import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scantastic/home/home.dart';

class OrderPage extends StatefulWidget {
  final ExpectedScanResult item;

  const OrderPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order an Item'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Would you like a...'),
          Icon(
            widget.item.icon,
            size: MediaQuery.of(context).size.width * 0.7,
          ),
          Text(
            widget.item.type,
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('NO'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('YES'),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        contentPadding: EdgeInsets.all(32),
                        title: Text('Your order is in!'),
                        children: [Text("It's on its way!")],
                      ),
                    ).then((value) => Navigator.of(context).pop()),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
