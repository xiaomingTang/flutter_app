const int _passwordMinLen = 6;
const int _passwordMaxLen = 16;

// 检查登录名称(id / email / phone / nickname)是否有效
String checkUsernameAvailable(String username) {
  if (username.isEmpty) {
    return "登录名不得为空";
  }
  int len = username.length;
  if (len < _passwordMinLen || len > _passwordMaxLen) {
    return "登录名必须为 $_passwordMinLen - $_passwordMaxLen 位";
  }
  return null;
}

String checkPasswordAvailable(String password) {
  if (password.isEmpty) {
    return "密码不得为空";
  }
  int len = password.length;
  if (len < _passwordMinLen || len > _passwordMaxLen) {
    return "密码必须为 $_passwordMinLen - $_passwordMaxLen 位";
  }
  return null;
}
