import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {

  final String heading;
  final String text;
  final ValueChanged<String> onChange;
  final int maxLines;

  const InputWidget({Key? key, required this.heading, required this.text, required this.onChange, this.maxLines = 1}) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {

  late final TextEditingController controller;

  @override
  void initState(){
    super.initState();
    controller = TextEditingController(
        text: widget.text
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.heading,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )
          ),
          SizedBox(height:5),
          TextField(
            controller: controller,
            maxLines: widget.maxLines,
          ),
        ],
      ),
    );
  }
}
