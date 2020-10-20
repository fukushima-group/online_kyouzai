class UnitsController < ApplicationController

  def index
    binding.pry
    unit = Unit.find(params[:unit_id])
    @units = unit.children
  end
end
