import 'package:albin_abx/helpers/models/item.dart';
import 'package:flutter/material.dart';

import '../helpers/base_request.dart';

class HTTPWidget extends StatefulWidget {
  final HTTPRequest<Item> _request;
  const HTTPWidget(this._request);

  @override
  _HTTPWidgetState createState() => new _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<List<Item>> future;
  var futureItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureItem = widget._request.execute();
  }

  @override
  Widget build(_) {
    return FutureBuilder(
      future: futureItem, // errror
      builder: (_, AsyncSnapshot<List<Item>> snapshot) {
        if (snapshot.hasError) {
          return Text('Error en los datos');
        }

        if (snapshot.hasData) {
          var items = snapshot.data;
          if (items != null) {
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, int index) {
                return _MyWidget(
                  item: items[index],
                );
              },
            );
          } else {
            return Text(' noe s dato show');
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class _MyWidget extends StatelessWidget {
  final Item item;

  const _MyWidget({
    super.key,
    required this.item,
  });

  String _capitalizeString(String text) {
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 185, 202, 25),
      
      child: ListTile(
        
        title: Text(
          _capitalizeString(
            item.body,

          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap:(
          
        ){

        },
      ),
     
    );
  }
}
