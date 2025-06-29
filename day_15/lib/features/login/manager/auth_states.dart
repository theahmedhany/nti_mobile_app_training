abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthLoggedInState extends AuthStates {}

class AuthLoggedInErrorState extends AuthStates {
  final String error;

  AuthLoggedInErrorState(this.error);
}

class AuthLoggedOutState extends AuthStates {}

class AuthLoggedOutErrorState extends AuthStates {
  final String error;

  AuthLoggedOutErrorState(this.error);
}
