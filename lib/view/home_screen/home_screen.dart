import 'package:flutter/material.dart';
import 'package:interview_task/view/news_card/news_card.dart';
import 'package:interview_task/view/news_details_screen/news_details.dart';
import 'package:interview_task/view/other_cards/other_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;

        double next = current + 340;

        if (next >= maxScroll) {
          next = 0;
        }

        _scrollController.animateTo(
          next,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Latest News",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromRGBO(0, 0, 0, 1)),
            ),
            const Spacer(),
            Row(
              children: const [
                Text(
                  "See All",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color.fromRGBO(0, 128, 255, 1)),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(0, 128, 255, 1),
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 260,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetails(),
                            ),
                          );
                        },
                        child: NewsCard(
                          imagepath: "assets/images/cardimage1.png",
                          name: "by Ryan Browne",
                          headlines:
                              "Crypto investors should be \nprepared to lose all their money, \nBOE governor says",
                          content:
                              "“I’m going to say this very bluntly again,” he added. “Buy them \nonly if you’re prepared to lose all your money.”",
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetails(),
                    ),
                  );
                },
                child: LupusNewsCard(
                  imagepath: "assets/images/othercardimage1.jpg",
                  headline: "5 things to know about the 'conundrum' of lupus",
                  name: "Matt Villano",
                  date: "Sunday, 9 May 2021",
                ),
              ),
              LupusNewsCard(
                imagepath: "assets/images/othercardimage2.jpg",
                headline: "5 things to know about the 'conundrum' of lupus",
                name: "Matt Villano",
                date: "Sunday, 9 May 2021",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
