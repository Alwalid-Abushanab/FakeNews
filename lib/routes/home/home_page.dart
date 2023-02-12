import 'package:flutter/material.dart';

import '../../displayNews/news_view.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("FakeNews"),
      ),
      body:NewsView(),
    );
  }

}