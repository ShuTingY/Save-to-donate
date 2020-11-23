import 'package:flutter/material.dart';
import 'package:save_to_donate/services/auth.dart';
import 'package:save_to_donate/shared/constants.dart';
import 'package:save_to_donate/shared/loading.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email ='';
  String password = '';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text("Sign in to Save 2 donate"),
      ),
      body: Container (
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty? 'Enter an email' : null,
                onChanged: (val) {
                  setState(()=> email = val);

                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6? 'Enter a password 6+ chars long' : null ,
                onChanged: (val) {
                  setState (() => password = val);

                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green[400],
                child: Text (
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),

                onPressed: () async {
                 if(_formKey.currentState.validate()) {
                   setState(()=> loading = true);

                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                    if(result == null) {
                      setState(() {
                        error = 'Could not sign in with these credentials';
                        loading = false;
                      });
                    }
                 }

                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
