import 'package:advanced_bloc/demo.dart';
import 'package:advanced_bloc/features/welcome/bloc/welcome_bloc.dart';
import 'package:advanced_bloc/features/welcome/widgets/welcome_screen_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeInitial>(
        builder: (context, state) {
          return Stack(
            alignment: FractionalOffset.bottomCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.pageIndex = index;
                  BlocProvider.of<WelcomeBloc>(context)
                      .add(WelcomePageChangedEvent());
                },
                children: [
                  WelcomeScreenWidget(
                    pageController: pageController,
                    imageUrl: "assets/images/img-1.jpg",
                    title: "Always Facinated Learning",
                    subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque molestie tortor a dignissim lobortis.",
                    buttonTitle: "Next",
                    pageIndex: 0,
                    context: context,
                  ),
                  WelcomeScreenWidget(
                    pageController: pageController,
                    imageUrl: "assets/images/img-2.jpg",
                    title: "Continuous facinated learnig",
                    subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque molestie tortor a dignissim lobortis.",
                    buttonTitle: "Next",
                    pageIndex: 1,
                    context: context,
                  ),
                  WelcomeScreenWidget(
                    pageController: pageController,
                    imageUrl: "assets/images/img-3.jpg",
                    title: "Lastly, Enjoy facinated learnig",
                    subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque molestie tortor a dignissim lobortis.",
                    buttonTitle: "Start",
                    pageIndex: 2,
                    context: context,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.pageIndex,
                  decorator: DotsDecorator(
                    activeColor: Colors.teal,
                    activeSize: const Size(20, 10),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    right: MediaQuery.of(context).size.width * 0.01),
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DemoPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "skip",
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
