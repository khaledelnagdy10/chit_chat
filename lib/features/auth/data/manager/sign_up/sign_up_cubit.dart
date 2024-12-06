import 'package:bloc/bloc.dart';
import 'package:chit_chat/features/auth/data/services/auth_services/auth_services.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpCubit(context ,String fullName,String emailAddress ,password)async{
    emit(SignUpLoading());
    try {
      AuthServices().createUserWithEmailAndPassword(context, fullName, emailAddress, password);
      emit(SignUpSucsses());
    } catch (e) {
      emit(SignUpFaliure());
    }
    
  }
}
