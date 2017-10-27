class LinesController < ApplicationController
    
    def index
        @line = Line.all
        @line_new = Line.new
        #@find_line = Line.find(params[:id])
    end
    
    def new
        @line = Line.new
        @user = User.new
    end
    
    def create
    @line = Line.new(params.require(:line).permit(:line_name, :line_work))
    respond_to do |format|
        if @line.save
            format.html {redirect_to lines_path, notice: "Line successfully added!"}
        else
            format.html {render :new }
        end
        end
    end
    
    def edit 
        @line = Line.find(params[:id])
    end
    
    def update
        @line = Line.find(params[:id])
        respond_to do |format|
            if @line.update(params.require(:line).permit(:line_name, :line_work))
                format.html {redirect_to lines_path, notice: 'Line was successfully updated' }
            else
                format.html { render :edit }
            end
        end
    end
    
    def show
        @line = Line.find(params[:id])
    end
    
    def destroy
        @user = User.all
        @line = Line.find(params[:id])
        @line.destroy
        @user.each do |user|
            if @line.id === user.line_id
            user.update_attribute(:line_id, nil)
            end
        end
        respond_to do |format|
            format.html {redirect_to lines_path, notice: "Line was removed!"}
        end
    end
    
    def add_to
        @line = Line.find(params[:id])
        current_user.update_attribute(:line_id, @line.id)
        respond_to do |format|
        format.html { redirect_to lines_path, notice: "You were successfully added to #{@line.line_name}" }
        end
    end
    
    def leave
        @line = Line.find(params[:id])
        current_user.update_attribute(:line_id, nil)
        redirect_to lines_path
        flash[:notice] = "Successfully removed from #{@line.line_name}"
    end
end
