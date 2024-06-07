import 'dart:developer';

import 'package:company/create_contacts.dart';
import 'package:company/main_menu.dart';
import 'package:company/products.dart';
import 'package:company/service.dart';
import 'package:company/show_contacts.dart';
import 'package:company/user_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override




  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
   /// var screenWidth = MediaQuery.of(context).size.width;



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('2nd Bench', style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.blue,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.lightBlue
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/1438081/pexels-photo-1438081.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    ),

                    accountName: Text('Sabdar Hussain'),
                    accountEmail: Text('My234@gmail.com')
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => MainMenu()
                        )
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => Products()
                          )
                      );
                    },
                  child: ListTile(
                    leading: const Icon(Icons.shopping_cart_rounded),
                    title: Text('Product'),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Services())
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.home_repair_service_sharp),
                    title: Text('Services'),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => UserAccount())
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: Text('Accounts'),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ShowContacts())
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.contact_mail_outlined),
                    title: Text('Quotes'),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CreateContacts())
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.add),
                    title: Text('New Quote'),
                  ),
                ),

              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight * 0.9,
              child: Column(
                children: [
                  Expanded(

                      child: Stack(
                        children: [

                          Container(
                            child: Image(image:
                            AssetImage('assets/man.jpg'),
                            ),
                          ),

                          Positioned(
                            top: 263,
                            bottom: 0,
                            left: 0,
                            right: 0,

                            child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )
                              ),
                              child: Column(
                                children: [
                                  Text('\nCreate  a  Task\n   and Assign',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    'We make it easier for you to\n \t\t\t\t\tcommunicate with us',
                                    style: TextStyle(
                                        fontSize: 16),
                                  ),

                                  SizedBox(
                                    height: screenHeight * 0.06,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) => MainMenu()
                                              )
                                          );
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 250,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.orange
                                          ),
                                          child: Text(
                                            'Get Started',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18, fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          )


                        ],
                      )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}