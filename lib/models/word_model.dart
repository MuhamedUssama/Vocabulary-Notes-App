class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel addSimilarWord(String similarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords = [];

    if (isArabicSimilarWord) {
      newSimilarWords = List.from(arabicSimilarWords);
    } else {
      newSimilarWords = List.from(englishSimilarWords);
    }

    newSimilarWords.add(similarWord);

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:
          isArabicSimilarWord ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords:
          isArabicSimilarWord ? englishSimilarWords : newSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel deleteSimilarWord(
      int indexOfSimilarWord, bool isArabicSimilarWord) {
    List<String> newSimilarWords = [];

    if (isArabicSimilarWord) {
      newSimilarWords = List.from(arabicSimilarWords);
    } else {
      newSimilarWords = List.from(englishSimilarWords);
    }

    newSimilarWords.removeAt(indexOfSimilarWord);

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords:
          isArabicSimilarWord ? newSimilarWords : arabicSimilarWords,
      englishSimilarWords:
          isArabicSimilarWord ? englishSimilarWords : newSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }
}
