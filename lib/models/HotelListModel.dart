import 'dart:convert';

// convert to lsit from json
List<HotelListModel> HotellistModelFromJson(String str) => List<HotelListModel>.from(json.decode(str).map((x) => HotelListModel.fromJson(x)));

String HotellistModelToJson(List<HotelListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelListModel {
    HotelListModel({
        required this.id,
        required this.title,
        required this.description,
        required this.address,
        required this.postcode,
        required this.phoneNumber,
        required this.latitude,
        required this.longitude,
        required this.image,
    });

    int id;
    String title;
    String description;
    String address;
    String postcode;
    String phoneNumber;
    String latitude;
    String longitude;
    PicImage image;

    factory HotelListModel.fromJson(Map<String, dynamic> json) => HotelListModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
        postcode: json["postcode"],
        phoneNumber: json["phoneNumber"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        image: PicImage.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "address": address,
        "postcode": postcode,
        "phoneNumber": phoneNumber,
        "latitude": latitude,
        "longitude": longitude,
        "image": image.toJson(),
    };
}

class PicImage {
    PicImage({
        required this.small,
        required this.medium,
        required this.large,
    });

    String small;
    String medium;
    String large;

    factory PicImage.fromJson(Map<String, dynamic> json) => PicImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}
