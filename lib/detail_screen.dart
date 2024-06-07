import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {

  final String name, image_url;

  DetailScreen({super.key, required this.name, required this.image_url});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {




  int _selectedSizeIndex = -1; // -1 indicates no selection initially

  Color _containerColor(int index) {
    return _selectedSizeIndex == index ? Colors.black : Colors.white;
  }

  Color _fontColor(int index) {
    return _selectedSizeIndex == index ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.image_url),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(205, 33, 146, 166),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Limited Edition',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            SizedBox(width: 10),
                            Text('40(725 reviews)'),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet. Quo totam consequatur quo possimus\n'
                              'maxime est dicta quia in odio veritatis.',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'Size',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.0, color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: _containerColor(0), // index for first container
                                ),
                                child: Text('50 ML', style: TextStyle(color: _fontColor(0))), // index for first container
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedSizeIndex = 0;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.0, color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: _containerColor(1), // index for second container
                                ),
                                child: Text('200 ML', style: TextStyle(color: _fontColor(1))), // index for second container
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedSizeIndex = 1;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.0, color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: _containerColor(2), // index for third container
                                ),
                                child: Text('250 ML', style: TextStyle(color: _fontColor(2))), // index for third container
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedSizeIndex = 2;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(

                              onTap: () => setState(() {
                                const link = "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjgubyYp7eGAxW3kYMHHUuUHnwYABAAGgJlZg&ase=2&gclid=CjwKCAjwx-CyBhAqEiwAeOcTdbVP9lDXo6bAokn9adcpcMilUL-j77ODa6dOSM6egHS-dTyegC0lOhoCyf4QAvD_BwE&ohost=www.google.com&cid=CAESVuD2sFswlYbR57skUzWy5CaD6irk4EvKod3HOhKVyLS7z6oLAU8-awSnPaK5dOkSCIidXnEn5qORUNueT1L_HfRX17c-9xE84BaBzQFBtesdqdNsxfxP&sig=AOD64_0I7g8qnVSpNqZnSctWfk4U5OD3Zg&q&nis=4&adurl&ved=2ahUKEwiTx7WYp7eGAxW71gIHHR2cCvEQ0Qx6BAgGEAE";
                                launchUrl(
                                    Uri.parse(link),
                                    mode: LaunchMode.inAppWebView

                                );

                              }),
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.height * 0.4,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.black,
                                ),
                                child: InkWell(
                                  onTap: () => setState(() {
                                    const link = "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjgubyYp7eGAxW3kYMHHUuUHnwYABAAGgJlZg&ase=2&gclid=CjwKCAjwx-CyBhAqEiwAeOcTdbVP9lDXo6bAokn9adcpcMilUL-j77ODa6dOSM6egHS-dTyegC0lOhoCyf4QAvD_BwE&ohost=www.google.com&cid=CAESVuD2sFswlYbR57skUzWy5CaD6irk4EvKod3HOhKVyLS7z6oLAU8-awSnPaK5dOkSCIidXnEn5qORUNueT1L_HfRX17c-9xE84BaBzQFBtesdqdNsxfxP&sig=AOD64_0I7g8qnVSpNqZnSctWfk4U5OD3Zg&q&nis=4&adurl&ved=2ahUKEwiTx7WYp7eGAxW71gIHHR2cCvEQ0Qx6BAgGEAE";
                                    launchUrl(
                                        Uri.parse(link),
                                        mode: LaunchMode.inAppWebView

                                    );

                                  }),
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
