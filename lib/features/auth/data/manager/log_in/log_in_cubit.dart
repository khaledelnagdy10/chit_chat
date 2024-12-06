import 'package:bloc/bloc.dart';
import 'package:chit_chat/features/auth/data/services/auth_services/auth_services.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  Future<void> logInCubit (context ,String fullName,String emailAddress )async {
emit(LogInLoading());
try {
  AuthServices().signInWithEmailAndPassword(context, fullName, emailAddress );
 emit(LogInSucsses());
} on Exception catch (e) {
  emit(LogInFaliure());
}
 
  }
}
