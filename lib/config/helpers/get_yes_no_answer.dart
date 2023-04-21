import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('http://yesno.wtf./api');
    _dio.options.validateStatus = (status) => true;

    final yesNoModel = YesNoModeel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
