class MainController < ApplicationController
  def index
    @projects_json = Project.all.to_json.html_safe
  end
end
