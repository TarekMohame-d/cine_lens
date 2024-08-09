// import 'package:hive_flutter/hive_flutter.dart';

// class HiveHelper {
//   static Future<void> initHive() async {
//     await Hive.initFlutter();
//     // Hive.registerAdapter(IpConfigDataAdapter());
//     // Hive.registerAdapter(TeamAdapter());
//     // Hive.registerAdapter(VenueAdapter());
//   }

//   static Future<void> openBoxes() async {
//     // await Hive.openBox<IpConfigData>(HiveBoxes.ipConfigBox);
//     // await Hive.openBox<Team>(HiveBoxes.teamsBox);
//     // await Hive.openBox<Venue>(HiveBoxes.venuesBox);
//   }

//   static Future<void> saveData<T>({
//     required String boxName,
//     required String key,
//     required T data,
//   }) async {
//     var box = Hive.box<T>(boxName);
//     await box.put(key, data);
//     //await box.close();
//   }

//   static Future<T?> getData<T>({
//     required String boxName,
//     required String key,
//   }) async {
//     var box = Hive.box<T>(boxName);
//     T? data = box.get(key);
//     //await box.close();
//     return data;
//   }

//   Future<void> updateData<T>({
//     required String boxName,
//     required String key,
//     required T data,
//   }) async {
//     saveData<T>(
//       boxName: boxName,
//       key: key,
//       data: data,
//     );
//   }

//   static Future<bool> hasData<T>({
//     required String boxName,
//   }) async {
//     var box = Hive.box<T>(boxName);
//     bool hasData = box.isNotEmpty;
//     //await box.close();
//     return hasData;
//   }

//   static Future<List<T>> getAllData<T>({
//     required String boxName,
//   }) async {
//     var box = Hive.box<T>(boxName);
//     List<T> allData = box.values.toList();
//     //await box.close();
//     return allData;
//   }

//   static Future<void> deleteAllData<T>({
//     required String boxName,
//   }) async {
//     var box = Hive.box<T>(boxName);
//     await box.clear();
//     //await box.close();
//   }
// }

// class HiveBoxes {
//   // Boxes names
//   static const String ipConfigBox = 'ipConfigBox';
//   static const String teamsBox = 'teamsBox';
//   static const String venuesBox = 'venuesBox';

//   // Boxes keys
//   static const String ipConfigBoxKey = 'ipConfig';
// }
