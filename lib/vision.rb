require 'base64'
require 'json'
require 'net/https'

module Vision
  class << self
    def get_image_data(image_file)
      # APIのURL作成
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_API_KEY']}"

      # 画像をbase64にエンコード
      dir_tree =  image_file.key.scan(/.{1,#{2}}/)
      base64_image = Base64.encode64(open("#{Rails.root}/public/uploads/#{dir_tree[0]}/#{dir_tree[1]}/#{image_file.key}").read)

      # APIリクエスト用のJSONパラメータ
      params = {
        requests: [{
          image: {
            content: base64_image
          },
          features: [
            {
              type: 'SAFE_SEARCH_DETECTION' # セーフサーチ機能を指定する
            }
          ]
        }]
      }.to_json

      # Google Cloud Vision APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      response_body = JSON.parse(response.body)

      # APIレスポンス出力
      if (error = response_body['responses'][0]['error']).present?
        raise error['message']
      elsif
        # 解析結果が「LIKELY」又は「VERY_LIKELY」を含む場合はfalse、それ以外はtrueを返す
        response_body.values.include?(:LIKELY) || response_body.values.include?(:VERY_LIKELY)
        return false
      else
        return true
      end

    end
  end
end