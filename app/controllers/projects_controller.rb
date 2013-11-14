class ProjectsController < ApplicationController

	def index
	end

	def show
		@project = Project.find_by_slug(params[:slug])
	end

	def new
		@project = Project.new
	end

	def create
  	@project = Project.new(params[:project].permit(:name, :slug, :image_1, :image_2, :description))
 
	  if @project.save
	    redirect_to new_project_path
	    flash[:notice] = "You have successfully added a project <a href='/projects/#{@project.slug}'>#{@project.name}</a>"
	  else
	    render 'new'
	    flash[:notice] = "There was an issue in adding the project"
	  end
	end
end
