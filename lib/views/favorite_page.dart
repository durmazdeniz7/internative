import 'package:flutter/material.dart';


class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites",style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,),
      body: GridView.builder(
                        itemCount: 20,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.3)),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2))),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Align(
                                    child: Icon(Icons.favorite_border),
                                    alignment: Alignment.topRight,
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 180,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    //   image: DecorationImage(
                                    // image: NetworkImage(blog.image),
                                    // fit: BoxFit.contain,
                                  )),
                                
                                Text("blog.title")
                              ],
                            ),
                          );
                        }),
    );
  }
}