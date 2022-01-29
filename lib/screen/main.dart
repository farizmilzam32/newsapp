import 'package:flutter/material.dart';
import 'package:newsapp/constant/constant.dart';
import 'package:newsapp/viewmodel/listviewmodel.dart';
import 'package:newsapp/widget/newsgrid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listviewmodel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('News App'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 15, top: 15),
              child: Center(
                child: Text(
                  Constants.nameheadline,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: NewsGrid(articles: listviewmodel.articles),
            ),
          ],
        ),
      ),
    );
  }
}
