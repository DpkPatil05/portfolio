import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages_descriptor.dart';

abstract class LandingPageBloc extends Cubit<Pages> {
  LandingPageBloc(super.initialState);

  void onPageChange(Pages page);
}

class LandingPageBlocImpl extends LandingPageBloc {
  LandingPageBlocImpl(super.initialState);

  @override
  void onPageChange(Pages page) => emit(page);
}
