import 'package:flutter_bloc/flutter_bloc.dart';

import '../../landing/pages_descriptor.dart';

abstract class HomePageBloc extends Cubit<Pages> {
  HomePageBloc(super.initialState);
}

class HomePageBlocImpl extends HomePageBloc {
  HomePageBlocImpl(super.initialState);
}
