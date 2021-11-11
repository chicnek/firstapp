import 'package:flutter/material.dart';

class AutofillPage extends StatefulWidget {
  const AutofillPage({Key? key}) : super(key: key);

  @override
  _AutofillPageState createState() => _AutofillPageState();
}

class _AutofillPageState extends State<AutofillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autofill"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AutofillGroup(
              child: Column(
                children: [
                  ...[
                    const Text("This sample autofill."),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Lee",
                        labelText: "Last name",
                      ),
                      autofillHints: [AutofillHints.givenName],
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Simon",
                        labelText: "First name",
                      ),
                      autofillHints: [AutofillHints.familyName],
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "simon.lee@gmal.com",
                        labelText: "Email",
                      ),
                      autofillHints: [AutofillHints.email],
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "(123) 456-7890",
                        labelText: "Telephone",
                      ),
                      autofillHints: [AutofillHints.telephoneNumber],
                    ),
                    const TextField(
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "123 4th Ave",
                        labelText: "Street Address",
                      ),
                      autofillHints: [AutofillHints.streetAddressLine1],
                    ),
                    const TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: "12345",
                        labelText: "Postal code",
                      ),
                      autofillHints: [AutofillHints.postalCode],
                    ),
                  ].expand(
                    (element) => [
                      element,
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
