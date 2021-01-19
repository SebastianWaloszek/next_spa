import 'package:spa_coding_exercise/data/network/request.dart';

class GetSpaPlacesRequest extends Request<List<String>> {
  GetSpaPlacesRequest()
      : super(
          path: 'spa%20.json',
        );

  @override
  List<String> createResponse(dynamic json) => [];
}
