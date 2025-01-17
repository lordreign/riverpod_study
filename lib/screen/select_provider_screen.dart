import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/layout/default_layout.dart';
import 'package:riverpod_study/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택적인 값만 가져오기위해서
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    // hasBought만 변경이됬을때 실행됨
    ref.listen(selectProvider.select((value) => value.hasBought), (prev, next) {
      print('next: $next');
    });
    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isSpicy: $state'),
            // Text('name: ${state.name}'),
            // Text('hasBought: ${state.hasBought.toString()}'),
            // Text('isSpicy: ${state.isSpicy.toString()}'),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: Text('toggle hasBought'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: Text('toggle Spicy'),
            ),
          ],
        ),
      ),
    );
  }
}
