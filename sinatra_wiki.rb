%w(rubygems sinatra erb rdiscount thin).each do |lib|
  require lib
end
Dir["lib/**/*"].each do |lib|
  require lib
end

before do
  content_type 'text/html', :charset => 'utf-8'
  @page = Page.new("home") # Default page
end

get '/' do
  @pages = Dir["public/**/*.txt"]
  erb :home
end
get '/:slug' do
  @page = Page.new(params[:slug])
  if @page.is_new
    redirect "/#{@page.name}/edit"
  else
    @content = @page.html
    erb :page
  end
end
get '/:slug/edit' do
  @page = Page.new(params[:slug])
  erb :edit
end
post '/:slug/edit' do
  nice_title = Slugalizer.slugalize(params[:title])
  @page = Page.new(nice_title)
  @page.content = params[:body]
  redirect "/#{nice_title}"
end