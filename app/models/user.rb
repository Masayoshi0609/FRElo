class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum exercise_frequency: { ほとんどしない: 0, 月に１～２回: 1, 週１～２回: 2, 週３～４回: 3, 週５回以上: 4 }

  # ActiveStorageを使用するための記述
  has_one_attached :image

  belongs_to :body_type
  has_many :posts, dependent: :destroy


  #フォロー機能実装の為の記述
  #被フォロー関係を通じて参照→followed_idをフォローしている人
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 与フォロー関係を通じて参照→follower_idをフォローしている人
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  #いいね機能に関するアソシエーション
  has_many :likes, dependent: :destroy
  #下記の記述により、view側でいいねしたツイートを取得しやすくする
  has_many :like_posts, through: :likes, source: :post


  #コントローラー側でフォロー機能を動作させるためのメソッド定義
  def follow(user_id)
   relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
   relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
   followings.include?(user)
  end



  #ActiveStorage使用のための記述だが、導入までコメントアウトしておく。
  # validate :image_type

private

  #jpeg、もしくはpng以外の拡張子ファイルだとエラーで返すようにする
  #image_typeに関する記述でエラーが出て進まないので、一旦コメントアウトする。
  # def image_type
  #   if !image.blob.content_type.in?(%('image/jpeg image/png'))
  #     image.purge
  #     errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
  #   end
  # end


end
