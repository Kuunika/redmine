# frozen_string_literal: true

# Redmine - project management software
# Copyright (C) 2006-2022  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

class WelcomeController < ApplicationController
  self.main_menu = false

  def index
    @news = News.latest User.current, 8
    
    with_subprojects = Setting.display_subprojects_issues?
    @field = "category_id"
    
    @all_rows = []
    Project.all.each do |project|
    	  @all_rows << [
    	  project, (project.issue_categories + [IssueCategory.new(:name => "[#{l(:label_none)}]")]),
    	  Issue.by_category(project, with_subprojects)
    	]    	
    end
    
    @data = Issue.by_category_all_projects
    data = {}
    @data.each do |d|
    	data[IssueStatus.find(d['status_id']).name] = d['total']
    end    
    
    @report_title = l(:field_category)
    @statuses = Project.first.rolled_up_statuses.sorted.to_a    
    
    @labels = []
    @data_rows = []
    colors = ['rgba(255, 99, 132)', 'rgba(255, 206, 86)',  'rgba(54, 162, 235)', 'rgba(75, 192, 192)', 'rgba(153, 102, 255)', 'rgba(255, 159, 64)'];
    
    @statuses.each do |status|
    	@labels    << status.name
	    @data_rows << data[status.name] || 0
    end
    @colors = colors[0 .. (@statuses.length - 1)]

    #Issue priority for badges on dashboard
    @issue_priorities = IssuePriority.stats    
  end

  def robots
    @projects = Project.all_public.active
    render :layout => false, :content_type => 'text/plain'
  end
end
