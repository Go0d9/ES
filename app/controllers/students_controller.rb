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
		@benefits = @student.benefits #check this
		unless @student
			render text: "Page not faind", status: 404			
		end
	end
	def new
		@student = Student.new
		@benefits = Benefit.all
		console

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @student }
		end		
	end
	def edit
		@student = Student.find(params[:id])
		@benefits= Benefit.all
		@student.benefits.build
	end

	def create
		@student = Student.new(student_params)
		benefit = Benefit.find(params[:activated])
		@student.benefits << benefit
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
		@student = Student.new(student_params)
		benefit = Benefit.find(params[:activated])
		@student.benefits << benefit
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
  def find_benefits
		if request.post?
	  activated_ids = params[:activated].collect {|id| id.to_i} if params[:activated]
	  seen_ids = params[:seen].collect {|id| id.to_i} if params[:seen]
	    if activated_ids
	      seen_ids.each do |id|
	        r = Benefit.find_by_id(id)
	        r.activated = activated_ids.include?(id)
	        r.save
	      end
	    end
	  end  	
  end
  def student_params
    params.require(:student).permit(:first_name, :second_name, :middle_name, :group, benefits_attributes: [:id, :title])
  end
end
