require 'base64'
require 'json'
require 'net/https'

module Vision
  class << self
    def get_image_data(image_file)
      # APIのURL作成
      api_url = "https://vision.googleapis.com/v1/images:annotate?key=#{ENV['GOOGLE_API_KEY']}"

      # 画像をbase64にエンコード

      # dir_tree =  image_file.key.scan(/.{1,#{2}}/)　この変数はS3を使った記述だと不要に思われる
      base64_image = Base64.encode64(open(image_file.service_url).read)

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
        # ["VERY_UNLIKELY", "VERY_UNLIKELY", "UNLIKELY", "VERY_UNLIKELY", "VERY_UNLIKELY"]
        response_body["responses"].first["safeSearchAnnotation"].values.each do |v|
          if !v.include?("UN")
            return false
          end
        end

        return true
      else
        return true
      end

    end
  end
end