class User < ApplicationRecord
    attr_reader :password
    before_validation :ensure_session_token
    validates :username,:email,:password,presence:{message:"moraju biti prisutni"}
    validates :password,length:{minimum:6,allow_nil:true}
    def self.find_by_credientials(username,password)
        user=User.find_by(username:username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(self.password)
    end
    def password=(password)
        @password=password
        self.password_digest=BCrypt::Password.create(password)
    end
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end
    def reset_session_token!
        self.session_token=self.class.generate_session_token
        self.session_token
    end
    private
    def ensure_session_token
        self.session_token||=self.class.generate_session_token
    end
end