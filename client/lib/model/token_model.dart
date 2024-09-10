import 'dart:convert';

class TokenModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  String? scope;
  String? jti;
  TokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.scope,
    this.jti,
  });

  TokenModel copyWith({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    String? scope,
    String? jti,
  }) {
    return TokenModel(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      scope: scope ?? this.scope,
      jti: jti ?? this.jti,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (accessToken != null) {
      result.addAll({'access_token': accessToken});
    }
    if (tokenType != null) {
      result.addAll({'token_type': tokenType});
    }
    if (expiresIn != null) {
      result.addAll({'expires_in': expiresIn});
    }
    if (scope != null) {
      result.addAll({'scope': scope});
    }
    if (jti != null) {
      result.addAll({'jti': jti});
    }

    return result;
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      accessToken: map['access_token'],
      tokenType: map['token_type'],
      expiresIn: map['expires_in'],
      scope: map['scope'],
      jti: map['jti'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn, scope: $scope, jti: $jti)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TokenModel &&
        other.accessToken == accessToken &&
        other.tokenType == tokenType &&
        other.expiresIn == expiresIn &&
        other.scope == scope &&
        other.jti == jti;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        tokenType.hashCode ^
        expiresIn.hashCode ^
        scope.hashCode ^
        jti.hashCode;
  }
}
