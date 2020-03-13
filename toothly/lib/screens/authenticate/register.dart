import 'package:flutter/material.dart';
import 'package:toothly/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          title: Text('Sign up to Toothly'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Sign in'))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(validator: (val) {
                  return val.isEmpty ? 'Enter an email' : null;
                }, onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }),
                SizedBox(height: 20.0),
                TextFormField(
                    validator: (val) {
                      return val.length < 6 ? 'Enter a 6+ char password' : null;
                    },
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.redAccent,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPssword(
                          email, password);
                      if (result==null){
                        setState(() {
                          error="Please supply a valid email";
                        });

                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0)
                )
              ]),
            ),
          ),
        ));
  }
}