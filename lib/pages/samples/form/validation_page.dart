import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;
import 'package:get/get.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({Key? key}) : super(key: key);

  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final _formKey = GlobalKey<FormState>();

  String? adjective;
  String? noun;
  bool? agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validation"),
        actions: [
          IconButton(
            onPressed: () {
              var valid = _formKey.currentState!.validate();

              if (!valid) {
                return;
              }

              Get.dialog(
                AlertDialog(
                  title: const Text("Your story"),
                  content: Text("The $adjective developer saw a $noun"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();

                        Future.microtask(() => Get.back());
                      },
                      child: const Text("OK"),
                    )
                  ],
                ),
                // barrierDismissible: false,
              );
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ...[
                const Text("this is global key form validation."),
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please entry an email.";
                    }
                    if (english_words.adjectives.contains(value)) {
                      return null;
                    }
                    return "Not a valid adjective.";
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: "e.g quick, beautiful",
                    labelText: "Enter an adjective",
                  ),
                  onChanged: (value) {
                    setState(() {
                      adjective = value;
                    });
                  },
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please entry an noun.";
                    }

                    if (english_words.nouns.contains(value)) {
                      return null;
                    }

                    return "Not a valid noun.";
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: "i.e. a person, place or thing",
                    labelText: "Enter an noun",
                  ),
                  onChanged: (value) {
                    setState(() {
                      noun = value;
                    });
                  },
                ),
                FormField<bool>(
                  initialValue: false,
                  validator: (value) {
                    if (value == false) {
                      return "You must agree to the terms of service.";
                    }
                  },
                  builder: (formFieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: agreedToTerms,
                              onChanged: (value) {
                                formFieldState.didChange(value);
                                setState(() {
                                  agreedToTerms = value;
                                });
                              },
                            ),
                            Text(
                              "I agree to the terms of service.",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        if (!formFieldState.isValid)
                          Text(
                            formFieldState.errorText ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Theme.of(context).errorColor),
                          ),
                      ],
                    );
                  },
                ),
              ].expand((element) => [
                    element,
                    const SizedBox(height: 20),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
