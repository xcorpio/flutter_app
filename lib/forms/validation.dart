import 'package:flutter/material.dart';

class CustomFormApp extends StatelessWidget {
  final appTitle = 'Form Validation Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allow validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term',
            ),
            onChanged: (value) {
              print('First text field: $value');
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter your username',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              } else {
                return null;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Procssing Data')));
                }
              },
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
