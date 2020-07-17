import 'package:flutter/material.dart';
import 'package:login_balta/controllers/singup_controller.dart';
import 'package:login_balta/store/app_store.dart';
import 'package:login_balta/viewmodel/singup_viewmodel.dart';
import 'package:login_balta/views/home_view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = SignupController();
  var model = new SingupViewModel();


  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Cadastra-se"),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.name = val;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.email = val;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Senha Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  model.password = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              model.busy
                  ? Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    )
                  : FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text("Cadastrar"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          setState(() {
                            _controller.create(model).then((value) {
                              //print(value.token);
                              setState(() {});
                              store.setUser(
                                value.name,
                                value.email,
                                value.picture,
                                value.token,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            });
                          });
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    ));
  }
}
