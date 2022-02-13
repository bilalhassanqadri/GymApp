class Trainers{
  final int id;
  final String name;
  final String image;
  final String back_image;
  final int gender;
  final int level;
  final int trainer_type_id;
  final int available_slos;
  final double Trainer_rating;
  final String email;
  final int experience;
  final String Qualification;
  final String Intrests;
  final String training_at;
  final String insta_link;
  final String about_trainer;


  const Trainers({this.id,this.name,this.image,this.back_image,this.gender,this.level,this.trainer_type_id,this.available_slos,
    this.Trainer_rating,this.email,this.experience,this.Qualification,this.Intrests,this.training_at,this.insta_link,this.about_trainer});
}
List<Trainers> trainers = [];