import 'package:first_app/details.dart';
import 'package:first_app/states/providers.dart';
import 'package:first_app/widgets/navbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavbarWidget(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final postList = ref.watch(postListProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: postList.value?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              postList.when(
                data: (data) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      id: data[index].userId,
                    ),
                  ),
                ),
                error: (error, stack) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              );
            },
            child: Column(
              children: [
                postList.when(
                  data: (data) => Text("User ID: ${data[index].userId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  error: (error, stack) => Text(error.toString()),
                  loading: () => const CircularProgressIndicator(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PostSearchBar extends ConsumerStatefulWidget {
  const PostSearchBar({super.key});

  @override
  ConsumerState<PostSearchBar> createState() => _PostSearchBarState();
}

class _PostSearchBarState extends ConsumerState<PostSearchBar> {
  @override
  Widget build(BuildContext context) {
    final postList = ref.watch(postListProvider);
    return Scaffold(
      body: TextField(
        decoration: const InputDecoration(
          hintText: 'Enter post ID',
          contentPadding: EdgeInsets.all(16),
        ),
        keyboardType: TextInputType.number,
        onSubmitted: (id) {
          if (id.isNotEmpty) {
            postList.when(
              data: (data) {
                final index = int.tryParse(id);
                if (index != null && index < data.length) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        id: data[index].userId,
                      ),
                    ),
                  );
                }
              },
              error: (error, stack) => null,
              loading: () => null,
            );
          }
        },
      ),
    );
  }
}

class SettingsMenu extends ConsumerStatefulWidget {
  const SettingsMenu({super.key});

  @override
  ConsumerState<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends ConsumerState<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Switch(
            value: true,
            onChanged: (value) {
              value = !value;
            },
          ),
        ],
      ),
    );
  }
}

class WidgetTestMenu extends ConsumerStatefulWidget {
  const WidgetTestMenu({super.key});

  @override
  ConsumerState<WidgetTestMenu> createState() => _WidgetTestMenuState();
}

class _WidgetTestMenuState extends ConsumerState<WidgetTestMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widget Test Menu')),
      body: Column(
        children: [
          Text('Widget Test Menu'),
          Row(
            children: [
              //Flexible içerisinde width verince expanded boşa düşen alanı kaplamıyor.
              //Flexible yerine SizedBox kullanılırsa expanded boşa düşen alanı kaplar.
              Flexible(
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Expanded(
                flex: 1,
                child: Container(height: 100, color: Colors.blue),
              ),
            ],
          ),
          //SizedBox(height: 100,),
        ],
      ),
    );
  }
}
