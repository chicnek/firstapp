import 'package:firstapp/pages/samples/form/autofill_page.dart';
import 'package:firstapp/pages/samples/form/formz_page.dart';
import 'package:firstapp/pages/samples/form/validation_page.dart';
import 'package:firstapp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form samples "),
      ),
      body: ListView(
        children: [
          ListTileRoute(
            title: "Autofill",
            page: AutofillPage(),
          ),
          ListTileRoute(
            title: "Validation",
            page: ValidationPage(),
          ),
          ListTileRoute(
            title: "Formz",
            page: FormzPage(),
          ),
        ],
      ),
    );
  }
}
