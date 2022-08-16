// To parse this JSON data, do
//
//     final signup = signupFromJson(jsonString);

import 'dart:convert';

Signup signupFromJson(String str) => Signup.fromJson(json.decode(str));

String signupToJson(Signup data) => json.encode(data.toJson());

class Signup {
    Signup({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.age,
        this.gender,
        this.address,
        this.district,
        this.isBlock,
        this.token,
    });

    String? id;
    String? name;
    String? email;
    int? phone;
    int? age;
    String? gender;
    String? address;
    String? district;
    bool? isBlock;
    String? token;

    factory Signup.fromJson(Map<String, dynamic> json) => Signup(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        age: json["age"],
        gender: json["gender"],
        address: json["address"],
        district: json["district"],
        isBlock: json["isBlock"],
        token: json["Token"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "age": age,
        "gender": gender,
        "address": address,
        "district": district,
        "isBlock": isBlock,
        "Token": token,
    };
}
