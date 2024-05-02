import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signIn(
      {required String emailAddress, required String password}) async {
    emit(LoginLodging());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errMessage: 'Please confirm account'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'No user found for this email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'Password is wrong'));
      }
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(LoginLodging());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      if (email == '') {
        emit(ResetPasswordFailure(errMessage: 'Please enter your email'));
      } else {
        emit(ResetPasswordFailure(errMessage: 'Please check your email'));
      }
    }
  }
}
