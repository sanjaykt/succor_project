const FAILED = 'Failed';
const SUCCESS = 'Success';

class ServerResponse {
  var status;
  var data;
  var message;

  ServerResponse({this.status, this.data, this.message});


  ServerResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }
}
