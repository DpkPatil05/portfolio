import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../models/landing_page_state.dart';

abstract class LandingPageBloc extends Cubit<LandingPageState> {
  LandingPageBloc(super.initialState);

  set page(Pages page);

  Stream<LandingPageState?> get screenState;

  void dispose();
}

class LandingPageBlocImpl extends LandingPageBloc {
  LandingPageBlocImpl(super.initialState);

  LandingPageState _state = LandingPageState(page: Pages.homePage);
  final StreamController<LandingPageState?> _stateStream =
      BehaviorSubject.seeded(null);

  @override
  set page(Pages page) {
    _state = _state.copyWith(
      page: page,
    );
    _stateStream.add(_state);
  }

  @override
  Stream<LandingPageState?> get screenState => _stateStream.stream;

  @override
  void dispose() {
    _stateStream.close();
    dispose();
  }
}
