class InteractionsController < ApplicationController
    
    def new
        @interaction = Interaction.new
    end
    
     def create
        @interaction = Interaction.new(params.require(:interaction).permit(:interaction_name, :interface, :notes_from_release,
        :data_mapping, :rrc_version, :plt_crossline_dep, :plt_dep_dets, :pc_changes, :pc_changes_type, :plugin_changes, :plug_changes_type,
        :ia_changes, :ia_changes_type, :db_script, :db_script_type, :external_changes, :external_changes_type,
        :issues_defects, :workarounds))
        @interaction.update_attribute(:iteration_id, current_user.iteration_id)
        @interaction.update_attribute(:owner_id, current_user.id)
        @interaction.update_attribute(:line_id, current_user.line_id)
        respond_to do |format|
        if @interaction.save
            format.html {redirect_to iterations_path, notice: "Interaction successfully added!"}
            current_user.update_attribute(:iteration_id, nil)
        else
            format.html {render :new }
        end
    end
    end
    
end
