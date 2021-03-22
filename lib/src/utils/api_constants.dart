const String VERSION = "/v1.0";
const String BASE_URL = "https://beautyathome2.azurewebsites.net/api" + VERSION;

class ProviderAPIConstant {
  static const String END_POINT = BASE_URL + "/accounts";
  static const String GET_ALL = END_POINT;
  static const String PROVIDER = "accounts";
}

class ServiceAPIConstant {
  static const String SERVICE = "services";
}

class EntityEndpoint {
  static const String SERIVCE = "services";
  static const String BOOKING = "bookings";
  static const String AUTH_LOGIN = "auth/login";
}
