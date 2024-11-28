import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'share_w_r.g.dart';

@riverpod
class IsRed extends _$IsRed {
  @override
  bool build() => false;

  void increment() => state = !state;
}
