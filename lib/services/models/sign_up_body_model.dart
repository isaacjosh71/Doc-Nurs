
class SignUpBody{
  String name;
  String phone;
  String mail;
  String password;
  String passwordConfirmation;

  SignUpBody({
    required this.name,
    required this.phone,
    required this.mail,
    required this.password,
    required this.passwordConfirmation
});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.name;
    data['email'] = this.mail;
    data['phone_number'] = this.phone;
    data['password'] = this.password;
    data['password_confirmation'] = this.passwordConfirmation;
    return data;
  }
}