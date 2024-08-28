// To parse this JSON data, do
//
//     final activitiesListModel = activitiesListModelFromJson(jsonString);

import 'dart:convert';

ActivitiesListModel activitiesListModelFromJson(String str) =>
    ActivitiesListModel.fromJson(json.decode(str));

String activitiesListModelToJson(ActivitiesListModel data) =>
    json.encode(data.toJson());

class ActivitiesListModel {
  bool status;
  String message;
  List<Datum> data;

  ActivitiesListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ActivitiesListModel.fromJson(Map<String, dynamic> json) =>
      ActivitiesListModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int gymId;
  String gymName;
  String gymLogo;
  List<String> gymImages;
  String address;
  String description;
  String howToGet;
  String partnerName;
  String partnerEmail;
  String partnerPhone;
  String phoneCode;
  String avaliableSlots;
  List<Amenity> amenities;
  List<String> gymImages2;
  String open;
  Rating rating;
  List<Category> categories;
  Distance distance;
  String imgPath;

  Datum({
    required this.gymId,
    required this.gymName,
    required this.gymLogo,
    required this.gymImages,
    required this.address,
    required this.description,
    required this.howToGet,
    required this.partnerName,
    required this.partnerEmail,
    required this.partnerPhone,
    required this.phoneCode,
    required this.avaliableSlots,
    required this.amenities,
    required this.gymImages2,
    required this.open,
    required this.rating,
    required this.categories,
    required this.distance,
    required this.imgPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        gymId: json["gym_id"],
        gymName: json["gym_name"],
        gymLogo: json["gym_logo"],
        gymImages: List<String>.from(json["gym_images"].map((x) => x)),
        address: json["address"],
        description: json["description"],
        howToGet: json["how_to_get"],
        partnerName: json["partner_name"],
        partnerEmail: json["partner_email"],
        partnerPhone: json["partner_phone"],
        phoneCode: json["phone_code"],
        avaliableSlots: json["avaliable_slots"],
        amenities: List<Amenity>.from(
            json["amenities"].map((x) => Amenity.fromJson(x))),
        gymImages2: List<String>.from(json["gym_images2"].map((x) => x)),
        open: json["open"],
        rating: ratingValues.map[json["rating"]]!,
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        distance: distanceValues.map[json["distance"]]!,
        imgPath: json["img_path"],
      );

  Map<String, dynamic> toJson() => {
        "gym_id": gymId,
        "gym_name": gymName,
        "gym_logo": gymLogo,
        "gym_images": List<dynamic>.from(gymImages.map((x) => x)),
        "address": address,
        "description": description,
        "how_to_get": howToGet,
        "partner_name": partnerName,
        "partner_email": partnerEmail,
        "partner_phone": partnerPhone,
        "phone_code": phoneCode,
        "avaliable_slots": avaliableSlots,
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "gym_images2": List<dynamic>.from(gymImages2.map((x) => x)),
        "open": open,
        "rating": ratingValues.reverse[rating],
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "distance": distanceValues.reverse[distance],
        "img_path": imgPath,
      };
}

class Amenity {
  int id;
  Name name;
  String icon;

  Amenity({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "icon": icon,
      };
}

enum Name {
  AEROBIC_CLASSES,
  CAFETERIA,
  CHANGING_ROOMS,
  CROSS_FIT,
  DISABLED_ACCESS,
  PARKING,
  PILATE_CLASSES,
  PRIVATE_LOCKERS,
  PRIVATE_RESTROOM,
  PRIVATE_SHOWERS,
  RECEPTION_LOUNGE,
  REGULAR_GYM,
  SAUNA_BATH,
  STEAM_BATH,
  TOWEL_SERVICE,
  YOGA_CLASSES,
  ZUMBA_CLASSES
}

final nameValues = EnumValues({
  "Aerobic Classes": Name.AEROBIC_CLASSES,
  "Cafeteria": Name.CAFETERIA,
  "Changing Rooms": Name.CHANGING_ROOMS,
  "Cross Fit": Name.CROSS_FIT,
  "Disabled Access": Name.DISABLED_ACCESS,
  "Parking": Name.PARKING,
  "Pilate Classes": Name.PILATE_CLASSES,
  "Private Lockers": Name.PRIVATE_LOCKERS,
  "Private Restroom": Name.PRIVATE_RESTROOM,
  "Private Showers": Name.PRIVATE_SHOWERS,
  "Reception Lounge": Name.RECEPTION_LOUNGE,
  "Regular Gym": Name.REGULAR_GYM,
  "Sauna Bath": Name.SAUNA_BATH,
  "Steam Bath": Name.STEAM_BATH,
  "Towel Service": Name.TOWEL_SERVICE,
  "Yoga Classes": Name.YOGA_CLASSES,
  "Zumba Classes": Name.ZUMBA_CLASSES
});

class Category {
  int pricingId;
  CategoryName categoryName;
  int categoryId;
  List<Price> price;

