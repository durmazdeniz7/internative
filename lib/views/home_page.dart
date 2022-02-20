
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_native/cubit/blog_cubit.dart';
import 'package:inter_native/cubit/cateogry_cubit.dart';
import 'package:inter_native/entities/blog.dart';
import 'package:inter_native/entities/category.dart';
import 'package:inter_native/views/article_detail.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    context.read<BlogCubit>().getBlog();
    context.read<CategoryCubit>().getCategory();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Home", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: BlocBuilder<CategoryCubit,List<Category>>(builder: (context, state) {
               if (state.isNotEmpty) {
                 return ListView.builder(
                    itemCount:state.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                     var category=state[index];
                      return GestureDetector(
                        onTap: (){
                          context.read<BlogCubit>().getBlogWithCagetoyId(category.id);
                          setState(() {
                            
                          });
                          
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 6, right: 8, top: 15),
                              width: 175,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        category.image,
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            Text(category.title)
                          ],
                        ),
                      );
                    },
                  );
               } else{
                 return const Center(child: CircularProgressIndicator(),);
               }
              },)
                
              ),
            
            const Text("Blog"),
            Expanded(
              flex: 6,
              child: BlocBuilder<BlogCubit,List<Blog>>(builder: (context, state) {
                if (state.isNotEmpty) {
                  return GridView.builder(
                        itemCount: state.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.3)),
                        itemBuilder: (context, index) {
                          var blog=state[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ArticleDetail(blog: blog)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
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
                                          image: DecorationImage(
                                        image: NetworkImage(blog.image),
                                        fit: BoxFit.fitHeight,)
                                      )),
                                    
                                    Text(blog.title)
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                }
                else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              })
                  
                
              ,
            )
          ],
        ));
  }
}
