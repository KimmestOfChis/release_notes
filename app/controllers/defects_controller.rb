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
        respond_to do |format|
        if @defect.save
            format.html {redirect_to defects_path, notice: "Defect successfully added!"}
            current_user.update_attribute(:iteration_id, nil)
        else
            format.html {render :new }
        end
        end
    end
end
