class Language {
  final int id;
  final String flag, name, languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[ // https://flagpedia.net/emoji
      Language(1, '🇬🇧', 'English', 'en'),
      Language(2, '🇫🇷', 'French', 'fr'),
      Language(3, '🇩🇪', 'German', 'de'),
      Language(4, '🇧🇪', 'Dutch', 'nl')
    ];
  }
}