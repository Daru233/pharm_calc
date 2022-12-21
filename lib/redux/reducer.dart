import 'package:pharm_calc/redux/actions.dart';
import 'package:pharm_calc/redux/app_state.dart';

AppState IncrementByOneReducer(AppState state, dynamic action) {

  // TODO implement enum for actions

  // if (action is IncrementByOne) {
  //   return AppState(counter: state.counter + 1);
  // }
  //
  // return state;

  switch(action) {

    case IncrementByOne:
      return AppState(counter: state.counter + 1);

    default:
      return state;

  }

}


