class FriendModel{
  String name;
  int age;
  String gender;
  String id;
  bool isbff;

  FriendModel({
    required this.name,
    required this.age,
    required this.gender,
    required this.id,
    required this.isbff
});


  markBff(){
    isbff = true;
  }
  unmarkBff(){
    isbff = false;
  }

}