task :expire_cache do
  %x(rm public/*.html public/*.css)
end

task :restart do
  %x(touch tmp/restart.txt)
end

task :default => [:expire_cache, :restart]