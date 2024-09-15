import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  String blogUrl;

  ArticleView({required this.blogUrl, Key? key}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isloading = true;
  late final WebViewController webViewController;

  @override
  void initState() {
    setState(() {
      _isloading = false;
    });
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.blogUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("K",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text("new's",
                style: TextStyle(
                    color: Colors.yellow, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _isloading == true
          ? CircularProgressIndicator()
          : WebViewWidget(
              controller: webViewController,
            ),
    );
  }
}
