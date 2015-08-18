class SubjectsController < ApplicationController
  
  before_action :confirm_logged_in, except: :show
  
  
  def index
    @subjects = Subject.sorted
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to @subject
    else
      render 'new'
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      redirect_to @subject
    else
      render 'edit'
    end
  end
  
  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:success] = "Удалено успешно"
      redirect_to action: "index"
    end
  end
  
  private
  
  def subject_params
    params.require(:subject).permit(:title,
                  :position, :visible)
  end
end
