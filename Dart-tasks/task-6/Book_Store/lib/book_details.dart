import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:book_store_main/recommendation_books.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({Key? key, required this.path, required this.title})
      : super(key: key);

  final String path;
  final String title;

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool _showAnimation = true;

  @override
  void initState() {
    super.initState();
    // Delay showing the BookDetails widget
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showAnimation = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: _showAnimation
          ? Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
              key: Key('lottie_animation'),
            )
          : Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: const [
                  Icon(
                    Icons.more_vert,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          bottom: 40,
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage(widget.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Book by Carl Sagan | 2h 30m',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 25,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 25,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 25,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 25,
                              ),
                              Icon(
                                Icons.star_border,
                                color: Colors.orange,
                                size: 25,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buttonContainer(Text(
                                'Free',
                                style: TextStyle(color: Colors.grey[350]),
                              )),
                              buttonContainer(Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.grey[350],
                              )),
                              buttonContainer(Icon(
                                Icons.share,
                                color: Colors.grey[350],
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          heading('Book Information'),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Cosmos is one of the best selling science books of all time. In clear-eyed prose, Sagan reveals a jewel- like blue world Inhabited by a life form that is just",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          heading('About Author'),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Cosmos is one of the best selling science books of all time. In clear-eyed prose, Sagan reveals a jewel- like blue world Inhabited by a life form that is just",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "User review",
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                //Image,
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Colors.blue,
                                  child: Image.asset(
                                      "assets/images/no_profile.png"),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gemechis",
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    const Text("This is Amazing Book"),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Oct 2023",
                                      style: TextStyle(color: Colors.grey[500]),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Related Books",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 300,
                            child: Recommendation(
                              bookTitle: ['book-1', 'book-2', 'book-3'],
                              images: [
                                'assets/images/cover1.webp',
                                'assets/images/cover2.webp',
                                'assets/images/cover3.webp',
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue),
                            ),
                            onPressed: null,
                            child: Text(
                              "Start Reading",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

Widget buttonContainer(Widget content) {
  return Container(
    width: 70,
    height: 40,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Center(child: content),
  );
}

Widget heading(String inset) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 5,
        color: Colors.orange,
      ),
      const SizedBox(width: 10),
      Text(
        inset,
        style: const TextStyle(fontSize: 20),
      )
    ],
  );
}
