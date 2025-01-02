class DriverEntity {
  DriverEntity({
    String? id,
    String? country,
    String? firstName,
    String? lastName,
    String? vehicleType,
    String? vehicleNumber,
    String? vehicleLicense,
    String? nid,
    String? nIDImg,
    String? email,
    String? gender,
    String? phone,
    String? photo,
    String? createdAt,
    String? passwordChangedAt,
  }) {
    _id = id;
    _country = country;
    _firstName = firstName;
    _lastName = lastName;
    _vehicleType = vehicleType;
    _vehicleNumber = vehicleNumber;
    _vehicleLicense = vehicleLicense;
    _nid = nid;
    _nIDImg = nIDImg;
    _email = email;
    _gender = gender;
    _phone = phone;
    _photo = photo;
    _createdAt = createdAt;
    _passwordChangedAt = passwordChangedAt;
  }

  DriverEntity.fromJson(dynamic json) {
    _id = json['_id'];
    _country = json['country'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _vehicleType = json['vehicleType'];
    _vehicleNumber = json['vehicleNumber'];
    _vehicleLicense = json['vehicleLicense'];
    _nid = json['NID'];
    _nIDImg = json['NIDImg'];
    _email = json['email'];
    _gender = json['gender'];
    _phone = json['phone'];
    _photo = json['photo'];
    _createdAt = json['createdAt'];
    _passwordChangedAt = json['passwordChangedAt'];
  }
  String? _id;
  String? _country;
  String? _firstName;
  String? _lastName;
  String? _vehicleType;
  String? _vehicleNumber;
  String? _vehicleLicense;
  String? _nid;
  String? _nIDImg;
  String? _email;
  String? _gender;
  String? _phone;
  String? _photo;
  String? _createdAt;
  String? _passwordChangedAt;

  String? get id => _id;
  String? get country => _country;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get vehicleType => _vehicleType;
  String? get vehicleNumber => _vehicleNumber;
  String? get vehicleLicense => _vehicleLicense;
  String? get nid => _nid;
  String? get nIDImg => _nIDImg;
  String? get email => _email;
  String? get gender => _gender;
  String? get phone => _phone;
  String? get photo => _photo;
  String? get createdAt => _createdAt;
  String? get passwordChangedAt => _passwordChangedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['country'] = _country;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['vehicleType'] = _vehicleType;
    map['vehicleNumber'] = _vehicleNumber;
    map['vehicleLicense'] = _vehicleLicense;
    map['NID'] = _nid;
    map['NIDImg'] = _nIDImg;
    map['email'] = _email;
    map['gender'] = _gender;
    map['phone'] = _phone;
    map['photo'] = _photo;
    map['createdAt'] = _createdAt;
    map['passwordChangedAt'] = _passwordChangedAt;
    return map;
  }
}
