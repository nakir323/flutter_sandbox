import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final listProvider = StateProvider((_) => [1, 2, 3]);

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyText extends HookWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('test');
  }
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider).state;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const MyText(),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(list[index].toString()),
                ),
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: list.length),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              ref.read(listProvider).state = [...list, list.length + 1];
            }),
      ),
    );
  }
}
