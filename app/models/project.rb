class Project < ActiveRecord::Base

  def self.in_three_buckets
    #TODO MAKE THIS LESS HACKY
    bucket_1 = []
    bucket_2 = []
    bucket_3 = []

    sorted_projects.each_with_index do | project, index |
      if index % 3 == 0
        bucket_1 << project
      elsif index % 3 == 1
        bucket_2 << project
      elsif index % 3 == 2
        bucket_3 << project
      end
    end

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
