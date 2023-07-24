import 'package:my_first_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthenticationService>();

  Future runStartupLogic() async {
    bool isLogged = await _authService.isLogged();
    await Future.delayed(const Duration(seconds: 3));

    if (isLogged) {
      _navigationService.replaceWithHomeView();
    }

    _navigationService.replaceWithLoginView();
  }
}
