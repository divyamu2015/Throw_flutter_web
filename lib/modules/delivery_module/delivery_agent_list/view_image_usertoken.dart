import 'package:firebase_storage/firebase_storage.dart';

Future<String> getLicenseImageUrl(String path) async {
  return await FirebaseStorage.instance.refFromURL(path).getDownloadURL();
}
