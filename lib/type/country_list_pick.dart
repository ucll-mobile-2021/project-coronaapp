import 'package:coronapp/type/countries.dart';
import 'package:coronapp/type/selection_list.dart';
import 'package:flutter/material.dart';

class CountryListPick extends StatefulWidget {
  CountryListPick(
      {this.onChanged,
        this.initialSelection,
        this.appBar,
        this.pickerBuilder,
        this.countryBuilder});
  final String initialSelection;
  final ValueChanged<String> onChanged;
  final PreferredSizeWidget appBar;
  final Widget Function(BuildContext context, String countryCode)
  pickerBuilder;
  final Widget Function(BuildContext context, String countryCode)
  countryBuilder;

  @override
  _CountryListPickState createState() {
    List elements = Countries.countriesList();
    return _CountryListPickState(elements);
  }
}

class _CountryListPickState extends State<CountryListPick> {
  String selectedItem;
  List elements = [];
  _CountryListPickState(this.elements);

  @override
  void initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
              (e) { print("e:" + e); return (e.split('%')[1].toUpperCase() == widget.initialSelection.toUpperCase());},
          orElse: () => elements[0] as String);
    } else {
      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen(BuildContext context, PreferredSizeWidget appBar) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectionList(
            elements,
            selectedItem,
            appBar: widget.appBar ??
                AppBar(
                  backgroundColor: Theme.of(context).appBarTheme.color,
                  title: Text("Select Country"),
                ),
            //theme: theme,
            countryBuilder: widget.countryBuilder,
          ),
        ));

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged(result ?? selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      onPressed: () {
        _awaitFromSelectScreen(context, widget.appBar);
      },
      child: widget.pickerBuilder != null
          ? widget.pickerBuilder(context, selectedItem)
          : Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                selectedItem.split("%")[1], // todo test
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(selectedItem.split("%")[0]), //todo
            ),
          ),
          Flexible(
            child: Icon(Icons.keyboard_arrow_down),
          )
        ],
      ),
    );
  }
}
