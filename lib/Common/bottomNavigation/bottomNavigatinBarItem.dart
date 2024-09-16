import 'package:flutter/material.dart';

class NavigationIconButton extends StatelessWidget {
  final ImageProvider imageProvider;
  final int currentIndex;
  final int index;
  final BoxConstraints fatherConstrains;

  final Function(int) onPressed;

  NavigationIconButton({
    required this.currentIndex,
    required this.imageProvider,
    required this.onPressed,
    required this.index,
    required this.fatherConstrains,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeIn,
      opacity: currentIndex == index ? 1 : 0.5,
      child: IconButton(
        highlightColor: Colors.transparent,
        onPressed: () {
          onPressed(
            index,
          );
        },
        icon: ImageIcon(
          imageProvider,
          size: fatherConstrains.maxHeight * 45 / 100,
        ),
      ),
    );
  }
}
