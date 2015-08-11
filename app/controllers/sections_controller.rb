class SectionsController < ApplicationController
  
  before_action :find_page
  
  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @pages = Page.sorted
  end
  
  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to @section
    else
      @pages = Page.sorted  
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.sorted
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      redirect_to @section
    else
      @pages = Page.sorted
      render "edit"
    end
  end
  
  def destroy
    @section = Section.find(params[:id])
    if @section.destroy
      redirect_to @section.page
    end
  end
  
  private
    def section_params
      params.require(:section).permit(:page_id, :title, :content, :position, :visible)
    end
    
    def find_page
      if params[:page_id]
        @page = Page.find(params[:page_id])
      end
    end
end
