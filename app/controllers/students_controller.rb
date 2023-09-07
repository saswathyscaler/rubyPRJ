class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
      
  end

  def edit
    @student = Student.find(params[:id])

  end

  def update
    @student = Student.find(params[:id])
    @student.update(studetn_params)
    redirect_to students_path
    

    
  end


  def create
    student = Student.create(studetn_params)
    redirect_to students_path
    
  end

  def new
    @student =Student.new
  end


def destroy
  @student = Student.find(params[:id])
  @student.destroy
redirect_to students_path
  
end



  private


  def studetn_params
    params.require(:student).permit(:name,:age)
  end

end
