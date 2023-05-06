part of 'sentence_bloc.dart';

@immutable
abstract class SentenceEvent {}

class AddWordEvent extends SentenceEvent {
  final Word word;
  AddWordEvent(this.word);
}

class RemoveSentenceEvent extends SentenceEvent {
  RemoveSentenceEvent();
}
