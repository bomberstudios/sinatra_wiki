class Page
  attr_accessor :path, :name, :file, :is_new
  attr_writer :content

  def initialize(name)
    self.name = name
    self.path = "public/#{self.name}.txt"
    if !File.exist? self.path
      self.is_new = true
      self.content = ""
    end
  end
  def markdown
    File.read(self.path)
  end
  def html
    RDiscount.new(File.read(self.path)).to_html
  end
  def content= txt
    File.open(self.path,"w") do |file|
     file << txt
    end
  end
end