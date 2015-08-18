class UsersController < ApplicationController
  
  before_action :confirm_logged_in, except: [:login, :attempt_login]
  
  def admin
  end
  
  def login
  end
  
  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.find_by_email(params[:email])
      
      if found_user
        if found_user.authenticate params[:password]
          session[:user_id] = found_user.id
          session[:name] = found_user.name
          flash[:success] = "Добро пожаловать, #{session[:name]}"
          redirect_to action: "admin"
        else
          flash[:danger] = "Неверный логин/пароль"
          redirect_to action: "login"    
        end
      else
        flash[:danger] = "Неверный логин/пароль"
        redirect_to action: "login"  
      end
    else
      flash[:danger] = "Неверный логин/пароль"
      redirect_to action: "login"
    end
  end
  
  def logout
    # удаление текущей сессии
    session[:user_id] = nil
    session[:name] = nil
    flash[:success] = "Вы успешно вышли"
    redirect_to(:action => "login")
  end

  
  def index
     @users = User.all
  end
  
  def new
      @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Добро пожаловать в Simple CMS!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
   @user = User.find(params[:id])
  end
  
  def edit
      @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Пользователь обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Пользователь успешно удален"
      redirect_to action: "index"
    end
  end

  
    private
  
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

  
end
