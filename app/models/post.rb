class Post < ApplicationRecord
  # ActiveStorageを使用するための記述
  has_one_attached :image

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



  #バリデーション実装時に検証する必要あり
  # validate :image_type


private

  #jpeg、もしくはpng以外の拡張子ファイルだとエラーで返すようにする
  #エラーが出るため、一旦コメントアウト
  # def image_type
  #   if !image.blob.content_type.in?(%('image/jpeg image/png'))
  #     image.purge
  #     errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
  #   end
  # end

  # def post_params
  #   params.require(:post).permit(:body, :image)
  # end

end
