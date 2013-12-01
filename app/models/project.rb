class Project < ActiveRecord::Base

	def next_proj_link
		"/projects/#{Project.first.slug}"
	end

	def prev_proj_link
		"/projects/#{Project.first.slug}"
	end
end
