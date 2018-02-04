import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'addMonster.dart';

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("BattleHaven"),
          actions: <Widget>[
            new Icon(const IconData(0xe3b8, fontFamily: 'MaterialIcons'))
          ],
      ),
      body: _buildMonsterList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<Null>(context: context, builder: (BuildContext context)
            {
              return new AddMonsterModalSheet();
            });
          },
          child: new Icon(const IconData(0xe145, fontFamily: 'MaterialIcons'))
      ),
    );
  }

  Widget _buildMonsterList() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Column(
        children: <Widget>[
          new MonsterCard()
        ],
      )
    );
  }
}

class MonsterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(

      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Image.asset('images/living-bones.jpg', width: 50.0),
              new Text('Living Bones'),
              new PaddedText('57')
            ],
          ),
          new MonsterRow(monsterNumber: 1, maxHP: 9)
        ],
      )
    );
  }
}

class PaddedText extends StatelessWidget {
  final double margin;
  final String content;
  PaddedText(this.content);
  
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Text(content)
    );
  }
}

class MonsterRow extends StatefulWidget {
  final int monsterNumber;
  final int maxHP;
  MonsterRow({@required this.monsterNumber, @required this.maxHP});

  @override
  _MonsterRowState createState() => new _MonsterRowState(hp: maxHP);
}

class _MonsterRowState extends State<MonsterRow> {
  int hp;
  List<String> urls = [
    'images/disarmed-grey.png',
    'images/immobilized-grey.png',
    'images/muddled-grey.png',
    'images/poisoned-grey.png',
    'images/stunned-grey.png',
    'images/wound-grey.png'
  ];
  _MonsterRowState({@required this.hp});

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new PaddedText('${widget.monsterNumber}'),
        new GestureDetector(
          onTap: () {
            _changeStatusIcon(0);
          },
          child: new Image.asset(urls[0], width: 35.0, height: 35.0)
        ),
        new GestureDetector(
            onTap: () {
              _changeStatusIcon(1);
            },
            child: new Image.asset(urls[1], width: 35.0, height: 35.0)
        ),
        new GestureDetector(
            onTap: () {
              _changeStatusIcon(2);
            },
            child: new Image.asset(urls[2], width: 35.0, height: 35.0)
        ),
        new GestureDetector(
            onTap: () {
              _changeStatusIcon(3);
            },
            child: new Image.asset(urls[3], width: 35.0, height: 35.0)
        ),
        new GestureDetector(
            onTap: () {
              _changeStatusIcon(4);
            },
            child: new Image.asset(urls[4], width: 35.0, height: 35.0)
        ),
        new GestureDetector(
            onTap: () {
              _changeStatusIcon(5);
            },
            child: new Image.asset(urls[5], width: 35.0, height: 35.0)
        ),
        new PaddedText('$hp')
      ],
    );
  }

  _changeStatusIcon(int iconIndex) {
    List<String> parts = urls[iconIndex].split('-');
    String newUrl;
    if( parts.length > 1 ) {
      newUrl = '${parts[0]}.png';
    }
    else {
      newUrl = '${parts[0].split('.')[0]}-grey.png';
    }
    setState(() {
      urls[iconIndex] = newUrl;
    });
  }
}