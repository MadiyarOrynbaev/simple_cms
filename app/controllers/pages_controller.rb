class PagesController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_subject
  
  def index
    @pages = @subject.pages.sorted
  end
  
  def new
      @page = Page.new({subject_id: @subject.id, name: "Default"})
      @subjects = Subject.sorted
  end
  
  def create
      @page = Page.new(page_params)
      if @page.save
        flash[:notice] = "Страница создана успешно."
        redirect_to action: 'index', subject_id: @subject.id
      else
        @subjects = Subject.order('position ASC')
        render 'new'
      end
  end
  
  private
    def page_params
      params.require(:page).permit(:subject_id, :name, :link, :position, :visible)
    end
  
    def find_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end
  
end
