import 'package:flutter/cupertino.dart';

class NewsTile extends StatelessWidget {
  final String _date;
  final String _title;

  NewsTile(this._date, this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_date + " - " + _title),
    );
  }
}
