import '../../../auth/data/models/user_models.dart';

class FriendOut {
  final String firstname;
  final String lastname;
  final String email;
  final String? dob;
  final String? phone;
  final UserAccess access;
  final String id;

  FriendOut({
    required this.firstname,
    required this.lastname,
    required this.email,
    this.dob,
    this.phone,
    this.access = UserAccess.user,
    required this.id,
  });

  factory FriendOut.fromJson(Map<String, dynamic> json) => FriendOut(
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

  // Convert from UserOut if needed
  factory FriendOut.fromUserOut(UserOut user) => FriendOut(
        firstname: user.firstname,
        lastname: user.lastname,
        email: user.email,
        dob: user.dob,
        phone: user.phone,
        access: user.access,
        id: user.id,
      );
}