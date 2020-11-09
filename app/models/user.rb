class User < ApplicationRecord
    attr_reader :password
    before_validation :ensure_session_token
    validates :username,:email,:password_digest,presence:{message:"moraju biti prisutni"}
    validates :password,length:{minimum:6,allow_nil:true}

    ###
    #asocijacije
    has_many :konto_klase,class_name:"Konto1Klasa",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :konto_grupe,class_name:"Konto2Grupa",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :konto_sintetike,class_name:"Konto3Sintetika",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :konto_objekti_prometa,class_name:"Konto4ObjektiPrometas",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :konto_racuni,class_name:"Konto5Racuni",primary_key: :id,foreign_key: :user_id,dependent: :destroy



    ###


    def self.find_by_credientials(username,password)
        user=User.find_by(username:username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
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
        self.save!
        self.session_token
    end
    private
    def ensure_session_token
        self.session_token||=self.class.generate_session_token
    end
end