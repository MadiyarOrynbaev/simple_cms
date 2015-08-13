class StaticPagesController < ApplicationController
  
  def home
  end

  def about
  end

  def help
  end

  def contact
  end
  
  def show
  	@page = Page.where(link: params[:link], visible: true).first
  	if @page.nil?
  	  redirect_to(action: 'home')
  	else
  	  
  	end
  end

  
end
