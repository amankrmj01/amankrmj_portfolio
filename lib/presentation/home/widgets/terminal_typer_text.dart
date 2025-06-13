import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TerminalTyperText extends StatefulWidget {
  final List<TerminalLine> lines;
  final TextStyle? style;
  final Duration speed;
  final double width;
  final double lineSpacing;

  const TerminalTyperText({
    super.key,
    required this.lines,
    this.style,
    this.speed = const Duration(milliseconds: 60),
    this.width = 400,
    this.lineSpacing = 2.0,
  });

  @override
  State<TerminalTyperText> createState() => _TerminalTyperTextState();
}

class _TerminalTyperTextState extends State<TerminalTyperText> {
  int _currentLine = 0;
  final List<bool> _lineFinished = [];

  @override
  void initState() {
    super.initState();
    _lineFinished.addAll(List.generate(widget.lines.length, (_) => false));
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
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i <= _currentLine && i < widget.lines.length; i++)
            i == _currentLine
                ? AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText(
                        widget.lines[i].text,
                        textStyle: widget.lines[i].style ?? widget.style,
                        speed: widget.speed,
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                    pause: Duration.zero,
                    onFinished: () => _onLineFinished(i),
                  )
                : Text(
                    widget.lines[i].text,
                    style: widget.lines[i].style ?? widget.style,
                  ),
          if (_currentLine >= widget.lines.length) const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class TerminalLine {
  final String text;
  final TextStyle? style;

  const TerminalLine(this.text, {this.style});
}

// Helper for easy usage
List<TerminalLine> terminalLines(List<TerminalLine> lines) => lines;
