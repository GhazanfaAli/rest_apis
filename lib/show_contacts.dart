import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowContacts extends StatefulWidget {
  const ShowContacts({super.key});

  @override
  State<ShowContacts> createState() => _ShowContactsState();
}

class _ShowContactsState extends State<ShowContacts> {
  List<String> _names = [];
  List<String> _numbers = [];

  Future<void> loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    List<String> names = sp.getStringList('name_list') ?? [];
    List<String> numbers = sp.getStringList('number_list') ?? [];

    setState(() {
      _names = names;
      _numbers = numbers;
    });
  }

  Future<void> deleteContact(int index) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _names.removeAt(index);
    _numbers.removeAt(index);

    await sp.setStringList('name_list', _names);
    await sp.setStringList('number_list', _numbers);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Quotes'),
        backgroundColor: Colors.blue.shade600,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            itemCount: _names.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.format_quote, color: Colors.blue.shade600),
                    title: Text(
                      _names[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _numbers[index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_rounded, color: Colors.red),
                      onPressed: () {
                        deleteContact(index);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
