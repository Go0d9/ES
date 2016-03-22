class StudentsController < ApplicationController
	def index
		@students = Student.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @students }
		end
	end
	def show
		@student = Student.find(params[:id])
		unless @student
			render text: "Page not faind", status: 404			
		end
	end
	def new
		@student = Student.new

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @student }
		end		
	end
	def edit
		@student = Student.find(params[:id])
		
	end

	def create
		@student = Student.new(student_params)

		respond_to do |format|
			if @student.save 
				format.html { redirect_to @student, notice: 'Student was successfully created.' }
				format.json {render json: @student, status: :created, location: @student }
			else
				format.html {render action: "new"}
				format.json {render json: @student.errors, status: unprocessable_entity}
			end				
		end	
	end



	def update
		@student = Student.find(params[:id])
		respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
		end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		respond_to do |format|
			format.html {redirect_to students_url}
			format.json { head :no_content }
		end		
		
	end
  private
  def find_student
    @student = Student.where(id: params[:id]).first
    render_404 unless @student
  end
  def student_params
    params.require(:student).permit(:first_name, :second_name, :middle_name, :group)
  end
end
