import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:communicator/src/models/word.dart';
import 'package:meta/meta.dart';
part 'sentence_event.dart';
part 'sentence_state.dart';

class SentenceBloc extends Bloc<SentenceEvent, SentenceState> {
  SentenceBloc() : super(SentenceInitial()) {
    on<AddWordEvent>((event, emit) {
      try {
        List<Word> sentence = [];
        if (state is FullSentenceState) {
          sentence = state.props;
        }
        sentence.add(event.word);
        emit(FullSentenceState(sentence));
      } catch (error) {
        log('on<AddWordEvent>$error');
      }
    });

    on<RemoveSentenceEvent>((event, emit) {
      emit(EmptySentenceState());
    });
  }
}
