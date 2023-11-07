
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';


class SliderTutorial extends StatefulWidget {
  const SliderTutorial({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SliderTutorialState createState() => _SliderTutorialState();
}

 class _SliderTutorialState extends State<SliderTutorial> {
  int age = 10;
  double dummy =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slider(
            label: "Select kg",
            value: age.toDouble(),
            onChanged: (value) {
              setState(() {
                age = value.toInt();
                dummy = age/2;
              });
            },
            min:0,
            max: 15,divisions: 20,
          ),
          Text(
            "Your Kg: $dummy",
            style: const TextStyle(
              fontSize: 32.0,
            ),
          ),
          Container(
            height: 200,
            child: Timeline.tileBuilder(
                scrollDirection: Axis.horizontal,
                builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.reverse,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text('$index'),
                  ),
                  itemCount: 5,
                )),
          ),
        ],
      ),
    );
  }
}