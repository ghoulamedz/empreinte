import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class ReadmePage extends StatelessWidget {
  const ReadmePage({super.key});

  Future<String> loadMarkdown() async {
    return await rootBundle.loadString('README.md');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: FutureBuilder<String>(
        future: loadMarkdown(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Markdown(
            data: snapshot.data!,
            // imageBuilder: (uri, title, alt) {
            //   // If it's a local asset path
            //   if (uri.toString().startsWith('assets/')) {
            //     return Image.asset(uri.toString());
            //   }

            //   // fallback (network images)
            //   return Image.network(uri.toString());
            // },
          );
        },
      ),
    );
  }
}
