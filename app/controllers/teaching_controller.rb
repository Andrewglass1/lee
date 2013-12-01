class TeachingController < ApplicationController

	before_filter :redirect_unless_admin, :only => [:edit, :update]

	def index
		@teaching_content = TeachingContent.first
	end

	def edit
		@teaching_content = TeachingContent.first
	end

	def update
		@teaching_content = TeachingContent.first
		if @teaching_content.update(teaching_content_params)
			redirect_to teaching_index_path
		else
			redirect_to :back
		end
	end

private
  def teaching_content_params
    allow = [:column_1, :column_2, :column_3]
    params.require(:teaching_content).permit(allow)
  end
end
