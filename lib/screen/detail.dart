import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsapp/viewmodel/viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  ViewModel article;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  DetailScreen(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: WebView(
        initialUrl: article.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
