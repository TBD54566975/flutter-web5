import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/web5/web5_service.dart';
import 'package:wallet_exp/src/shared/grid.dart';

@RoutePage()
class AppsPage extends HookConsumerWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final web5 = ref.watch(web5Provider);

    return Scaffold(
      appBar: AppBar(title: const Text('Apps')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: Grid.xs),
            Center(
              child: FilledButton(
                  onPressed: () async {
                    textController.clear();
                    final result = await web5.getMyDid();
                    textController.text = result ?? 'failed';
                  },
                  child: const Text('Get my DID')),
            ),
            const SizedBox(height: Grid.xs),
            Center(
              child: FilledButton(
                  onPressed: () async {
                    textController.clear();
                    final result = await web5.createARecord();
                    textController.text = result ?? 'failed';
                  },
                  child: const Text('Create a Record')),
            ),
            const SizedBox(height: Grid.xs),
            Center(
              child: FilledButton(
                  onPressed: () async {
                    textController.clear();
                    final result = await web5.getRecords();
                    textController.text = result ?? 'failed';
                  },
                  child: const Text('Get records')),
            ),
            const SizedBox(height: Grid.xs),
            Center(
              child: FilledButton(
                  onPressed: () async {
                    textController.clear();
                    final result = await web5.createDid();
                    textController.text = result ?? 'failed';
                  },
                  child: const Text('Create DID')),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  controller: textController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
