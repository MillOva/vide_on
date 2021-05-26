import 'package:flutter/material.dart';

class SourceCard extends StatefulWidget {
  final String source;
  final Color color;
  SourceCard({@required this.source, @required this.color});
  @override
  _SourceCardState createState() => _SourceCardState();
}

class _SourceCardState extends State<SourceCard> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double coefW = _width / 414;
    return Container(
      height: 98,
      width: 174 * coefW,
      padding: EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 98,
            width:  174 * coefW,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: widget.color,//charcoalGrey(),
            //image: DecorationImage(image: AssetImage(widget.source),fit: BoxFit.fill)
            ),
            child: Image(image: AssetImage(widget.source),fit: BoxFit.fill,),
          ),
        ],
      ),
    );
  }
}
