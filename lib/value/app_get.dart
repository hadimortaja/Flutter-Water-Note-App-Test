import 'package:get/get.dart';

class AppGet extends GetxController {
  String emailLogin,
      passwordLogin,
      nameSignUp,
      emailSignUp,
      passwordSignUp,
      confirmPasswordSignUp;
  setEmailLogin(String emailLogin) {
    this.emailLogin = emailLogin;
    update();
  }

  setPasswordLogin(String passwordLogin) {
    this.passwordLogin = passwordLogin;
    update();
  }

  setNameSignUp(String nameSignUp) {
    this.nameSignUp = nameSignUp;
    update();
  }

  setEmailSignUp(String emailSignUp) {
    this.emailSignUp = emailSignUp;
    update();
  }

  setPasswordSignUp(String passwordSignUp) {
    this.passwordSignUp = passwordSignUp;
    update();
  }

  setConfirmPasswordSignUp(String confirmPasswordSignUp) {
    this.confirmPasswordSignUp = confirmPasswordSignUp;
    update();
  }
}
