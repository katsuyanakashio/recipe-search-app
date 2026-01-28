class ApplicationController < ActionController::Base
  # CSRFトークン検証を有効化
  protect_from_forgery with: :exception
  
  # グローバルなヘルパーメソッド
  helper_method :current_user
  
  private
  
  def current_user
    # ユーザー認証を実装する場合はここに追加
    nil
  end
end