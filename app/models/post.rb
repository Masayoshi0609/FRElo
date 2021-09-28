class Post < ApplicationRecord

  # ActiveStorageを使用するための記述
  has_one_attached :image

  #ActiveStorageの画像用バリデーション
  validate :image_type

  validates :body, presence: true, length: { maximum: 120}

  belongs_to :user

  #コメント機能に関するアソシエーション
  has_many :comments, dependent: :destroy

  #いいね機能に関するアソシエーション
  has_many :likes, dependent: :destroy

  def liked_by?(user)
   likes.where(user_id: user.id).exists?
  end


  #以下はタグ付け機能に関する記述

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_tag
    end
  end

  #検索機能に関する記述

  def self.search(search, word)
   if search == "forward_match"
    @post = Post.where("body LIKE?", "#{word}%")
   elsif search == "backward_match"
    @post = Post.where("body LIKE?", "%#{word}")
   elsif search == "perfect_match"
    @post = Post.where(body: "#{word}")
   elsif search == "partial_match"
    @post = Post.where("body LIKE?", "%#{word}%")
   else
    @post = Post.all
   end
  end



private

 # jpeg、もしくはpng以外の拡張子ファイルだとエラーで返すようにする
  def image_type
    if self.image.attached? && !image.blob.content_type.in?(%('image/jpeg image/png image/jpg'))
      image.purge
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

end
