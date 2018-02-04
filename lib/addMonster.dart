import 'package:flutter/material.dart';

class AddMonsterModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
//        padding: const EdgeInsets.all(0.0),
//        margin: const EdgeInsets.all(0.0),
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: _buttons()
          )
        )
//        child: new Padding(
//            padding: const EdgeInsets.all(10.0),
//            child: new Column(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: _buttons())
//        )
    );
  }

  List<Widget> _buttons() {
    return [
      new Row(
          children: [new Expanded(
              child: _styledButton('Add Monster class')
          )]
      ),
      new Row(
          children: [new Expanded(
              child: _styledButton('Start new battle')
          )]
      ),
    ];
  }

  Widget _styledButton(String text) {
    return new Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: new RaisedButton(
          onPressed: () {
            // Add button behavior here
          },
          child: new Text(
              text,
              style: new TextStyle(color: Colors.white)
          ),
          color: const Color.fromRGBO(30, 136, 229, 1.0),
          highlightColor: const Color.fromRGBO(21, 101, 192, 1.0),
          splashColor: const Color.fromRGBO(21, 101, 192, 1.0),
        )
    );
  }
}
