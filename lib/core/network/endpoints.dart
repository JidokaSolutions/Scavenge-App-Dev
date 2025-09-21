class Endpoints {
  // Authentication
  static const login = "/auth/login";
  static const register = "/auth/register";
  // static const refreshToken = "/auth/refresh";
  // static const logout = "/auth/logout";

  // User Management
  static const users = "/users";
  static const userById = "/users/{user_id}";

  // Friends Management
  static const userFriends = "/users/{user_id}/friends";
  static const addRemoveFriend = "/users/{user_id}/friends/{friend_id}";

  // Hunt Management
  static const hunts = "/hunts";
  static const huntById = "/hunts/{hunt_id}";
}
