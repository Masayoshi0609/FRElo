class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum exercise_frequency: { ほとんどしない: 0, 月に１～２回: 1, 週１～２回: 2, 週３～４回: 3, 週５回以上: 4 }

  # ActiveStorageを使用するための記述
  has_one_attached :image

  belongs_to :body_type
  has_many :posts, dependent: :destroy



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
