import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/layout/default_layout.dart';
import 'package:riverpod_study/riverpod/listen_provider.dart';

// statefulWidget에서 riverpod을 사용해야하는경우
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 10,
      vsync: this,
      // 초기값 설정 방법 - 단발성임으로 read를 사용해야함
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    // listenProvider의 값을 변경할경우 callback 실행됨
    ref.listen(listenProvider, (prev, next) {
      _tabController.animateTo(next);
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: List.generate(
          10,
          (index) => Column(
            children: [
              Text(index.toString()),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text('Prev'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 9 ? 9 : state + 1);
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
