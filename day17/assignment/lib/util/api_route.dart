class ApiRoutes {
  static const String UserListAdress = '/api/collections/documents/records';
  static const String LoginAdress = "/api/collections/users/auth-with-password";

  static const String SignUpdress = "/api/collections/users/records";

  static const String ScretAdress =
      "/api/collections/secrets/records?sort=-created";

  static const String UploadAdress = "/api/collections/secrets/records";

  // http://52.79.115.43:8090/api/collections/documents/records
}


// http://52.79.115.43:8090/api/collections/secrets/records?sort=-created
// 유저 리스트 불러오기

// http://52.79.115.43:8090/api/collections/secrets/records
// 로그인


// http://52.79.115.43:8090/api/collections/users/records
// 회원가입


// http://52.79.115.43:8090/api/collections/secrets/records?sort=-created
// 비밀 리스트 불러오기


// http://52.79.115.43:8090/api/collections/secrets/records
// 비밀 업로드하기