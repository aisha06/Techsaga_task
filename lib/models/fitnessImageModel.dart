// To parse this JSON data, do
//
//     final fitnesImages = fitnesImagesFromJson(jsonString);

import 'dart:convert';

FitnesImages fitnesImagesFromJson(String str) =>
    FitnesImages.fromJson(json.decode(str));

String fitnesImagesToJson(FitnesImages data) => json.encode(data.toJson());

class FitnesImages {
  bool status;
  String message;
  String messageIos;
  List<CityList> cityList;
  List<Datum> data;

  FitnesImages({
    required this.status,
    required this.message,
    required this.messageIos,
    required this.cityList,
    required this.data,
  });

  factory FitnesImages.fromJson(Map<String, dynamic> json) => FitnesImages(
        status: json["status"],
        message: json["message"],
        messageIos: json["message_ios"],
        cityList: List<CityList>.from(
            json["city_list"].map((x) => CityList.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "message_ios": messageIos,
        "city_list": List<dynamic>.from(cityList.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CityList {
  int id;
  String cityName;
  double geoLatitude;
  double geoLongitude;

  CityList({
    required this.id,
    required this.cityName,
    required this.geoLatitude,
    required this.geoLongitude,
  });

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
        id: json["id"],
        cityName: json["city_name"],
        geoLatitude: json["geo_latitude"]?.toDouble(),
        geoLongitude: json["geo_longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
        "geo_latitude": geoLatitude,
        "geo_longitude": geoLongitude,
      };
}

class Datum {
  int gymId;
  String gymName;
  String gymLogo;
  List<String> gymImages;
  String address;
  String cityName;
  String description;
  String howToGet;
  String partnerName;
  String partnerEmail;
  String partnerPhone;
  String phoneCode;
  String latitude;
  String longitude;
  List<Amenity> amenities;
  List<String> gymImages2;
  String open;
  Rating rating;
  List<Category> categories;
  String distance;
  String imgPath;
  String avaliableSlots;

  Datum({
    required this.gymId,
    required this.gymName,
    required this.gymLogo,
    required this.gymImages,
    required this.address,
    required this.cityName,
    required this.description,
    required this.howToGet,
    required this.partnerName,
    required this.partnerEmail,
    required this.partnerPhone,
    required this.phoneCode,
    required this.latitude,
    required this.longitude,
    required this.amenities,
    required this.gymImages2,
    required this.open,
    required this.rating,
    required this.categories,
    required this.distance,
    required this.imgPath,
    required this.avaliableSlots,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        gymId: json["gym_id"],
        gymName: json["gym_name"],
        gymLogo: json["gym_logo"],
        gymImages: List<String>.from(json["gym_images"].map((x) => x)),
        address: json["address"],
        cityName: json["city_name"],
        description: json["description"],
        howToGet: json["how_to_get"],
        partnerName: json["partner_name"],
        partnerEmail: json["partner_email"],
        partnerPhone: json["partner_phone"],
        phoneCode: json["phone_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        amenities: List<Amenity>.from(
            json["amenities"].map((x) => Amenity.fromJson(x))),
        gymImages2: List<String>.from(json["gym_images2"].map((x) => x)),
        open: json["open"],
        rating: ratingValues.map[json["rating"]]!,
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        distance: json["distance"],
        imgPath: json["img_path"],
        avaliableSlots: json["avaliable_slots"],
      );

  Map<String, dynamic> toJson() => {
        "gym_id": gymId,
        "gym_name": gymName,
        "gym_logo": gymLogo,
        "gym_images": List<dynamic>.from(gymImages.map((x) => x)),
        "address": address,
        "city_name": cityName,
        "description": description,
        "how_to_get": howToGet,
        "partner_name": partnerName,
        "partner_email": partnerEmail,
        "partner_phone": partnerPhone,
        "phone_code": phoneCode,
        "latitude": latitude,
        "longitude": longitude,
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "gym_images2": List<dynamic>.from(gymImages2.map((x) => x)),
        "open": open,
        "rating": ratingValues.reverse[rating],
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "distance": distance,
        "img_path": imgPath,
        "avaliable_slots": avaliableSlots,
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
  HIIT,
  HYPERTROPHY,
  JIU_JITSU,
  KARATE_TRAINING,
  KICKBOXING,
  KRAV_MAGA,
  MARTIAL_ARTS_TRAINING,
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
  TAEKWONDO,
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
  "HIIT": CategoryName.HIIT,
  "Hypertrophy": CategoryName.HYPERTROPHY,
  "jiu-jitsu": CategoryName.JIU_JITSU,
  "Karate Training": CategoryName.KARATE_TRAINING,
  "Kickboxing": CategoryName.KICKBOXING,
  "Krav Maga": CategoryName.KRAV_MAGA,
  "Martial Arts Training": CategoryName.MARTIAL_ARTS_TRAINING,
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
  "Taekwondo": CategoryName.TAEKWONDO,
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
