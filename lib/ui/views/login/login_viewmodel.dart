import 'package:my_first_app/app/app.router.dart';
import 'package:my_first_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  void login() {
    _authService.login();
    _navigationService.replaceWithHomeView();
  }
}
