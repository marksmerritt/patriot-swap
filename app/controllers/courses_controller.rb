class CoursesController < ApplicationController
  def new 
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, success: "Course created successfully"
    else
      render :new, warning: "Unable to create Course. Please try again."
    end
  end

  def show
    @course = Course.find(params[:id])
  end


  private 

  def course_params
    params.require(:course).permit(:code, :title)
  end
end
