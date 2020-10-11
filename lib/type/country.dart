class Country {
  final String _code;
  final String _name;
  final String _flag;

  Country(this._code, this._name, this._flag);

  String getCode() => _code;

  String getName() => _name;

  String getFlag() => _flag;

  String getBeautifulName() => _flag + "   " + _name;
}
