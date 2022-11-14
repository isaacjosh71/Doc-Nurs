

class PhoneBody{
  String phone;
  String password;

  PhoneBody({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phone;
    data['password'] = this.password;
    return data;
  }
}