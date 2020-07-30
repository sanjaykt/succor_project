class User {
  int userId;
  String username;
  String password;
  int createdByUserId;
  int modifiedByUserId;
  DateTime createdDate;
  DateTime modifiedDate;
  int statusId;

  User();

  User.formJson(Map<String, dynamic> json)
      : userId = json['userId'],
        username = json['json'],
        password = json['password'],
        createdByUserId = json['createdByUserId'],
        modifiedByUserId = json['modifiedByUserId'],
        createdDate = (json['createdDate'] != null
            ? DateTime.parse(json['createdDate'])
            : null),
        modifiedDate = (json['modifiedDate'] != null
            ? DateTime.parse(json['modifiedDate'])
            : null),
        statusId = json['statusId'];

  Map<String, dynamic> toJson() =>
      {
        'userId': userId,
        'username': username,
        'password': password,
        if (createdDate != null)
          'createdDate': createdDate.toString(),
        if (modifiedDate != null)
          'modifiedDate': modifiedDate.toString(),
        'createdByUserId': createdByUserId,
        'modifiedByUserId': modifiedByUserId,
        if (statusId != null)
          'statusId': statusId,
      };
}
