// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.done,
        this.body,
    });

    bool done;
    List<Body> body;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        done: json["done"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "done": done,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
    };
}

class Body {
    Body({
        this.id,
        this.contactNo,
        this.firstName,
        this.lastName,
        this.email,
        this.address,
        this.pin,
        this.dateCreated,
        this.dateUpdated,
        this.verified,
        this.nic,
    });

    String id;
    String contactNo;
    String firstName;
    String lastName;
    String email;
    String address;
    String pin;
    String dateCreated;
    String dateUpdated;
    bool verified;
    String nic;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        id: json["id"],
        contactNo: json["contact_no"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        address: json["address"],
        pin: json["pin"] == null ? null : json["pin"],
        dateCreated: json["date_created"],
        dateUpdated: json["date_updated"] == null ? null : json["date_updated"],
        verified: json["verified"],
        nic: json["nic"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "contact_no": contactNo,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "address": address,
        "pin": pin == null ? null : pin,
        "date_created": dateCreated,
        "date_updated": dateUpdated == null ? null : dateUpdated,
        "verified": verified,
        "nic": nic,
    };
}
