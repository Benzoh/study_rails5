class AjaxController < ApplicationController
  layout 'ajax'
  
  def index
  end

  def data
    # Net::HTTPで外部サイトにアクセス
    url = URI('http://twitrss.me/twitter_user_to_rss/?user=benzoh_wada')
    # url = URI('https://www6.nhk.or.jp/special/feed/schedule.html')
    # url = URI('https://news.yahoo.co.jp/pickup/rss.xml')
    # url = URI('https://www.start30blog.com/feed/')
    http = Net::HTTP.new(url.host)
    response = http.get(url)
    @data = Hash.from_xml(response.body).to_json.html_safe
    # raise
    
    # # @data = User.where 'name like ?', '%' + params[:name] + '%'
    # @data = User.where(name: params[:name]).or(User.where(id: params[:id]))
    # # @data = User.where(id: params[:id])
    # @data = @data.to_json.html_safe

    # # @ajax_data = User.find 1
    # # raise
  end
end
