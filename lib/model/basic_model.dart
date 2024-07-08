class BasicUser {
  int? id;
  String? name;
  String? username;

  BasicUser({
    this.id,
    this.name,
    this.username,
  });

  factory BasicUser.fromJson(Map<String, dynamic> json) {
    return BasicUser(
      id: json['id'],
      name: json['name'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
    };
  }
}
