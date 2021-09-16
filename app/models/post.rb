class Post < ApplicationRecord
  # ActiveStorageを使用するための記述
  has_one_attached :image


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

  def post_params
    params.require(:post).permit(:body, :image)
  end

end
