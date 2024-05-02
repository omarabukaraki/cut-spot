class UserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String image;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.image});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
        id: jsonData['id'],
        name: jsonData['name'],
        email: jsonData['email'],
        phoneNumber: jsonData['phoneNumber'],
        image: jsonData['image']);
  }
}
