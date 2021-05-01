import 'package:course_bootcamp/Methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example4Page extends StatefulWidget {
  @override
  _Example4PageState createState() => _Example4PageState();
}

class _Example4PageState extends State<Example4Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = "";
  String? _nameSaved;

  Widget _inputName() {
    return Container(
        child: TextFormField(
            keyboardType: TextInputType.name,
            onSaved: (val) => _name = val ?? "",
            style: TextStyle(fontWeight: FontWeight.bold),
            validator: (val) =>
                (val != null && val.isNotEmpty) ? null : "Issue in Name",
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              prefixIcon: Icon(Icons.person),
              labelText: "Name",
              hintText: "Enter ur Name",
            )));
  }

  AppBar _appBar() {
    return AppBar(title: Text("Example 4"));
  }

  Widget _formName() {
    return Form(
        key: _formKey,
        child: Column(
          children: [_inputName()],
        ));
  }

  Widget _body() {
    return Column(
      children: [
        Text("${(_nameSaved == null) ? "No data" : _nameSaved}"),
        _formName()
      ],
    );
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  Widget _fabSaveForm() {
    return FloatingActionButton.extended(
      onPressed: _saveDataForm,
      label: Text("Save Form"),
      icon: Icon(Icons.save),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(), body: _body(), floatingActionButton: _fabSaveForm());
  }

  void _saveDataForm() async {
    final FormState? _formState = _formKey.currentState;
    if (_formState != null && _formState.validate()) {
      _formState.save();

      try {
        await _writeData(value: _name);
        snackMessage(message: "Saved :D", context: context);
      } catch (error) {
        snackMessage(
            message: "${error.toString()}", context: context, isError: true);
      }
    } //del if

    else {
      snackMessage(
          message: "Issue Inside the Form", context: context, isError: true);
    }
  }

  void _readData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    _nameSaved = preferences.getString("Name");
    setState(() {});
  }

  Future<void> _writeData({required final String value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("Name", value);
  }
}
