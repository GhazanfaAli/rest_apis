import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'show_contacts.dart';

class CreateContacts extends StatefulWidget {
  const CreateContacts({super.key});

  @override
  State<CreateContacts> createState() => _CreateContactsState();
}

class _CreateContactsState extends State<CreateContacts> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  Future<void> saveContact() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> nameList = sp.getStringList('name_list') ?? [];
    List<String> numberList = sp.getStringList('number_list') ?? [];

    final name = nameController.text.trim();
    final number = numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      nameList.add(name);
      numberList.add(number);

      sp.setStringList('name_list', nameList);
      sp.setStringList('number_list', numberList);
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowContacts()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Save a New Quote',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade700),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your quote here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.format_quote),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade700),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: saveContact,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Text(
                    'Save Quote',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
