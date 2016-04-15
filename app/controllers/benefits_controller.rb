class BenefitsController < ApplicationController
	def index
		@benefits = Benefit.all

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @benefits }
		end
	end
	def show
		@benefit = Benefit.find(params[:id])
		unless @benefit
			render text: "Page not faind", status: 404			
		end
	end
	def new
		@benefit = Benefit.new


		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @benefit }
		end		
	end
	def edit
		@benefit = Benefit.find(params[:id])
		
	end

	def create
		@benefit = Benefit.new(benefit_params)
#    @benefit.category_id = category.id

		respond_to do |format|
			if @benefit.save 
				format.html { redirect_to @benefit, notice: 'Benefit was successfully created.' }
				format.json {render json: @benefit, status: :created, location: @benefit }
			else
				format.html {render action: "new"}
				format.json {render json: @benefit.errors, status: unprocessable_entity}
			end				
		end	
	end



	def update
		@benefit = Benefit.find(params[:id])

		respond_to do |format|
      if @benefit.update(benefit_params)
        format.html { redirect_to @benefit, notice: 'Benefit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
		end
	end

	def destroy
		@benefit = Benefit.find(params[:id])
		@benefit.destroy

		respond_to do |format|
			format.html {redirect_to benefits_url}
			format.json { head :no_content }
		end		
		
	end
  private
    
  def find_benefit
    @benefit = Benefit.where(id: params[:id]).first
    render_404 unless @benefit
  end
  def benefit_params
    params.require(:benefit).permit(:title, :description, :coefficient, :category_id)
  end
end
