import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<String> items = List<String>.generate(10, (i) => "Item $i");
  String? selectedItem;
  final Map<String, GlobalKey> itemKeys = {};
  late AnimationController _iconController;
  final Map<String, AnimationController> iconControllers = {};

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _iconController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    items.forEach((item) {
      iconControllers[item] = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              itemKeys[item] = GlobalKey();
              return ListTile(
                key: itemKeys[item],
                title: Text(item),
                trailing: IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.event_add,
                    progress: iconControllers[item]!,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedItem = item;
                    });
                    _controller.reset();
                    _controller.forward();
                    iconControllers[item]!.forward();
                  },
                ),
              );
            },
          ),
          if (selectedItem != null)
            AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(0.0,
                      _animation.value * MediaQuery.of(context).size.height),
                  child: Transform.rotate(
                    origin: const Offset(50, 50),
                    angle: _animation.value * 2.0 * pi,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                                255, 121, 230, 255), // Move the color here
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(selectedItem!),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
