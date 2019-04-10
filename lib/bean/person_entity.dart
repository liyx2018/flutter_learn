class PersonEntity {
	String name;
	String time;
	int age;

	PersonEntity({this.name, this.time, this.age});

	PersonEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		time = json['time'];
		age = json['age'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['time'] = this.time;
		data['age'] = this.age;
		return data;
	}
}
