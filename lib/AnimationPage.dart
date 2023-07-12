import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimationPage extends HookWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    final opacityAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
      ),
    );

    final scaleAnimation = useAnimation(
      Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
      ),
    );

    useEffect(() {
      animationController.repeat(reverse: true);
      return animationController.dispose;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Page'),
      ),
      body: Center(
        child: Opacity(
          opacity: opacityAnimation,
          child: Transform.scale(
            scale: scaleAnimation,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}