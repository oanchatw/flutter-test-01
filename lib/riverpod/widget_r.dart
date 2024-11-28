import 'package:abc12/riverpod/share_w_r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReiverPodText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isRed ? Colors.red : Colors.indigo,
      ),
      onPressed: ref.read(isRedProvider.notifier).increment,
      child: const Text('Change my Color!'),
    );
  }
}
