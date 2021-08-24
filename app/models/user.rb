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
    has_many :korisnici,class_name:"Korisnici",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :partneri,class_name:"Partneri",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :poreske_tarife,class_name:"PoreskeTarife",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :robe,class_name:"Robas",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :tip_robe,class_name:"TipRobe",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :magacini,class_name:"Magacini",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :oznaka_objekta_prometa,class_name:"OznakaObjektaPrometas",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :promena_tips,class_name:"PromenaTip",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :promene,class_name:"Promene",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :promet_dokumenta,class_name:"PrometDokumentas",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :transakcije,class_name:"Transakcije",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    has_many :transakcije_grupe,class_name:"TransakcijeGrupe",primary_key: :id,foreign_key: :user_id,dependent: :destroy
    ###
    def self.find_by_credientials(username,password)
        user=User.find_by(username:username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    #mi ne cuvamo password u bazi samo password digest koristeci BCrypt
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
    #generisanje session tokena pre kreiranja korisnika
    def ensure_session_token
        self.session_token||=self.class.generate_session_token
    end
end