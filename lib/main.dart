import 'package:flutter/material.dart';

void main() {
  runApp(new BattlehavenApp());
}

class BattlehavenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "BattleHaven",
      home: new InfoScreen(),
    );
  }
}

class InfoScreen extends StatefulWidget {
  @override
  State createState() => new InfoScreenState();
}

class InfoScreenState extends State<InfoScreen> {
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("BattleHaven")
      ),
      body: _buildTextComposer(),
      floatingActionButton: new FloatingActionButton(onPressed: null, child: new Icon(const IconData(0xe145, fontFamily: 'MaterialIcons'))),
    );
  }


  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                  hintText: "Send a message"),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}