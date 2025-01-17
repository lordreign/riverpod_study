import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose: 캐싱하지않고 매번 새로 호출됨
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 1));
  return List.generate(10, (index) => index);
});
