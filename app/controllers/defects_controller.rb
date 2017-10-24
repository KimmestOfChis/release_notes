class DefectsController < ApplicationController
    
    def index
        @defect = Defect.all
        @defect_add = Defect.new
    end
    
    def new 
        @defect = Defect.new
    end
    
    def create 
        @defect = Defect.new(params.require(:defect).permit(:defect_no,
        :rtc, :qc, :config, :data_mapping_def, :pc_changes_def,
        :plugin_changes, :ia_changes, :db_changes_def, :external_changes_def, :plug_changes_type,
        :workarounds))
        @defect.update_attribute(:iteration_id, current_user.iteration_id)
        @defect.update_attribute(:owner_id, current_user.id)
        @defect.update_attribute(:line_id, current_user.line_id)
        @defect.update_attribute(:scrum_master, User.where(:line_id => current_user.line_id, :role => 'Scrum Master').first.first_name)
        @defect.update_attribute(:scrum_master_surname, User.where(:line_id => current_user.line_id, :role => 'Scrum Master').first.last_name)
        respond_to do |format|
        if @defect.save
            format.html {redirect_to defects_path, notice: "Defect successfully added!"}
            current_user.update_attribute(:iteration_id, nil)
        else
            format.html {render :new }
        end
        end
    end
    
     def edit
        @defect = Defect.find(params[:id])
    end
    
     def update
        @defect = defect.find(params[:id])
        respond_to do |format|
        if @iteration.update(params.require(:defect).permit(:defect_no, :rtc, :qc, :config, :data_mapping_def,
            :pc_changes_def, :plugin_changes_def, :ia_changes_def, :db_changes_def, :external_changes_def, :workarounds))
            format.html {redirect_to iterations_path, notice: "Iteration successfully updated!"}
        else
            format.html {render :new }
        end
        end
    end
    
    def destroy
    
        @defect = Defect.find(params[:id])
        @defect.destroy
        respond_to do |format|
            format.html {redirect_to iterations_path, notice: "Defect was removed!"}
        end
    end
    
end
