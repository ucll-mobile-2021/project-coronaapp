class Language {
  final int id;
  final String name, flag, languageCode;

  Language(this.id, this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[ // https://flagpedia.net/emoji
      Language(1, '🇬🇧', 'English', 'en'),
      Language(2, '🇫🇷', 'French', 'fr'),
      Language(3, '🇩🇪', 'German', 'de'),
      Language(4, '🇧🇪', 'Dutch', 'nl')
    ];
  }
}