import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModeel {
  YesNoModeel({
    this.answer,
    this.forced,
    this.image,
  });

  String? answer;
  bool? forced;
  String? image;

  factory YesNoModeel.fromJsonMap(Map<String, dynamic> json) => YesNoModeel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.receiver,
      imageUrl: image);
}
