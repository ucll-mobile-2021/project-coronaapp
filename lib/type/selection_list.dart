import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectionList extends StatefulWidget {
  SelectionList(this.elements, this.initialSelection,
      {Key key, this.appBar,  this.countryBuilder})
      : super(key: key);

  final PreferredSizeWidget appBar;
  final List elements;
  final String initialSelection;
  final Widget Function(BuildContext context, String) countryBuilder;

  @override
  _SelectionListState createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  List countries;
  final TextEditingController _controller = TextEditingController();
  ScrollController _controllerScroll;
  var diff = 0.0;

  var posSelected = 0;
  var height = 0.0;
  var _sizeheightcontainer;
  var _heightscroller;
  var _text;
  var _oldtext;
  var _itemsizeheight = 50.0;
  double _offsetContainer = 0.0;

  bool isShow = true;

  @override
  void initState() {
    countries = widget.elements;
    countries.sort((a, b) {
      return a.split("%")[0].compareTo(b.split("%")[0]);
    });
    _controllerScroll = ScrollController();
    _controller.addListener(_scrollListener); //todo why commented?
    _controllerScroll.addListener(_scrollListener);
    super.initState();
  }

  void _sendDataBack(BuildContext context, String initialSelection) {
    Navigator.pop(context, initialSelection);
  }

  List _alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
    ));
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: widget.appBar,
      body: Container(
        color: Color(0xfff4f4f4),
        child: LayoutBuilder(builder: (context, contrainsts) {
          diff = height - contrainsts.biggest.height;
          _heightscroller = (contrainsts.biggest.height) / _alphabet.length;
          _sizeheightcontainer = (contrainsts.biggest.height);
          return Stack(
            children: <Widget>[
              CustomScrollView(
                controller: _controllerScroll,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('SEARCH'), // todo
                        ),
                        Container(
                          color: Colors.white,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 0, top: 0, right: 15),
                              hintText: "Search...", // todo
                            ),
                            onChanged: _filterElements,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:
                          Text('LAST PICK'), // todo
                        ),
                        Container(
                          color: Colors.white,
                          child: Material(
                            color: Colors.transparent,
                            child: ListTile(
                              leading: Text(
                                widget.initialSelection.split("%")[1],
                                style: TextStyle(fontSize: 30),
                              ),
                              title: Text(widget.initialSelection.split("%")[0]), //todo name
                              trailing: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Icon(Icons.check, color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return widget.countryBuilder != null
                          ? widget.countryBuilder(
                          context, countries.elementAt(index))
                          : getListCountry(countries.elementAt(index));
                    }, childCount: countries.length),
                  )
                ],
              ),
              if (isShow == true)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragStart: _onVerticalDragStart,
                    child: Container(
                      height: 20.0 * 30,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: []..addAll(
                          List.generate(_alphabet.length,
                                  (index) => _getAlphabetItem(index)),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget getListCountry(String e) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: Text(
            e.split("%")[1],
            style: TextStyle(fontSize: 30),
          ),
          title: Text(e.split("%")[0]),
          onTap: () {
            _sendDataBack(context, e);
          },
        ),
      ),
    );
  }

  _getAlphabetItem(int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            posSelected = index;
            _text = _alphabet[posSelected];
            if (_text != _oldtext) {
              for (var i = 0; i < countries.length; i++) {
                if (_text.toString().compareTo(
                    countries[i].split("%")[0].toUpperCase()[0]) ==
                    0) {
                  _controllerScroll.jumpTo((i * _itemsizeheight) + 10);
                  break;
                }
              }
              _oldtext = _text;
            }
          });
        },
        child: Container(
          width: 40,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == posSelected
                ? Colors.blue
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            _alphabet[index],
            textAlign: TextAlign.center,
            style: (index == posSelected)
                ? TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:
                Colors.white)
                : TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
        ),
      ),
    );
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      countries = widget.elements
          .where((e) =>
      e.code.contains(s) ||
          e.dialCode.contains(s) ||
          e.split("%")[0].toUpperCase().contains(s))
          .toList();
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if ((_offsetContainer + details.delta.dy) >= 0 &&
          (_offsetContainer + details.delta.dy) <=
              (_sizeheightcontainer - _heightscroller)) {
        _offsetContainer += details.delta.dy;
        posSelected =
            ((_offsetContainer / _heightscroller) % _alphabet.length).round();
        _text = _alphabet[posSelected];
        if (_text != _oldtext) {
          for (var i = 0; i < countries.length; i++) {
            if (_text
                .toString()
                .compareTo(countries[i].split("%")[0].toUpperCase()[0]) ==
                0) {
              _controllerScroll.jumpTo((i * _itemsizeheight) + 15);
              break;
            }
          }
          _oldtext = _text;
        }
      }
    });
  }

  void _onVerticalDragStart(DragStartDetails details) {
    _offsetContainer = details.globalPosition.dy - diff;
  }

  _scrollListener() {
    int scrollPosition =
    (_controllerScroll.position.pixels / _itemsizeheight).round();
    if (scrollPosition < countries.length) {
      String countryName = countries.elementAt(scrollPosition).split("%")[0];
      setState(() {
        posSelected =
            countryName[0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      });
    }

    if ((_controllerScroll.offset) >=
        (_controllerScroll.position.maxScrollExtent)) {}
    if (_controllerScroll.offset <=
        _controllerScroll.position.minScrollExtent &&
        !_controllerScroll.position.outOfRange) {}
  }
}
