class User {
  int userId;
  String email;
  String password;
  String username;
  String hostique_search;
  static User _sUser;

  User(this.userId,this.email,this.password,this.username,this.hostique_search );

  User.fromJson(Map<String, dynamic> json )
  {
    userId = json['id'] ;
  email = json['email'];
  password = json['password'];
  username = json['nickname'];
  hostique_search = json['historique_search'];
  create(userId,email,password,username,hostique_search);
  //print("here");
  }
  Map<String, dynamic> toJson() =>
      {
        'id': userId,
        'email' : email,
        'password' : password,
        'nickname' : username,
        'historique_search' : hostique_search
      };

  static User get() {
    if (_sUser == null) {
      throw "User is null";
    }
    return _sUser;
  }

  static void create(int userId, String email, String password,String username,String hostique_search) {
    if (_sUser == null) {
      _sUser = new   User(userId,email,password,username,hostique_search );
      print(_sUser.username);
    }
  }
  void clearUser() {
    _sUser = null;
  }
  int get _userId => userId;
  String get _email => email;
  String get _password => password;
  String get _username => username;
  String get _hostique_search => hostique_search;

  set _userId(int value) {
    _userId = value;
  }
  set _email(String value) {
    _email = value;
  }
  set _password(String value) {
    _password = value;
  }  set _username(String value) {
    _username = value;
  }  set _hostique_search(String value) {
    _hostique_search = value;
  }

}
