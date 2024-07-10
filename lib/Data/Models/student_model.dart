class StudentModel {
  String? sId;
  String? name;
  String? email;
  int? phone;
  String? address;
  int? iV;

  StudentModel(
      {this.sId, this.name, this.email, this.phone, this.address, this.iV});

  StudentModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['__v'] = this.iV;
    return data;
  }
}
