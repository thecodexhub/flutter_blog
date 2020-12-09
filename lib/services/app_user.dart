class AppUser {
  AppUser({
    this.uid,
    this.displayName,
    this.photoUrl,
  });
  final String uid;
  final String displayName;
  final String photoUrl;

  AppUser.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        displayName = data['displayName'],
        photoUrl = data['photoUrl'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'photoUrl': photoUrl,
    };
  }
}
