class ContactModel {
  final String uid;
  final String name;
  final bool isOnline;
  final String imageUrl;
  final String lastSeen;
  final String phoneNumber;

  ContactModel({
    required this.uid,
    required this.name,
    required this.isOnline,
    required this.imageUrl,
    required this.lastSeen,
    required this.phoneNumber,
  });

  factory ContactModel.fromMap({required Map<String, dynamic> data}) {
    return ContactModel(
      uid: data['uid'],
      name:'${data['firstName']} ${data['lastName']} ',
      isOnline: data['isOnline'],
      imageUrl: data['imageUrl'],
      lastSeen: data['lastSeen'],
      phoneNumber: data['phoneNumber'],
    );
  }
}
