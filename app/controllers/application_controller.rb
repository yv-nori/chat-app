class ApplicationController < ActionController::Base
  # ログイン認証
  before_action :authenticate_user!
  # デバイズのコントローラーが実行された時のみストロングパラメーラー
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ストロングパラメーター（ユーザー登録）
  private
  def configure_permitted_parameters
    # devise_parameter_sanitizerメソッドは特定のカラムを許容するメソッド
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
