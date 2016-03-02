class User < ActiveRecord::Base
  def self.find_or_create_from_auth_hash(h)
    User.find_or_create_by!(github_uid: h[:uid]).tap do |u|
      u.update!(
        username: h[:info][:nickname],
        token: h[:credentials][:token],
        secret: h[:credentials][:secret],
        token_expires_at: h[:credentials][:expires_at]
      )
    end
  end
end
