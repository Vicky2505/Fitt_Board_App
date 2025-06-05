import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerspectivePageView extends StatefulWidget {
  final List<Widget> children;

  const PerspectivePageView({super.key, required this.children});

  @override
  PerspectivePageViewState createState() => PerspectivePageViewState();
}

class PerspectivePageViewState extends State<PerspectivePageView> {
  late PageValueHolder holder;
  late PageController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    holder = PageValueHolder(1.0);
    _controller = PageController(initialPage: 1, viewportFraction: 0.53);
    _controller.addListener(() {
      holder.setValue(_controller.page ?? 1);
    });

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      int nextPage = _controller.page!.round() + 1;
      if (nextPage >= widget.children.length) {
        nextPage = 0;
      }
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PageValueHolder>.value(
      value: holder,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.children.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          double value = Provider.of<PageValueHolder>(context).value;
          double difference = (index - value);

          final Matrix4 pageViewMatrix = Matrix4.identity()
            ..setEntry(3, 3, 1 / 0.9)
            ..setEntry(1, 1, 1.3)
            ..setEntry(3, 0, 0.004 * -difference);

          return Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              Transform(
                transform: pageViewMatrix,
                alignment: FractionalOffset.center,
                child: widget.children[index],
              ),
              if (difference >= -1.0 && difference <= 1.0) ...[
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: 1 - difference.abs(),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class PageValueHolder extends ChangeNotifier {
  double _value = 0.0;

  PageValueHolder(double value) {
    _value = value;
  }

  get value => _value;

  void setValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }
}
