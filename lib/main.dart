import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Mini Form',
       theme: ThemeData(primarySwatch: Colors.blue),
      home: const MiniForm(),
      );
}

class MiniForm extends StatefulWidget {
const MiniForm({super.key});
@override
State<MiniForm> createState() => _MiniFormState();
}

class _MiniFormState extends State<MiniForm> {
  final nameController = TextEditingController();
  final messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? submittedName, submittedMessage;

  @override
  void dispose() {
    nameController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      setState(() {
        submittedName = nameController.text;
        submittedMessage = messageController.text;
      });
    }
  }

  @override
Widget build(BuildContext context) => Scaffold(
  backgroundColor: const Color.fromARGB(255, 207, 245, 249),
   appBar: AppBar(title: const Text('Mini Form')),
    body: Padding(
       padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Full Name'),
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: messageController,
                      decoration: const InputDecoration(labelText: 'Message'),
                      maxLines: 3,
                      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: submitForm, child: const Text('Submit')),
              const SizedBox(height: 16),
              if (submittedName != null && submittedMessage != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: $submittedName', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Message: $submittedMessage'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }