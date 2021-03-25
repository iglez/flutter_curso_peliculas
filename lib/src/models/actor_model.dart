// https://api.themoviedb.org/3/movie/587807/credits?api_key=99568c3e97fec3b5e291a3ab8ab92f64&language=en-US
// Generated by https://quicktype.io

class Cast {
  List<Actor> actores = List();

  Cast.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) {
      return;
    }

    jsonList.forEach((element) {
      actores.add(Actor.fromJsonMap(element));
    });
  }
}

class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String department;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Actor.fromJsonMap(Map<String, dynamic> jsonMap) {
    adult = jsonMap['adult'];
    gender = jsonMap['gender'];
    id = jsonMap['id'];
    knownForDepartment = jsonMap['known_for_department'];
    name = jsonMap['name'];
    originalName = jsonMap['original_name'];
    popularity = jsonMap['popularity'];
    profilePath = jsonMap['profile_path'];
    castId = jsonMap['cast_id'];
    character = jsonMap['character'];
    creditId = jsonMap['credit_id'];
    order = jsonMap['order'];
    department = jsonMap['department'];
    job = jsonMap['job'];
  }

  getPhoto() {
    if (profilePath == null) {
      return 'https://www.speakingtigerbooks.com/wp-content/uploads/2018/07/no-avatar.jpg';
    }

    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
