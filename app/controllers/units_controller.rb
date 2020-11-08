class UnitsController < ApplicationController
  # protect_from_forgery

  # def create
  #   unit = Unit.find(params[:_json])
  #   @units = unit.children
  # end

  def index
    unit = Unit.find(params[:unit_id])
    if unit.children.length != 0
      ## 「/exams/_unit_form.html.erb」に「unit.children」を渡した時の結果を文字列で受け取る
      html = render_to_string partial: '/exams/unit_form', locals: {units: unit.children, selected: nil}
    else
      html = nil
    end
    render json: { html: html }
  end

end
