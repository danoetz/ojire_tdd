import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojire_tdd/features/user/domain/entities/user_entity.dart';
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';

class AddUserView extends StatefulWidget {
  @override
  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final UserController controller = Get.put(UserController());

  var _namelTextController = TextEditingController(text: "");
  var _mobileNumberTextController = TextEditingController(text: "");
  var _emailTextController = TextEditingController(text: "");
  var _passwordTextController = TextEditingController(text: "");
  var _pinTextController = TextEditingController(text: "");
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Add User", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 32)),
              SizedBox(height: 20),
              TextFormField(
                controller: _namelTextController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _mobileNumberTextController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailTextController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordTextController,
                textInputAction: TextInputAction.next,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _pinTextController,
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                  labelText: "Pin",
                  border: OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                ),
              ),
              SizedBox(height: 32),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).primaryColor,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserEntity _user = UserEntity(
                        name: _namelTextController.value.text,
                        mobileNumber: _mobileNumberTextController.value.text,
                        email: _emailTextController.value.text,
                        password: _passwordTextController.value.text,
                        pin: int.parse(_pinTextController.value.text),
                      );
                      print(_user.toString());

                      controller.addingUser(user: _user);
                    }

                    // controller.changeView(ViewState.data);
                  },
                  child: Text(
                    "Add",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
