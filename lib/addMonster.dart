import 'package:flutter/material.dart';

class AddMonsterModalSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: _buttons(context)
          )
        )
    );
  }

  List<Widget> _buttons(BuildContext context) {
    return [
      new Row(
          children: [new Expanded(
              child: _styledButton(
                'Add Monster class',
                buttonPressed: () {
                  Navigator.of(context).pop();
                  _pushNewPage(context);
                }
              )
          )]
      ),
      new Row(
          children: [new Expanded(
              child: _styledButton(
                'Start new battle',
                buttonPressed: () {
                  _showAlert(context);
                }
              )
          )]
      ),
    ];
  }

  Widget _styledButton(String text, {VoidCallback buttonPressed}) {
    return new Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: new RaisedButton(
          onPressed: buttonPressed,
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

  void _showAlert(BuildContext context) {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      child: new AlertDialog(
        title: new Text('Start new battle'),
        content: new SingleChildScrollView(
          child: new Text('Are you sure you want to start over? '
              'This will remove all current monster classes, '
              'as well as accumulated status and damage.'),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Go back'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text('Continue'),
            onPressed: () {
              // Reset all values here
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _pushNewPage(BuildContext context) {
    Navigator.of(context).push(
        new MaterialPageRoute<Null>(
          builder: (BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(title: new Text('My Page')),
          body: new Center(
            child: new FlatButton(
              child: new Text('POP'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    ));
  }
}
