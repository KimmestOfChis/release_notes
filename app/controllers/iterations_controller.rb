class IterationsController < ApplicationController
    
    def index
        @iteration = Iteration.all.order(:date_of_drop)
        @next_drop = @iteration.where('date_of_drop > ?', Date.today).order(:date_of_drop).first.date_of_drop
    end
    
    def new
        @iteration = Iteration.new
    end
    
    def create
        @iteration = Iteration.new(params.require(:iteration).permit(:iteration_number, :drop_number, :date_of_drop))
         respond_to do |format|
        if @iteration.save
            format.html {redirect_to iterations_path, notice: "Iteration successfully added!"}
        else
            format.html {render :new }
        end
        end
    end
    
    def edit
        @iteration = Iteration.find(params[:id])
    end
    
    def update
        @iteration = Iteration.find(params[:id].permit(:iteration_number, :drop_number, :date_of_drop))
        respond_to do |format|
        if @iteration.save
            format.html {redirect_to iteration, notice: "Iteration successfully updated!"}
        else
            format.html {render :new }
        end
        end
    end
    
    def show
        @iteration = Iteration.find(params[:id])
    end
    
    def destroy
        @iteration = Iteration.find(params[:id])
        @iteration.destroy
        respond_to do |format|
            format.html {redirect_to iterations_path, notice: "Iteration was removed!"}
        end
    end
end
