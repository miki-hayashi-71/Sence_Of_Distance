class UsersController < ApplicationController
	# ユーザーがログインしていなくても新規登録ページにアクセスできるように設定
	# skip_before_action :require_login, only: %i[new create]

	# 新規ユーザーの登録フォームを表示するためのアクション
  def new
    @user = User.new
  end

	# 新しいユーザーを作成するためのアクション
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

	# フォームから送信されたパラメータを受け取る
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
