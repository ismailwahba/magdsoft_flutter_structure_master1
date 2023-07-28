class VerifyPhone {
  int? status;
  String? message;
  String? code;

  VerifyPhone({this.status, this.message, this.code});

  VerifyPhone.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}
