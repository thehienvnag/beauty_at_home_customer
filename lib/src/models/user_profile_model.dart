class UserProfileModel {
  final String name,
      email,
      role,
      phoneNumber,
      accessToken,
      refreshToken,
      idToken,
      firebaseRefreshToken;

  UserProfileModel(
    this.refreshToken, {
    this.idToken,
    this.name,
    this.email,
    this.role,
    this.phoneNumber,
    this.accessToken,
    this.firebaseRefreshToken,
  });
}
