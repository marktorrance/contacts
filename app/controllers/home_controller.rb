class HomeController < ApplicationController
  def index
    @people = Person.all
  end

  def dist
    @people = Person.all
  end

end
