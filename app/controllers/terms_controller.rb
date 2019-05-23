class TermsController < ApplicationController
  def new
    @term = Term.new
  end

  def create
    @term = Term.new(term_params)

    if @term.save
      redirect_to @term, success: "Term created successfully"
    else
      render :new, warning: "Unable to save form. Please try again"
    end
  end

  def show
    @term = Term.find(params[:id])
  end


  private 

  def term_params
    params.require(:term).permit(:year, :season, :start_date, :end_date)
  end
end
