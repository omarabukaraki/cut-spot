import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> createUser(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required String image}) async {
    emit(RegisterLodging());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (FirebaseAuth.instance.currentUser!.emailVerified == false) {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        emit(RegisterSuccess());
        await users.doc(FirebaseAuth.instance.currentUser!.uid).set({
          'id': FirebaseAuth.instance.currentUser!.uid,
          'name': name,
          'email': email,
          'phoneNumber': phoneNumber,
          'image': image
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMassage: 'Password is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errMassage: 'The account already exists, please log in'));
      }
    } catch (e) {
      emit(RegisterFailure(errMassage: e.toString()));
    }
  }
}
