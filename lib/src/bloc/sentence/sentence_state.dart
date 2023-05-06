part of 'sentence_bloc.dart';

@immutable
abstract class SentenceState {
  @override
  List<Word> get props => [];
}

class SentenceInitial extends SentenceState {}

class EmptySentenceState extends SentenceState {}

class FullSentenceState extends SentenceState {
  final List<Word> sentence;
  FullSentenceState(this.sentence);
  @override
  List<Word> get props => sentence;
}
