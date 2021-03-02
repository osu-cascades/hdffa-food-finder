class Api::V1::CategoryGroupsController < ApplicationController
    before_action :restrict_unless_admin
  
    def index
      @categories = Category.all.sort_by{ |category| [ category.name.upcase ] }
    end
  
end