class AccountModel {
  final String name,
      email,
      role,
      phone,
      accessToken,
      refreshToken,
      idToken,
      firebaseRefreshToken;

  AccountModel({
    this.refreshToken,
    this.idToken,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.accessToken,
    this.firebaseRefreshToken,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      name: json["displayName"],
      email: json["email"],
      role: json["role"],
      phone: json["phone"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      idToken: json["idToken"],
      firebaseRefreshToken: json["firebaseRefreshToken"],
    );
  }
}
