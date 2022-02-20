import 'package:flutter/material.dart';
import 'package:inter_native/entities/blog.dart';
import 'package:flutter_html/flutter_html.dart';


class ArticleDetail extends StatefulWidget {
  final Blog blog;
  const ArticleDetail({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 3,
            floating: true,
            snap: true,
            primary: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
                child: Image.network(
                  widget.blog.image,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Text(widget.blog.title),
Html(data: widget.blog.content)
          ]))
        ],
      ),
    );
  }
}
