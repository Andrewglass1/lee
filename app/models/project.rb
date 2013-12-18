class Project < ActiveRecord::Base

  def self.in_three_buckets
    #TODO MAKE BUCKETS WORK
    bucket_1 = sorted_projects
    bucket_2 = sorted_projects
    bucket_3 = sorted_projects

    [bucket_1, bucket_2, bucket_3]
  end

  def self.sorted_projects
    @sorted_projects ||= Project.order(:order)
  end

  def link
    "/projects/#{slug}"
  end

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
