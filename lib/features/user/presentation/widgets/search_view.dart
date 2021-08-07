import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojire_tdd/core/widgets/index.dart' as coreWidgets;
import 'package:ojire_tdd/features/user/presentation/getx/user_controller.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final UserController controller = Get.put(UserController());

  var _mobileNumberTextController = TextEditingController(text: "");
  var _passwordTextController = TextEditingController(text: "");
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
              Text("Search User", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 32)),
              SizedBox(height: 20),
              TextFormField(
                controller: _mobileNumberTextController,
                decoration: InputDecoration(
                  labelText: "Mobile number",
                  border: new OutlineInputBorder(borderSide: new BorderSide(color: Colors.teal)),
                ),
              ),
              SizedBox(height: 20),
              // Spacer(),
              TextFormField(
                controller: _passwordTextController,
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
              SizedBox(height: 32),
              coreWidgets.CustomButton(
                text: 'Fetch Online Data',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.remoteFetch(
                      mobileNumber: _mobileNumberTextController.value.text,
                      password: _passwordTextController.value.text,
                    );
                  }

                  // controller.changeView(ViewState.data);
                },
              ),
            ]),
          ),
        ));
  }
}
