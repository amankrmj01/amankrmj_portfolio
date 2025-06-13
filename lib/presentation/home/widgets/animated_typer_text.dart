import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTyperText extends StatelessWidget {
  final List<String> lines;
  final List<TextStyle?>? styles;
  final Duration speed;
  final double width;

  const AnimatedTyperText({
    super.key,
    required this.lines,
    this.styles,
    this.speed = const Duration(milliseconds: 60),
    this.width = 400,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: _AnimatedTyperTextAppend(
        lines: lines,
        styles: styles,
        speed: speed,
      ),
    );
  }
}

class _AnimatedTyperTextAppend extends StatefulWidget {
  final List<String> lines;
  final List<TextStyle?>? styles;
  final Duration speed;

  const _AnimatedTyperTextAppend({
    required this.lines,
    this.styles,
    this.speed = const Duration(milliseconds: 60),
  });

  @override
  State<_AnimatedTyperTextAppend> createState() =>
      _AnimatedTyperTextAppendState();
}

class _AnimatedTyperTextAppendState extends State<_AnimatedTyperTextAppend> {
  int _currentLine = 0;
  final List<bool> _finished = [];

  @override
  void initState() {
    super.initState();
    _finished.addAll(List.generate(widget.lines.length, (_) => false));
  }

  void _onLineFinished(int index) {
    if (index + 1 < widget.lines.length) {
      setState(() {
        _currentLine++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < widget.lines.length; i++)
          i < _currentLine
              ? Text(
                  widget.lines[i],
                  style: widget.styles != null && widget.styles!.length > i
                      ? widget.styles![i]
                      : Theme.of(context).textTheme.bodyMedium,
                  textHeightBehavior: const TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false,
                  ),
                  strutStyle: const StrutStyle(
                    forceStrutHeight: true,
                    height: 1,
                    leading: 0,
                  ),
                )
              : i == _currentLine
              ? AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TyperAnimatedText(
                      widget.lines[i],
                      textStyle:
                          widget.styles != null && widget.styles!.length > i
                          ? widget.styles![i]
                          : Theme.of(context).textTheme.bodyMedium,
                      speed: widget.speed,
                    ),
                  ],
                  totalRepeatCount: 1,
                  displayFullTextOnTap: true,
                  pause: Duration.zero,
                  onFinished: () => _onLineFinished(i),
                )
              : const SizedBox.shrink(),
      ],
    );
  }
}
