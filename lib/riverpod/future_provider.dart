import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(10, (index) => index);
});
