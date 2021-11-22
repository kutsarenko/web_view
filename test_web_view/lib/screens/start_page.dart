import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  String? htmlData;

  @override
  void initState() {
    htmlData = """
 <iframe width="100%" height="100%" src="https://www.addictinggames.com/embed/html5-games/22860" scrolling="no"></iframe>
  """;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 50.0,
                    ),
                    child: Text(
                      'Choose horizontal orientation and press on play',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) {
                            return SafeArea(
                              child: WebView(
                                initialUrl: Uri.dataFromString(htmlData!, mimeType: 'text/html').toString(),
                                javascriptMode: JavascriptMode.unrestricted,
                                onWebViewCreated: (WebViewController webViewController) {
                                  _controller.complete(webViewController);
                                },
                                gestureNavigationEnabled: true,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const SizedBox(
                      height: 55,
                      width: 55,
                      child: Icon(
                        Icons.play_arrow,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'KidsKey',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
