module MeducationSDK
  class Friendship < Loquor::Resource
    self.path = "/friendships"

    def user
      @user ||= User.find(user_id)
    end

    def friend
      @friend ||= User.find(friend_id)
    end
  end

  class FriendshipMock < Friendship
    extend Loquor::ResourceMock

    self.attributes = {
      id: 1,
      user_id: 8,
      friend_id: 9,
      accept_code: "asdsad21312e"
    }
  end
end
