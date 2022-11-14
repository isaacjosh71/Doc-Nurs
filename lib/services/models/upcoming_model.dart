
class UpcomingAppointment {
  bool? error;
  String? message;
  List<Data>? data;

  UpcomingAppointment({this.error, this.message, this.data});

  UpcomingAppointment.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? physicianId;
  int? patientId;
  String? patientType;
  Null patientName;
  Null? relationship;
  String appointmentDate;
  String startTime;
  String endTime;
  String appointmentFee;
  String appointmentStatus;
  String? paymentStatus;
  String? message;
  String? createdAt;
  String? updatedAt;
  Patient? patient;
  Physician? physician;
  Null? payment;
  Null? review;

  Data(
      {this.id,
        this.physicianId,
        this.patientId,
        this.patientType,
        this.patientName,
        this.relationship,
        required this.appointmentDate,
        required this.startTime,
        required this.endTime,
        required this.appointmentFee,
        required this.appointmentStatus,
        this.paymentStatus,
        this.message,
        this.createdAt,
        this.updatedAt,
        this.patient,
        this.physician,
        this.payment,
        this.review});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        appointmentDate: json['appointment_date'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        appointmentFee: json['appointment_fee'],
        appointmentStatus: json['appointment_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['physician_id'] = this.physicianId;
    data['patient_id'] = this.patientId;
    data['patient_type'] = this.patientType;
    data['patient_name'] = this.patientName;
    data['relationship'] = this.relationship;
    data['appointment_date'] = this.appointmentDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['appointment_fee'] = this.appointmentFee;
    data['appointment_status'] = this.appointmentStatus;
    data['payment_status'] = this.paymentStatus;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.physician != null) {
      data['physician'] = this.physician!.toJson();
    }
    data['payment'] = this.payment;
    data['review'] = this.review;
    return data;
  }
}

class Patient {
  int? id;
  String fullName;
  String phoneNumber;
  String email;
  Null? profilePhotoUrl;

  Patient(
      {this.id,
        required this.fullName,
        required this.phoneNumber,
        required this.email,
        this.profilePhotoUrl});

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(fullName: json['full_name'], phoneNumber: json['phone_number'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}

class Physician {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  Null? profilePhotoUrl;
  Null? specialization;
  Null? profession;
  Null? gender;
  Null? address;

  Physician(
      {this.id,
        this.fullName,
        this.phoneNumber,
        this.email,
        this.profilePhotoUrl,
        this.specialization,
        this.profession,
        this.gender,
        this.address});

  Physician.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    profilePhotoUrl = json['profile_photo_url'];
    specialization = json['specialization'];
    profession = json['profession'];
    gender = json['gender'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['specialization'] = this.specialization;
    data['profession'] = this.profession;
    data['gender'] = this.gender;
    data['address'] = this.address;
    return data;
  }
}
