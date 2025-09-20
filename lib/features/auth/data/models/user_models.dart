enum UserAccess {
  user,
  admin,
}

class UserCreate {
  final String firstname;
  final String lastname;
  final String email;
  final String? dob;
  final String? phone;
  final UserAccess access;
  final String password;

  UserCreate({
    required this.firstname,
    required this.lastname,
    required this.email,
    this.dob,
    this.phone,
    this.access = UserAccess.user,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        if (dob != null) 'dob': dob,
        if (phone != null) 'phone': phone,
        'access': access.name,
        'password': password,
      };
}

class UserOut {
  final String firstname;
  final String lastname;
  final String email;
  final String? dob;
  final String? phone;
  final UserAccess access;
  final String id;

  UserOut({
    required this.firstname,
    required this.lastname,
    required this.email,
    this.dob,
    this.phone,
    this.access = UserAccess.user,
    required this.id,
  });

  factory UserOut.fromJson(Map<String, dynamic> json) => UserOut(
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        dob: json['dob'],
        phone: json['phone'],
        access: UserAccess.values.firstWhere(
          (e) => e.name == json['access'],
          orElse: () => UserAccess.user,
        ),
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        if (dob != null) 'dob': dob,
        if (phone != null) 'phone': phone,
        'access': access.name,
        'id': id,
      };
}

class UserUpdate {
  final String? firstname;
  final String? lastname;
  final String? dob;
  final String? phone;
  final UserAccess? access;
  final String? password;

  UserUpdate({
    this.firstname,
    this.lastname,
    this.dob,
    this.phone,
    this.access,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (firstname != null) json['firstname'] = firstname;
    if (lastname != null) json['lastname'] = lastname;
    if (dob != null) json['dob'] = dob;
    if (phone != null) json['phone'] = phone;
    if (access != null) json['access'] = access!.name;
    if (password != null) json['password'] = password;
    return json;
  }
}