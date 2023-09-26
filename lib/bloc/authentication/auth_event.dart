abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  String username;
  String password;
  AuthLoginEvent(this.username, this.password);
}
