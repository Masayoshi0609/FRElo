# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




BodyType.create!(
  name: "レッドビルダー",
  description: "極限まで筋肉を磨き上げたあなた！ボディを維持するには、日々のトレーニングと健康管理は欠かせません！バディと一緒なら、楽しく鍛えられますよ！"
)

BodyType.create!(
  name: "バイオレットアスリート",
  description: "筋肉質でスポーティーなあなた！さらに筋肉を磨くのもよし、体型を維持するのもよし。バディと一緒にさらなる健康を目指しましょう！"
)

BodyType.create!(
  name: "ブルーフィット",
  description: "健康を意識し、バランスの取れた体型のあなた。ここから身体をさらにスリムにするもよし、筋肉をつけて身体を大きくするのもよし！なりたい自分に向かって、さらに磨きをかけよう！"
)

BodyType.create!(
  name: "シアンスレンダー",
  description: "すらりとした体型のあなた！この身体をキープするのもよし、筋肉をつけてより健康な身体を目指すのも良いでしょう！"
)

BodyType.create!(
  name: "グリーンミディアム",
  description: "標準的な体型のグリーンミディアムのあなた。ここから身体を大きくすることも、痩せることも、筋肉をつけることもあなたの自由です！あなたは、どんな身体にしてきたいですか？？"
)

BodyType.create!(
  name: "イエロープランプ",
  description: "少しぽっちゃり体型なあなた。今の体型を変えるなら、やせたい？筋肉をつけたい？ボディをキープするのもOK！自分の理想の身体を見つけよう！"
)

BodyType.create!(
  name: "オレンジプラス",
  description: "ぽっちゃりな体型のあなた！より健康を手に入れるなら、他の体型を目指すのもアリかもしれませんね！バディと一緒に、新しい自分を探してみましょう！"
)

User.create!(
  name: "test1",
  email: "test@email",
  password: "test1pass",
  weight: "70",
  height: "175",
  exercise_frequency: "週５回以上",
  fat_percentage: "20",
  body_type_id: "6"
  )

User.create!(
  name: "test2",
  email: "test2@email",
  password: "test1pass",
  weight: "70",
  height: "175",
  exercise_frequency: "週３～４回",
  fat_percentage: "12",
  body_type_id: "6"
  )
