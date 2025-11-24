class MovieSchedule {
  final String time;
  final String studio;

  MovieSchedule({required this.time, required this.studio});

  Map<String, dynamic> toMap() {
    return {'time': time, 'studio': studio};
  }

  factory MovieSchedule.fromMap(Map<String, dynamic> map) {
    return MovieSchedule(time: map['time'], studio: map['studio']);
  }
}

class Movie {
  final int id;
  final String title;
  final String genre;
  final double price;
  final String posterUrl;
  final List<MovieSchedule> schedules;
  final String description;
  final int duration;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.price,
    required this.posterUrl,
    required this.schedules,
    required this.description,
    required this.duration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'genre': genre,
      'price': price,
      'posterUrl': posterUrl,
      'description': description,
      'duration': duration,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      genre: map['genre'],
      price: map['price'],
      posterUrl: map['posterUrl'],
      schedules: [],
      description: map['description'],
      duration: map['duration'],
    );
  }
}
