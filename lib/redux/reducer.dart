import 'package:pharm_calc/redux/reduxActions.dart';
import 'package:pharm_calc/redux/app_state.dart';

AppState IncrementByOneReducer(AppState state, dynamic action) {

  if(action is IncrementByOne){
    return AppState(counter: state.counter + 1);
  }

  if(action is DecrementByOne){
    return AppState(counter: state.counter - 1);
  }

  if(action is SetCount){
    return AppState(counter: action.setValue);
  }

  return state;


}


