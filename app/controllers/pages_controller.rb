class PagesController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_subject
  
  def index
    @pages = @subject.pages.sorted
  end
  
  def show
    @page = Page.find(params[:id])
    @sections = @page.sections.sorted
  end
  
  def new
      @page = Page.new({subject_id: @subject.id})
      @subjects = Subject.sorted
  end
  
  def create
      @page = Page.new(page_params)
      if @page.save
        flash[:success] = "Страница создана успешно."
        redirect_to action: 'index', subject_id: @subject.id
      else
        @subjects = Subject.order('position ASC')
        render 'new'
      end
  end
  
  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.sorted
  end
    
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:success] = "Обновлено успешно"
      redirect_to action: "index", subject_id: @subject.id
    else
      @subjects = Subject.sorted
      render "edit"
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    if @page.destroy
      redirect_to action: "index", subject_id: @subject.id
    end
  end
  
  private
    def page_params
      params.require(:page).permit(:subject_id, :title, :link, :position, :visible)
    end
  
    def find_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end
end
