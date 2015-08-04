class StaticPagesController < ApplicationController
  
  def home
    @subject = Subject.all
  end

  def about
  end

  def help
  end

  def contact
  end
end
