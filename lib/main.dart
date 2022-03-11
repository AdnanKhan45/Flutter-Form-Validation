import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "email", border: OutlineInputBorder()),
                validator: (value) {
                  if (RegExp(emailRegex).hasMatch(value!)) {
                  } else if (value == null || value.isEmpty) {
                    return "field cannot be empty";
                  } else {
                    return "email is not correctly formatted";
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "password", border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "field cannot be empty";
                  } else if (value.length < 5) {
                    return "must be at least 6 chars";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomePage()));
                  } else {
                    return null;
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("Submit"),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
