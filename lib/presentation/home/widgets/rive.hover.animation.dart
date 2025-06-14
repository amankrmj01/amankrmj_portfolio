import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveHoverAnimation extends StatefulWidget {
  const RiveHoverAnimation({super.key});

  @override
  State<RiveHoverAnimation> createState() => _RiveHoverAnimationState();
}

class _RiveHoverAnimationState extends State<RiveHoverAnimation> {
  Artboard? _artboard;

  // ignore: unused_field
  StateMachineController? _controller;
  SMIInput<bool>? _enterInput;
  SMIInput<bool>? _exitInput;

  @override
  void initState() {
    super.initState();
    RiveFile.initialize().then((_) {
      rootBundle.load('assets/rive/responsive_core.riv').then((data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        final controller = StateMachineController.fromArtboard(
          artboard,
          'State Machine 1',
        );
        if (controller != null) {
          artboard.addController(controller);
          _enterInput = controller.findInput<bool>('enter');
          _exitInput = controller.findInput<bool>('exit');
        }
        setState(() => _artboard = artboard);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_artboard == null) return const SizedBox();
    return SizedBox(
      width: 600, // Set your desired width
      // height: 300, // Set your desired height
      child: MouseRegion(
        opaque: false,
        onEnter: (_) {
          if (_exitInput != null) {
            _exitInput!.value = false; // Always reset exit
          }
          if (_enterInput != null) _enterInput!.value = true;
        },
        onExit: (_) {
          if (_enterInput != null) {
            _enterInput!.value = false; // Always reset enter
          }
          if (_exitInput != null) _exitInput!.value = true;
        },
        child: Rive(artboard: _artboard!, fit: BoxFit.contain),
      ),
    );
  }
}
