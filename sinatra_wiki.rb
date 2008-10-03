%w(rubygems sinatra erb rdiscount thin).each do |lib|
  require lib
end
Dir["lib/**/*"].each do |lib|
  require lib
end

before do
  content_type 'text/html', :charset => 'utf-8'
  @pages = Dir["public/**/*.txt"]
end

def create_file file_path, contents=""
  File.open(file_path,"w") do |f|
    f << contents
  end
end

get '/' do
  erb :home
end
get '/:slug' do
  @page_name = params[:slug]
  file_path = "public/#{@page_name}.txt"
  if File.exist?(file_path)
    @content = IO.read(file_path)
    erb :page
  else
    create_file file_path
    redirect "/#{page_name}/edit"
  end
end
get '/:slug/edit' do
  @page_name = params[:slug]
  @content = IO.read("public/#{@page_name}.txt")
  erb :edit
end
post '/:slug/edit' do
  nice_title = Slugalizer.slugalize(params[:title])
  create_file "public/#{nice_title}.txt", params[:body]
  @content = params[:body]
  redirect "/#{nice_title}"
end