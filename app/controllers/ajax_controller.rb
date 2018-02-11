class AjaxController < ApplicationController
  layout 'ajax'
  
  def index
  end

  def data
    # @data = User.where 'name like ?', '%' + params[:name] + '%'
    @data = User.where(name: params[:name]).or(User.where(id: params[:id]))
    # @data = User.where(id: params[:id])
    @data = @data.to_json.html_safe

    # @ajax_data = User.find 1
    # raise
  end
end
