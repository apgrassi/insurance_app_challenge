import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguro Automóvel'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            'https://jsonplaceholder.typicode.com/',
          ),
        ),
      ),
    );
  }
}
