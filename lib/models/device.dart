class DeviceModel {
  static const ID = "id";
  static const NAME = "name";
  static const OS = "os";
  static const TOKEN = "token";
  static const LOCATION = "location";

  final String id;
  final String name;
  final String os;
  final String token;
  final Map location;

  DeviceModel({this.id, this.name, this.os, this.token, this.location});


}