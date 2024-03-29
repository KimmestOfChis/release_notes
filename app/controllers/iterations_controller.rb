class IterationsController < ApplicationController
    
    
    def index
        @iteration = Iteration.all.order(:date_of_drop)
        @new_iteration = Iteration.new
        @interaction = Interaction.all
        @defect = Defect.all
    end
    
    def view_report
        @iteration = Iteration.find(params[:id])
        @interaction = Interaction.where(:iteration_id => @iteration.id)
        @defect = Defect.where(:iteration_id => @iteration.id)
        @user = User.all
        @line = Line.all
        @all_iterations = Iteration.all
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
        @iteration = Iteration.find(params[:id])
        respond_to do |format|
        if @iteration.update(params.require(:iteration).permit(:iteration_number, :drop_number, :date_of_drop))
            format.html {redirect_to iterations_path, notice: "Iteration successfully updated!"}
        else
            format.html {render :new }
        end
        end
    end
    
    def show
        @iteration = Iteration.find(params[:id])
        @defect = Defect.where("iteration_id = ?", @iteration.id)
    end
    
    def destroy
        @iteration = Iteration.find(params[:id])
        @iteration.destroy
        respond_to do |format|
            format.html {redirect_to iterations_path, notice: "Iteration was removed!"}
        end
    end
    
    def defect_redirect
        redirect_to new_defect_path
    end
    
    def interaction_redirect
        redirect_to new_interaction_path
    end
    
    def new_defect
        @iteration = Iteration.find(params[:id])
        current_user.update_attribute(:iteration_id, @iteration.id)
        
        self.defect_redirect
    end
    
    def new_interaction
        @iteration = Iteration.find(params[:id])
        current_user.update_attribute(:iteration_id, @iteration.id)
        self.interaction_redirect
    end
    
    def clone_defect
        @@defect = Defect.find(params[:id])
        @iteration = Iteration.all
    end
    
    def submit_clone
        @defect = @@defect
        @iteration = Iteration.find(params[:id])
        @newfect = @defect.dup
        @newfect.update_attribute(:iteration_id, @iteration.id)
        respond_to do |format|
        if @newfect.save
            format.html {redirect_to view_report_iteration_path(@iteration.id), notice: "#{@newfect.defect_no} copied to Iteration #{@iteration.iteration_number}, Drop #{@iteration.drop_number} "}
        else
            format.html {render :new }
        end
        end
    end
    
    def clone_interaction
        @@interaction = Interaction.find(params[:id])
        @iteration = Iteration.all
    end
    
    def submit_interaction
        @interaction = @@interaction
        @iteration = Iteration.find(params[:id])
        @new_inter = @interaction.dup
        @new_inter.update_attribute(:iteration_id, @iteration.id)
        redirect_to view_report_iteration_path(@iteration.id)
    end   
end
