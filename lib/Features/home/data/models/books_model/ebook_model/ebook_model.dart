import 'package:equatable/equatable.dart';



class EBooksModel extends Equatable {
  final String title;
  final String imageLink;


  const EBooksModel({required this.title, required this.imageLink});

  factory EBooksModel.fromJson(Map<String, dynamic> json) => EBooksModel(
        title: json['title'],
        imageLink: json['image_link'],
 
            
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'image_link': imageLink,
        
      };

  @override
  List<Object?> get props => [title, imageLink];
}
