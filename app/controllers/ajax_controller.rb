class AjaxController < ApplicationController
  layout 'ajax'
  
  def index
  end

  def data
    @ajax_data = User.find 1
    # raise
  end
end
