import 'package:company/create_contacts.dart';
import 'package:company/products.dart';
import 'package:company/services/quote_servies.dart';
import 'package:company/services/quranic_screen.dart';
import 'package:company/show_contacts.dart';
import 'package:company/user_account.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  final List<String> images = [
    'https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/934063/pexels-photo-934063.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/4158/apple-iphone-smartphone-desk.jpg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2783873/pexels-photo-2783873.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/272980/pexels-photo-272980.jpeg?auto=compress&cs=tinysrgb&w=600'
  ];
  CarouselController _controller = CarouselController();
  String reason = '';

  @override
  Widget build(BuildContext context) {

    void onPageChange(int index, CarouselPageChangedReason changeReason) {
      setState(() {
        reason = changeReason.toString();
      });
    }

    var _height = MediaQuery.of(context).size.height * 0.2;
    var _width = MediaQuery.of(context).size.width * 0.4;
    var _shading = Colors.grey.shade400;
    // var _vertical_box =
    return Scaffold(
      appBar: AppBar(

        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left:40.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding:  EdgeInsets.only(bottom: 17.0),
                         child:Container(

                           child: CarouselSlider.builder(
                             itemCount: images.length,
                             options: CarouselOptions(
                               autoPlayInterval: Duration(seconds: 2),
                               autoPlay: true,
                               aspectRatio: 2.0,
                               enlargeCenterPage: true,
                               onPageChanged: onPageChange,
                             ),
                             itemBuilder: (context, index, realIdx) {
                               return Container(
                                 decoration: BoxDecoration(
                                   boxShadow: [
                                     BoxShadow(
                                       color: _shading,
                                       spreadRadius: 2,
                                       blurRadius: 5,
                                       offset: const Offset(0, 5), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(10.0),
                                   child: Image.network(
                                     images[index],
                                     fit: BoxFit.cover,
                                     width: MediaQuery.of(context).size.width,
                                   ),
                                 ),
                               );
                             },
                           )

                         ),
                       ),
                       Row(
                         children: [
                           Stack(
                           children: [
                              InkWell(
                                onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => QuranicScreen()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(13)),

                                      boxShadow: [
                                        BoxShadow(
                                          color: _shading,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: const Offset(0, 5),
                                        )
                                      ]
                                  ),
                                                         width: _width,
                                                         height: _height,

                                                       ),
                              ),
                             Positioned(
                                 top: 25,
                                 left: 5,
                                 right: 5,
                                 bottom: 0,
                                 child: Column(
                                   children: [
                                     Container(
                                       height: 50,
                                       width: 50,
                                       child: InkWell(
                                         onTap: (){
                                           Navigator.push(context,MaterialPageRoute(builder: (context) => QuranicScreen()));

                                         },
                                         child: Image(
                                             image: AssetImage('assets/book.png')),
                                       ),
                                     ),
                                     SizedBox(height: 17,),
                                     Text('Holy Quran', style: TextStyle( fontWeight: FontWeight.w600),)
                                   ],
                                 )
                             )
                           ],),
                           SizedBox(width: 15,),
                           Stack(
                             children: [
                               InkWell(
                                 onTap: (){
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => QuotesServices()));

                                 },
                                 child: Container(
                                   width: _width,
                                   height: _height,
                                   decoration: BoxDecoration(
                                       color:Colors.white,
                                       borderRadius: BorderRadius.all(Radius.circular(13)),
                                         boxShadow: [
                                           BoxShadow(
                                             color: _shading,
                                             spreadRadius: 2,
                                             blurRadius: 5,
                                             offset: const Offset(0, 5),
                                           )
                                         ]
                                   ),
                                 ),
                               ),
                               Positioned(
                                   top: 25,
                                   left: 5,
                                   right: 5,
                                   bottom: 0,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 50,
                                         width: 50,
                                         child: InkWell(
                                           onTap: (){
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => QuotesServices()));

                                           },
                                           child: Image(
                                               image: AssetImage('assets/reach.png')),
                                         ),
                                       ),
                                       SizedBox(height: 17,),
                                       Text('Quotes', style: TextStyle( fontWeight: FontWeight.w600),)
                                     ],
                                   )
                               )
                             ],),
                         ],
                       ),
                       SizedBox(height: 15,),
                       Row(
                         children: [
                           Stack(
                             children: [
                               InkWell(
                                 onTap:(){
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => Products()));

                                 },
                                 child: Container(
                                   width: _width,
                                   height: _height,
                                   decoration: BoxDecoration(
                                       color:Colors.white,
                                       borderRadius: BorderRadius.all(Radius.circular(13)),
                                       boxShadow: [
                                         BoxShadow(
                                           color: _shading,
                                           spreadRadius: 2,
                                           blurRadius: 5,
                                           offset: const Offset(0, 5),
                                         )
                                       ]
                                   ),
                                 ),
                               ),
                               Positioned(
                                   top: 25,
                                   left: 5,
                                   right: 5,
                                   bottom: 0,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 45,
                                         width: 45,
                                         child: InkWell(
                                           onTap:(){
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => Products()));

                                           },
                                           child: Image(
                                               image: AssetImage('assets/trolley.png')),
                                         ),
                                       ),
                                       SizedBox(height: 17,),
                                       Text('Products', style: TextStyle( fontWeight: FontWeight.w600),)
                                     ],
                                   )
                               )
                             ],),
                           SizedBox(width: 15,),
                           Stack(
                             children: [
                               InkWell(
                                 onTap:(){
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => CreateContacts()));

                                 },
                                 child: Container(
                                   width: _width,
                                   height: _height,
                                   decoration: BoxDecoration(
                                       color:Colors.white,
                                       borderRadius: BorderRadius.all(Radius.circular(13)),
                                       boxShadow: [
                                         BoxShadow(
                                           color: _shading,
                                           spreadRadius: 2,
                                           blurRadius: 5,
                                           offset: const Offset(0, 5),
                                         )
                                       ]
                                   ),
                                 ),
                               ),
                               Positioned(
                                   top: 25,
                                   left: 5,
                                   right: 5,
                                   bottom: 0,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 42,
                                         width: 42,
                                         child: InkWell(
                                           onTap:(){
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => CreateContacts()));

                                           },
                                           child: Image(
                                               image: AssetImage('assets/plus.png')),
                                         ),
                                       ),
                                       SizedBox(height: 20,),
                                       Text('New Quote', style: TextStyle( fontWeight: FontWeight.w600),)
                                     ],
                                   )
                               )
                             ],),
                         ],
                       ),
                       SizedBox(height: 15,),
                       Row(
                         children: [
                           Stack(
                             children: [
                               InkWell(
                                 onTap:(){
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => ShowContacts()));
                                 },
                                 child: Container(
                                   width: _width,
                                   height: _height,
                                   decoration: BoxDecoration(
                                       color:Colors.white,
                                       borderRadius: BorderRadius.all(Radius.circular(13)),
                                       boxShadow: [
                                         BoxShadow(
                                           color: _shading,
                                           spreadRadius: 2,
                                           blurRadius: 5,
                                           offset: const Offset(0, 5),
                                         )
                                       ]
                                   ),
                                 ),
                               ),
                               Positioned(
                                   top: 25,
                                   left: 5,
                                   right: 5,
                                   bottom: 0,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 45,
                                         width: 45,
                                         child: InkWell(
                                           onTap:(){
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => ShowContacts()));
                                           },
                                           child: Image(
                                               image: AssetImage('assets/file.png')),
                                         ),
                                       ),
                                       SizedBox(height: 17,),
                                       Text('View Quuotes', style: TextStyle( fontWeight: FontWeight.w600),)
                                     ],
                                   )
                               )
                             ],),
                           SizedBox(width: 15,),
                           Stack(
                             children: [
                               InkWell(
                                 onTap:(){
                                   Navigator.push(context,MaterialPageRoute(builder: (context) => UserAccount()));

                                 },
                                 child: Container(
                                   width: _width,
                                   height: _height,
                                   decoration: BoxDecoration(
                                       color:Colors.white,
                                       borderRadius: BorderRadius.all(Radius.circular(13)),
                                       boxShadow: [
                                         BoxShadow(
                                           color: _shading,
                                           spreadRadius: 2,
                                           blurRadius: 5,
                                           offset: const Offset(0, 5),
                                         )
                                       ]
                                   ),
                                 ),
                               ),
                               Positioned(
                                   top: 25,
                                   left: 5,
                                   right: 5,
                                   bottom: 0,
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 45,
                                         width: 45,
                                         child: InkWell(
                                           onTap:(){
                                             Navigator.push(context,MaterialPageRoute(builder: (context) => UserAccount()));

                                           },
                                           child: Image(
                                               image: AssetImage('assets/user_two.png')),
                                         ),
                                       ),
                                       SizedBox(height: 17,),
                                       Text('Account', style: TextStyle( fontWeight: FontWeight.w600),)
                                     ],
                                   )
                               )
                             ],),
                         ],
                       ),
                     ],
                   ),
                 ),
               ],
             )
          ],
        ),
      ),
    );
  }
}
