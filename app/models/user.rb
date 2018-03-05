class User < ActiveRecord::Base
before_save { self.email = self.email.downcase }

  validates :name, presence: true, length: { maximum: 100 }#　ユーザー名
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #お問い合わせ用Eメール
  validates :RecruitEmail,length: { maximum: 200 } ,uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  #管理用Eメール
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  has_secure_password
  
  #電話番号
  validates :TelNam, length: { maximum: 15 }
  #fax
   validates :fax, length: { maximum: 15 }
  
  #Establishment ,"設立年月日"
  validates :Establishment, length: { maximum: 10 }
  
  #listing ,"上場有無"
  validates :listing, presence: true, length: { maximum: 2}
  
  #資本金　
  validates :Capitalstock, presence: true, length: { maximum: 15 }
  
  #:zipcode ,"郵便番号"
  validates :zipcode, presence: true, length: { maximum: 15 }
  #:dwelling ,"住所"
  validates :dwelling, length: { maximum: 2000 }
  
  #:BuildName ,"建物名"
  validates :BuildName, length: { maximum: 2000 }
  
  #企業公式HP
  validates :officialhp, length: { maximum: 2000 }
  
  ##企業自己紹介
  validates :Profile, length: { maximum: 2000 }
  
  
  #mount_uploader ：avatar,AvatarUploader 
  
  #ここまでがバリデション値
  has_many :microposts
  has_many :itskils
  
   has_many :following_relationships, class_name:  "Relationship",
                                     foreign_key: "follower_id",
                                     dependent:   :destroy
  has_many :following_users, through: :following_relationships, source: :followed
   # 中略
  has_many :follower_relationships, class_name:  "Relationship",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :follower_users, through: :follower_relationships, source: :follower
  # 他のユーザーをフォローする
  def follow(other_user)
    following_relationships.find_or_create_by(followed_id: other_user.id)
  end

  # フォローしているユーザーをアンフォローする
  def unfollow(other_user)
    following_relationship = following_relationships.find_by(followed_id: other_user.id)
    following_relationship.destroy if following_relationship
  end

  # あるユーザーをフォローしているかどうか？
  def following?(other_user)
    following_users.include?(other_user)
  end
  
  def feed_items
    Micropost.where(user_id: following_user_ids + [self.id])
  end
end
