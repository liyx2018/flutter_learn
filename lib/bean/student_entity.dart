class StudentEntity {
	List<StudentScore> score;
	String name;
	int age;

	StudentEntity({this.score, this.name, this.age});

	StudentEntity.fromJson(Map<String, dynamic> json) {
		if (json['score'] != null) {
			score = new List<StudentScore>();
			(json['score'] as List).forEach((v) { score.add(new StudentScore.fromJson(v)); });
		}
		name = json['name'];
		age = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.score != null) {
      data['score'] = this.score.map((v) => v.toJson()).toList();
    }
		data['name'] = this.name;
		data['age'] = this.age;
		return data;
	}
}

class StudentScore {
	String sex;
	int english;
	String xClass;

	StudentScore({this.sex, this.english, this.xClass});

	StudentScore.fromJson(Map<String, dynamic> json) {
		sex = json['sex'];
		english = json['english'];
		xClass = json['class'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sex'] = this.sex;
		data['english'] = this.english;
		data['class'] = this.xClass;
		return data;
	}
}
