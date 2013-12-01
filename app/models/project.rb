class Project < ActiveRecord::Base

	def next_proj_link
		"/projects/#{next_proj.slug}"
	end

	def prev_proj_link
		"/projects/#{prev_proj.slug}"
	end

  private

  def next_proj
    p = Project.first(:conditions => ['id > ?', id], :order => 'id DESC')
    p || Project.first
  end

  def prev_proj
    Project.first(:conditions => ['id > ?', id], :order => 'id ASC')
    p || Project.last
  end
end
