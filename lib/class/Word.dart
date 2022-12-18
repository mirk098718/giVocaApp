class Word {
  String word;
  String part;
  String meaning;
  String example1;
  String example2;

  Word(
      this.word, this.meaning, {this.part= "", this.example1="", this.example2="" });

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'part': part,
      'meaning': meaning,
      'example1': example1,
      'example2': example2,
    };
  }

  Word.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        part = json['part'],
        meaning = json['meaning'],
        example1 = json['example1'],
        example2 = json['example2'];
}
