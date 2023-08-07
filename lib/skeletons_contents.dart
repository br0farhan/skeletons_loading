import 'package:flutter/material.dart';
import 'package:skeletons_loading/widget/skeleton_widget.dart';

class SkeletonContents extends StatefulWidget {
  final String? title;

  const SkeletonContents({
    super.key,
    @required this.title,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SkeletonContentsState createState() => _SkeletonContentsState();
}

class _SkeletonContentsState extends State<SkeletonContents> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() {
      _loading = true;
    });

    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: loadData,
            ),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(12),
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) =>
              _loading ? buildSkeleton(context) : buildContent(),
        ),
      );

  Widget buildSkeleton(BuildContext context) => Row(
        children: <Widget>[
          const SkeletonWidget.rounded(
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SkeletonWidget.rounded(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 25,
              ),
              const SizedBox(height: 8),
              const SkeletonWidget.rounded(
                width: 60.0,
                height: 13.0,
              ),
            ],
          ),
        ],
      );

  Widget buildContent() => Row(
        children: <Widget>[
          SizedBox(
            child: Image.network(
              'https://logowik.com/content/uploads/images/flutter5786.jpg',
              width: 75.0,
              height: 75.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Hallo',
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Lets Study Together',
                style: TextStyle(fontSize: 13.0),
              ),
            ],
          ),
        ],
      );
}