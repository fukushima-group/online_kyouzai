class UnitsController < ApplicationController
  protect_from_forgery

  def create
    unit = Unit.find(params[:_json])
    @units = unit.children
  end

end
