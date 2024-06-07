import 'package:company/services/arbic_holy_Quran.dart';
import 'package:company/services/holy_quran.dart';
import 'package:flutter/material.dart';



class QuranicScreen extends StatelessWidget {
  QuranicScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var _height = MediaQuery.of(context).size.height * 0.2;
    var _width = MediaQuery.of(context).size.width * 0.4;
    var _shading = Colors.grey.shade400;

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose To Read', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(

        children: [
          Expanded(
            child:
            Padding(
              padding: const EdgeInsets.only(left:40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap:(){

                                Navigator.push(context,MaterialPageRoute(builder: (context) => ArbicHolyQuran()));

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
                                      onTap:(){

                                        Navigator.push(context,MaterialPageRoute(builder: (context) => ArbicHolyQuran()));

                                      },
                                      child: Image(
                                          image: AssetImage('assets/quran.png')),
                                    ),
                                  ),
                                  SizedBox(height: 17,),
                                  Text('Arbic', style: TextStyle( fontWeight: FontWeight.w600),)
                                ],
                              )
                          )
                        ],),
                      SizedBox(width: 15,),
                      Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => HolyQuran()));
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
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => HolyQuran()));
                                      },
                                      child: Image(
                                          image: AssetImage('assets/eng.png')),
                                    ),
                                  ),
                                  SizedBox(height: 17,),
                                  Text('English', style: TextStyle( fontWeight: FontWeight.w600),)
                                ],
                              )
                          )
                        ],),
                    ],
                  ),

                ],
              ),
            ),



          )
        ],
      ),
    );
  }
}
