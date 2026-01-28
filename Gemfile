source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.8'

# Rails本体
gem 'rails', '~> 8.1.0'

# データベース
gem 'sqlite3', '~> 2.1'

# アセットパイプライン
gem 'sprockets-rails'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

# サーバー
gem 'puma', '~> 6.0'

# その他
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false

# 検索機能
gem 'ransack'

# ページネーション
gem 'kaminari'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'faker'
end

group :development do
  gem 'web-console'
end