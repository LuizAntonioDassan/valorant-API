class dataAgent {
  int? status;
  List<Data>? data;

  dataAgent({this.status, this.data});

  dataAgent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List<String>? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  List<Abilities>? abilities;
  VoiceLine? voiceLine;

  Data(
      {this.uuid,
        this.displayName,
        this.description,
        this.developerName,
        this.characterTags,
        this.displayIcon,
        this.displayIconSmall,
        this.bustPortrait,
        this.fullPortrait,
        this.fullPortraitV2,
        this.killfeedPortrait,
        this.background,
        this.backgroundGradientColors,
        this.assetPath,
        this.isFullPortraitRightFacing,
        this.isPlayableCharacter,
        this.isAvailableForTest,
        this.isBaseContent,
        this.role,
        this.abilities,
        this.voiceLine});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    developerName = json['developerName'];
    characterTags = json['characterTags'].cast<String>();
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = json['bustPortrait'];
    fullPortrait = json['fullPortrait'];
    fullPortraitV2 = json['fullPortraitV2'];
    killfeedPortrait = json['killfeedPortrait'];
    background = json['background'];
    backgroundGradientColors = json['backgroundGradientColors'].cast<String>();
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    isPlayableCharacter = json['isPlayableCharacter'];
    isAvailableForTest = json['isAvailableForTest'];
    isBaseContent = json['isBaseContent'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    voiceLine = json['voiceLine'] != null
        ? new VoiceLine.fromJson(json['voiceLine'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['developerName'] = this.developerName;
    data['characterTags'] = this.characterTags;
    data['displayIcon'] = this.displayIcon;
    data['displayIconSmall'] = this.displayIconSmall;
    data['bustPortrait'] = this.bustPortrait;
    data['fullPortrait'] = this.fullPortrait;
    data['fullPortraitV2'] = this.fullPortraitV2;
    data['killfeedPortrait'] = this.killfeedPortrait;
    data['background'] = this.background;
    data['backgroundGradientColors'] = this.backgroundGradientColors;
    data['assetPath'] = this.assetPath;
    data['isFullPortraitRightFacing'] = this.isFullPortraitRightFacing;
    data['isPlayableCharacter'] = this.isPlayableCharacter;
    data['isAvailableForTest'] = this.isAvailableForTest;
    data['isBaseContent'] = this.isBaseContent;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    if (this.voiceLine != null) {
      data['voiceLine'] = this.voiceLine!.toJson();
    }
    return data;
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role(
      {this.uuid,
        this.displayName,
        this.description,
        this.displayIcon,
        this.assetPath});

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['displayIcon'] = this.displayIcon;
    data['assetPath'] = this.assetPath;
    return data;
  }
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['displayIcon'] = this.displayIcon;
    return data;
  }
}

class VoiceLine {
  double? minDuration;
  double? maxDuration;
  List<MediaList>? mediaList;

  VoiceLine({this.minDuration, this.maxDuration, this.mediaList});

  VoiceLine.fromJson(Map<String, dynamic> json) {
    minDuration = json['minDuration'];
    maxDuration = json['maxDuration'];
    if (json['mediaList'] != null) {
      mediaList = <MediaList>[];
      json['mediaList'].forEach((v) {
        mediaList!.add(new MediaList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minDuration'] = this.minDuration;
    data['maxDuration'] = this.maxDuration;
    if (this.mediaList != null) {
      data['mediaList'] = this.mediaList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaList {
  int? id;
  String? wwise;
  String? wave;

  MediaList({this.id, this.wwise, this.wave});

  MediaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wwise = json['wwise'];
    wave = json['wave'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wwise'] = this.wwise;
    data['wave'] = this.wave;
    return data;
  }
}
