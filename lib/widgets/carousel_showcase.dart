import 'package:fitt_board/widgets/perspective_pageview.dart';
import 'package:flutter/material.dart';

class CarouselShowcase extends StatelessWidget {
  const CarouselShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return PerspectivePageView(
      children: List.generate(3, (index) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 340,
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('images/sample${index + 1}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
