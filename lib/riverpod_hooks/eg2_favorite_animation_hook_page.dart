import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteNotifier extends StateNotifier<bool> {
  FavoriteNotifier() : super(true);

  void toggleFavorite() => state = !state;
}

final favoriteStateNotifierProvider =
    StateNotifierProvider<FavoriteNotifier, bool>((ref) => FavoriteNotifier());

class AnimationHooksPage extends HookConsumerWidget {
  const AnimationHooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteStateNotifierProvider);

    final animationController = useState(
        useAnimationController(duration: const Duration(milliseconds: 300)));

    useEffect(() {
      if (isFavorite) {
        animationController.value.forward();
      } else {
        animationController.value.reverse();
      }
      return null;
    }, [isFavorite]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Button'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: animationController.value,
          child: IconButton(
            iconSize: 100,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              ref.read(favoriteStateNotifierProvider.notifier).toggleFavorite();
            },
          ),
        ),
      ),
    );
  }
}
