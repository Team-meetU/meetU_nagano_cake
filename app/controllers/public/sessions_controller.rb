# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

    protected

     # 退会しているかを判断するメソッド
  def public_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @public = Public.find_by(email: params[:public][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@public
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @public.valid_password?(params[:public][:password]) && (@public.is_deleted == false)
    ## 【処理内容3】 is_deletedがtrueなら以下の処理を実行
      #flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_public_registration
    end
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
