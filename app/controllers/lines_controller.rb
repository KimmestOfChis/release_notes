class LinesController < ApplicationController
    
    def index
        @line = Line.all
    end
    
    def new
        @line = Line.new
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
                format.html {redirect_to line_path, notice: 'Line was successfully updated' }
            else
                format.html { render :edit }
            end
        end
    end
    
    def show
        @line = Line.find(params[:id])
    end
    
    def destroy
        @line = Line.find(params[:id])
        @line.destroy
        respond_to do |format|
            format.html {redirect_to lines_path, notice: "Line was removed!"}
        end
    end

end
