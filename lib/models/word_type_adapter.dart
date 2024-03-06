import 'package:hive_flutter/adapters.dart';
import 'package:vocabulary_notes_app/models/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  // TODO: implement typeId
  int get typeId => throw UnimplementedError();

  @override
  void write(BinaryWriter writer, WordModel obj) {
    // TODO: implement write
  }
}