  Category({
    required this.pricingId,
    required this.categoryName,
    required this.categoryId,
    required this.price,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        pricingId: json["pricing_id"],
        categoryName: categoryNameValues.map[json["category_name"]]!,
        categoryId: json["category_id"],
        price: List<Price>.from(json["price"].map((x) => Price.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pricing_id": pricingId,
        "category_name": categoryNameValues.reverse[categoryName],
        "category_id": categoryId,
        "price": List<dynamic>.from(price.map((x) => x.toJson())),
      };
}

enum CategoryName {
  AEROBIC_EXERCISE,
  BOXING,
  CARDIO,
  CROSS_FIT,
  DANCE,
  HYPERTROPHY,
  JIU_JITSU,
  KARATE_TRAINING,
  KICKBOXING,
  MIXED_MARTIAL_ARTS_MMA,
  MUAY_THAI,
  PAIN_MANAGEMENT,
  PILATE,
  POWERLIFTING,
  REGULAR_GYM_EXERCISE,
  SELF_DEFENCE_CLASS,
  SOUND_HEALING_THERAPY,
  STRENGTHENING,
  STRENGTH_TRAINING,
  STRESS_MANAGEMENT,
  STRETCHING,
  SWIMMING,
  WEIGHT_TRAINING,
  YOGA,
  ZUMBA
}

final categoryNameValues = EnumValues({
  "Aerobic exercise": CategoryName.AEROBIC_EXERCISE,
  "Boxing": CategoryName.BOXING,
  "Cardio": CategoryName.CARDIO,
  "CrossFit": CategoryName.CROSS_FIT,
  "Dance": CategoryName.DANCE,
  "Hypertrophy": CategoryName.HYPERTROPHY,
  "jiu-jitsu": CategoryName.JIU_JITSU,
  "Karate Training": CategoryName.KARATE_TRAINING,
  "Kickboxing": CategoryName.KICKBOXING,
  "Mixed Martial Arts (MMA)": CategoryName.MIXED_MARTIAL_ARTS_MMA,
  "Muay Thai": CategoryName.MUAY_THAI,
  "Pain Management": CategoryName.PAIN_MANAGEMENT,
  "Pilate": CategoryName.PILATE,
  "Powerlifting": CategoryName.POWERLIFTING,
  "Regular Gym Exercise": CategoryName.REGULAR_GYM_EXERCISE,
  "Self Defence Class": CategoryName.SELF_DEFENCE_CLASS,
  "Sound Healing Therapy": CategoryName.SOUND_HEALING_THERAPY,
  "Strengthening": CategoryName.STRENGTHENING,
  "Strength training": CategoryName.STRENGTH_TRAINING,
  "Stress Management": CategoryName.STRESS_MANAGEMENT,
  "Stretching": CategoryName.STRETCHING,
  "Swimming": CategoryName.SWIMMING,
  "Weight Training": CategoryName.WEIGHT_TRAINING,
  "Yoga": CategoryName.YOGA,
  "Zumba": CategoryName.ZUMBA
});

class Price {
  int hour;
  int rate;

  Price({
    required this.hour,
    required this.rate,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        hour: json["hour"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "hour": hour,
        "rate": rate,
      };
}

enum Distance { THE_0_KM }

final distanceValues = EnumValues({"0 km": Distance.THE_0_KM});

enum Rating { THE_050_REVIEW }

final ratingValues = EnumValues({"0/5 (0 Review)": Rating.THE_050_REVIEW});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
