enum EnvType { dev, staging, prod }

class Env {
  static EnvType env = EnvType.dev;

  static void setEnv(dynamic newEnv) {
    env = newEnv.runtimeType == String ? getEnvEnum(newEnv as String) : newEnv;
    // env = newEnv;
  }

  static String get baseUrl {
    switch (env) {
      case EnvType.dev:
        return "https://api-dev.scavengehunt.com";
      case EnvType.staging:
        return "https://api-staging.scavengehunt.com";
      case EnvType.prod:
        return "https://api.scavengehunt.com";
    }
  }

  static String get appTag {
    switch (env) {
      case EnvType.dev:
        return "DEV";
      case EnvType.staging:
        return "STAGING";
      case EnvType.prod:
        return "PROD";
    }
  }

  static getEnvEnum(String myenv) {
    return EnvType.values.firstWhere((fenv) => fenv.toString().split('.').last == myenv, orElse: () => EnvType.dev);
  }
}
