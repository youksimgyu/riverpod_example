import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/override_with_value/override_counter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final themeProvider = StateProvider<bool>((ref) {
  final theme = ref.read(sharedPreferencesProvider).getBool('theme') ?? false;
  return theme;
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    observers: const [
      // ProviderLogger(),
    ],
    overrides: [
      counterOverrideStateProvider.overrideWith((ref) => 1000),
      sharedPreferencesProvider.overrideWithValue(pref),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterOverrideStateProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('counter: $counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterOverrideStateProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
