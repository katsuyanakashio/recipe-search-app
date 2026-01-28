# カテゴリーの作成
categories_data = [
  { name: '和食', description: '日本の伝統的な料理' },
  { name: '洋食', description: '西洋風の料理' },
  { name: '中華', description: '中国料理' },
  { name: 'イタリアン', description: 'イタリア料理' },
  { name: 'デザート', description: 'スイーツとデザート' },
  { name: 'サラダ', description: 'ヘルシーなサラダ' }
]

categories = categories_data.map do |cat_data|
  Category.find_or_create_by!(name: cat_data[:name]) do |category|
    category.description = cat_data[:description]
  end
end

puts "Created #{categories.count} categories"

# レシピの作成
recipes_data = [
  {
    title: 'カレーライス',
    description: '家庭の定番、みんな大好きカレーライス',
    ingredients: "玉ねぎ: 2個\nにんじん: 1本\nじゃがいも: 2個\n豚肉: 300g\nカレールー: 1箱\n水: 800ml",
    instructions: "1. 野菜を一口大に切る\n2. 鍋で肉を炒める\n3. 野菜を加えて炒める\n4. 水を加えて20分煮込む\n5. カレールーを加えて溶かす\n6. さらに10分煮込んで完成",
    cooking_time: 45,
    servings: 4,
    difficulty: '簡単',
    category: categories[0],
    image_url: 'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=800'
  },
  {
    title: 'ハンバーグ',
    description: 'ジューシーで美味しい洋食の定番',
    ingredients: "合い挽き肉: 400g\n玉ねぎ: 1個\nパン粉: 1/2カップ\n卵: 1個\n牛乳: 大さじ2\n塩こしょう: 適量",
    instructions: "1. 玉ねぎをみじん切りにして炒める\n2. ボウルに全ての材料を入れてよく混ぜる\n3. 形を整える\n4. フライパンで両面を焼く\n5. 蓋をして蒸し焼きにする\n6. お好みのソースをかけて完成",
    cooking_time: 30,
    servings: 3,
    difficulty: '普通',
    category: categories[1],
    image_url: 'https://images.unsplash.com/photo-1568660358076-c1d0c8d3c2b5?w=800'
  },
  {
    title: '麻婆豆腐',
    description: 'ピリ辛で食欲をそそる中華料理',
    ingredients: "豆腐: 1丁\n豚ひき肉: 200g\n長ネギ: 1本\nにんにく: 1片\n豆板醤: 大さじ1\n甜麺醤: 大さじ1\n鶏ガラスープ: 200ml",
    instructions: "1. 豆腐を水切りして切る\n2. にんにく、長ネギをみじん切りにする\n3. フライパンでひき肉を炒める\n4. 豆板醤と甜麺醤を加える\n5. スープと豆腐を加えて煮る\n6. 水溶き片栗粉でとろみをつけて完成",
    cooking_time: 25,
    servings: 3,
    difficulty: '普通',
    category: categories[2],
    image_url: 'https://images.unsplash.com/photo-1545247181-516773cae754?w=800'
  },
  {
    title: 'カルボナーラ',
    description: 'クリーミーで濃厚なパスタ',
    ingredients: "スパゲッティ: 200g\nベーコン: 100g\n卵黄: 3個\n生クリーム: 100ml\nパルメザンチーズ: 50g\n黒こしょう: 適量",
    instructions: "1. パスタを茹でる\n2. ベーコンを炒める\n3. ボウルで卵黄、生クリーム、チーズを混ぜる\n4. 茹で上がったパスタとベーコンを混ぜる\n5. 火を止めてソースを絡める\n6. 黒こしょうをふって完成",
    cooking_time: 20,
    servings: 2,
    difficulty: '普通',
    category: categories[3],
    image_url: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=800'
  },
  {
    title: 'チョコレートケーキ',
    description: '濃厚なチョコレートの味わい',
    ingredients: "チョコレート: 200g\nバター: 100g\n砂糖: 100g\n卵: 3個\n薄力粉: 80g\nココアパウダー: 大さじ2",
    instructions: "1. チョコレートとバターを湯煎で溶かす\n2. 砂糖を加えて混ぜる\n3. 卵を1個ずつ加えて混ぜる\n4. 粉類をふるって加える\n5. 型に流して180℃で30分焼く\n6. 冷ましてから型から外して完成",
    cooking_time: 50,
    servings: 6,
    difficulty: '難しい',
    category: categories[4],
    image_url: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=800'
  },
  {
    title: 'シーザーサラダ',
    description: 'クルトン入りの人気サラダ',
    ingredients: "レタス: 1個\nクルトン: 適量\nパルメザンチーズ: 50g\nシーザードレッシング: 適量\nベーコン: 3枚",
    instructions: "1. レタスを洗って一口大にちぎる\n2. ベーコンをカリカリに焼く\n3. ボウルにレタスを入れる\n4. ドレッシングをかける\n5. チーズ、クルトン、ベーコンをトッピング\n6. よく混ぜて完成",
    cooking_time: 15,
    servings: 2,
    difficulty: '簡単',
    category: categories[5],
    image_url: 'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800'
  },
  {
    title: '親子丼',
    description: '鶏肉と卵のハーモニー',
    ingredients: "鶏もも肉: 200g\n玉ねぎ: 1個\n卵: 3個\nだし汁: 200ml\n醤油: 大さじ2\nみりん: 大さじ2\n砂糖: 大さじ1",
    instructions: "1. 鶏肉と玉ねぎを切る\n2. だし汁に調味料を加える\n3. 鶏肉と玉ねぎを煮る\n4. 溶き卵を回し入れる\n5. 半熟になるまで待つ\n6. ご飯に盛り付けて完成",
    cooking_time: 20,
    servings: 2,
    difficulty: '簡単',
    category: categories[0],
    image_url: 'https://images.unsplash.com/photo-1583623025817-d180a2221d0a?w=800'
  },
  {
    title: 'マルゲリータピザ',
    description: 'シンプルで美味しいピザの王道',
    ingredients: "ピザ生地: 1枚\nトマトソース: 100g\nモッツァレラチーズ: 150g\nバジル: 適量\nオリーブオイル: 大さじ1",
    instructions: "1. 生地にトマトソースを塗る\n2. モッツァレラチーズをちぎって並べる\n3. 220℃のオーブンで15分焼く\n4. 焼き上がったらバジルをのせる\n5. オリーブオイルをかける\n6. 熱々を楽しむ",
    cooking_time: 25,
    servings: 2,
    difficulty: '普通',
    category: categories[3],
    image_url: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800'
  }
]

recipes_data.each do |recipe_data|
  Recipe.create!(recipe_data)
end

puts "Created #{Recipe.count} recipes"
puts "Seeding completed!"