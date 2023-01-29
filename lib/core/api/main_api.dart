import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:poisk_raboty/core/api/rest_api.dart';

@Injectable()
class MainApi {
  const MainApi();

  RestClient client() {
    final dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    return RestClient(dio, baseUrl: "https://api.escuelajs.co/api/v1/");
  }
}
