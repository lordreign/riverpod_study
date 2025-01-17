import 'package:flutter_riverpod/flutter_riverpod.dart';

// family: provider를 생성할때 초기값이 필요한 경우 사용
// autoDispose
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(10, (index) => index * data);
});
