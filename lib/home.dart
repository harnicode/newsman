import 'package:flutter/material.dart';
import 'package:newsman_posts_repository/newsman_posts_repository.dart';

class Home extends StatefulWidget {
  final PostRepository blogPostRepo;

  const Home({super.key, required this.blogPostRepo});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PostModel> blogPosts = [];

  @override
  void initState() {
    retrievePosts();
    super.initState();
  }

  void retrievePosts() {
    widget.blogPostRepo.getAllPosts().then((value) {
      setState(() {
        blogPosts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BlogPost Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        // color: Color(0xF1F0F3),
        color: const Color.fromRGBO(212, 211, 215, 1),
        child: ListView.builder(
          itemCount: blogPosts.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              height: 200,
              width: 20,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(180, 179, 182, 1),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 140,
                    height: 200,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        image: NetworkImage(
                          blogPosts[index].image.toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          blogPosts[index].title.toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Published : ${blogPosts[index].metadata.publishedAt.toString()}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
