import 'package:flutter/material.dart';
import 'package:login_balta/store/app_store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sejá bem vindo"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(store.picture),
              Text(store.name),
              Text(store.email),
            ],
          ),
        ),
      ),
    );
  }
}
