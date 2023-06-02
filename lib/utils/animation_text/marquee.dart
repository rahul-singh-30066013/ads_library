import 'dart:async';

import 'package:flutter/material.dart';

const double size_15 = 16.0;
const int MAX_COUNT = 2;

class Marquee extends StatefulWidget {
  final List<String> textList;
  final List<TextSpan> textSpanList;
  final double fontSize;
  final Color textColor;
  final Duration scrollDuration;
  final Duration stopDuration;
  final bool tapToNext;
  final bool repeatForever;
  final int repeatMaxCounter;
  final MarqueeController controller;

  const Marquee({
    Key? key,
    this.textList = const [],
    this.textSpanList = const [],
    this.fontSize = size_15,
    this.textColor = Colors.black,
    this.scrollDuration = const Duration(seconds: 1),
    this.stopDuration = const Duration(seconds: 3),
    this.tapToNext = false,
    this.repeatForever = true,
    this.repeatMaxCounter = MAX_COUNT,
    required this.controller,
  }) : super(key: key);

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  double percent = 0;
  int current = 0;
  double percentValue = 0.5;
  int counter = 0;

  List<String> get textList => widget.textList;
  List<TextSpan> get textSpanList => widget.textSpanList;
  Timer? stopTimer;
  late AnimationController animationController;
  MarqueeController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    stopTimer = Timer.periodic(
      widget.stopDuration + widget.scrollDuration,
      (timer) => {
        if (current == textList.length - 1) counter++,
        if (widget.repeatMaxCounter == counter) timer.cancel(),
        if (widget.repeatForever) next(),
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    stopTimer?.cancel();
    super.dispose();
  }

  void next() {
    void listener() {
      final value = animationController.value;
      setState(() {
        percent = value;
        _refreshControllerValue();
      });
    }

    animationController.addListener(listener);
    animationController
        .animateTo(1, duration: widget.scrollDuration * (1 - percent))
        .then((t) {
      animationController
        ..removeListener(listener)
        ..value = 0.0;
      setState(() {
        percent = 0.0;
        current = nextPosition;
        _refreshControllerValue();
      });
    });
  }

  void _refreshControllerValue() {
    controller.position = current;
    if (percent > percentValue) {
      controller.position = nextPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(
      !(textList.isNotEmpty && textSpanList.isNotEmpty),
      'textList and textSpanList cannot have elements at the same time.',
    );

    if ((textList.isEmpty) && (textSpanList.isEmpty)) {
      return Container();
    }

    if (textList.length == 1) {
      return SizedBox(
        child: Text(
          textList.first,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: widget.textColor,
          ),
        ),
      );
    }

    if (textSpanList.length == 1) {
      return Text.rich(
        textSpanList.first,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor,
        ),
      );
    }

    Widget _widget = ClipRect(
      child: CustomPaint(
        painter: _MarqueePainter(
          widget.textList,
          textSpanList: textSpanList,
          fontSize: widget.fontSize,
          textColor: widget.textColor,
          verticalSpace: 0,
          percent: percent,
          current: current,
        ),
        child: Container(),
      ),
    );

    if (widget.tapToNext) {
      _widget = GestureDetector(
        onTap: next,
        child: _widget,
      );
    }

    return _widget;
  }

  int get nextPosition {
    final List list = textSpanList.isNotEmpty ? textSpanList : textList;
    var next = current + 1;
    if (next >= list.length) {
      next = 0;
    }
    return next;
  }
}

class _MarqueePainter extends CustomPainter {
  List<String> textList;
  List<TextSpan> textSpanList;
  double verticalSpace;
  double fontSize;
  Color textColor;

  int current = 0;

  double percent = 0;

  _MarqueePainter(
    this.textList, {
    required this.textSpanList,
    required this.fontSize,
    required this.textColor,
    required this.verticalSpace,
    this.percent = 0.0,
    required this.current,
  });

  TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.left,
  );

  @override
  void paint(Canvas canvas, Size size) {
    _paintCurrent(size, canvas);
    _paintNext(size, canvas);
  }

  TextSpan getTextSpan(int position) {
    if (textSpanList.isNotEmpty) {
      return textSpanList[position];
    }

    final String text = textList[position];
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        // fontWeight: FontWeight.w500,
      ),
    );
  }

  void _paintCurrent(Size size, Canvas canvas) {
    textPainter
      ..text = getTextSpan(current)
      ..textAlign = TextAlign.left
      ..maxLines = 1
      ..ellipsis = '...'
      ..layout(maxWidth: size.width)
      ..paint(canvas, _getTextOffset(textPainter, size));
  }

  void _paintNext(Size size, Canvas canvas) {
    textPainter
      ..text = getTextSpan(nextPosition)
      ..textAlign = TextAlign.left
      ..maxLines = 1
      ..ellipsis = '...'
      ..layout(maxWidth: size.width)
      ..paint(canvas, _getTextOffset(textPainter, size, isNext: true));
  }

  Offset _getTextOffset(
    TextPainter textPainter,
    Size size, {
    bool isNext = false,
  }) {
    var width = textPainter.width;
    if (width >= size.width) {
      width = size.width;
    }
    final height = textPainter.height;
    var dyy = size.height / 2 - height / 2 - size.height * percent;
    if (isNext) {
      dyy = dyy + size.height;
    }
    return Offset(0, dyy);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  int get nextPosition {
    final list = textSpanList.isNotEmpty ? textSpanList : textList;
    var next = current + 1;
    if (next >= list.length) {
      next = 0;
    }
    return next;
  }
}

class MarqueeController {
  int? position;
}
