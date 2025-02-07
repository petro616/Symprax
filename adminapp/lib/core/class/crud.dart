import 'dart:convert';
import 'dart:io';
import 'package:AdminApp/core/class/status_request.dart';
import 'package:AdminApp/core/function/check_internet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicauth =
    'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
Map<String, String> _myheaders = {
//'content-type" : 'application/json',
//'accept" : 'application/json',
  'authorization': _basicauth
};

class Crud {
  Future<Either<StatusRequest, Map>> postdata(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);

    var request = http.MultipartRequest("POST", uri);

    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();

      var stream = http.ByteStream(image.openRead());

      stream.cast();

      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));

      request.files.add(multipartFile);
    }

    // add Data to request

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // add Data to request

    // Send Request

    var myrequest = await request.send();

    // For get Response Body

    var response = await http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);

      Map responsebody = jsonDecode(response.body);

      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageList(
    url,
    data,
    List<File> images, // List of images to upload
    [
    String? namerequest,
  ] // Optional field name prefix
      ) async {
    if (namerequest == null) {
      namerequest = "files"; // Default field name prefix
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    // Add images to the request
    for (var i = 0; i < images.length; i++) {
      var image = images[i];
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      var multipartFile = http.MultipartFile(
        "$namerequest${i + 1}", // Field name for the image (e.g., "files1", "files2")
        stream,
        length,
        filename: basename(image.path),
      );
      request.files.add(multipartFile);
    }

    // Add other form data
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    // Send request
    var myrequest = await request.send();

    // Get response
    var response = await http.Response.fromStream(myrequest);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
