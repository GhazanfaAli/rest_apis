import 'dart:math';
import 'package:company/detail_screen.dart';
import 'package:company/models/ProductModel.dart';
import 'package:company/services/photos_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  PhotosServices photosServices = PhotosServices();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5), // Set translucent grey background for app bar
        elevation: 0,
        title: Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), // Set translucent background for search bar
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: FutureBuilder<ProductModel>(
                future: photosServices.get_model(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 3,
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: snapshot.data!.photos!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data!.photos![index].alt.toString();
                        if (_controller.text.isEmpty ||
                            name.toLowerCase().contains(_controller.text.toLowerCase())) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      name: snapshot.data!.photos![index].alt.toString(),
                                      image_url: snapshot.data!.photos![index].src!.large.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5), // Add a translucent shadow
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Card(
                                  color: Colors.white.withOpacity(0.7), // Set card background to translucent
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(snapshot.data!.photos![index].src!.medium.toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data!.photos![index].alt.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star, color: Colors.yellow, size: 18),
                                            Icon(Icons.star, color: Colors.yellow, size: 18),
                                            Icon(Icons.star, color: Colors.yellow, size: 18),
                                            Icon(Icons.star, color: Colors.yellow, size: 18),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 3,
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: 6, // Adjust the number of shimmer items as needed
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200], // Make the background color more visible
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5), // Add a translucent shadow
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(color: Colors.grey[300]!), // Add a border to make it stand out
                              ),
                              child: Card(
                                color: Colors.grey[200]?.withOpacity(0.7), // Set card background to a more visible color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200], // Set a more visible background color for shimmer effect
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        color: Colors.grey[200], // Set a more visible background color for shimmer effect
                                        height: 12, // Adjust height as needed
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star, color: Colors.grey[300], size: 18),
                                          Icon(Icons.star, color: Colors.grey[300], size: 18),
                                          Icon(Icons.star, color: Colors.grey[300], size: 18),
                                          Icon(Icons.star, color: Colors.grey[300], size: 18),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );




                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
