import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countProvider = StateProvider((_) => 0);

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(countProvider).state;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(value.toString()),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => ref.watch(countProvider).state++),
      ),
    );
  }
}
