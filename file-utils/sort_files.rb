# encoding: UTF-8
require 'fileutils'
basedir = "Z:/"
@cat = {
    "00" => "_00",
    "01" => "_01",
    "02" => "_02",
    "03" => "_03"}

def sortfiles(dir)
  Dir.foreach(dir){
  |f|
  mypath = "#{dir}/#{f}"
  if File.directory?(mypath) then
    if f != '.' and f != '..' then
      sortfiles(mypath)
    end
  else
    if f != 'Thumbs.db' then
      fn = f.split("_")
      fn[1] = fn[1].sub(/-\d+/, '')
      path = "#{dir}/#{@cat[fn[1]]}/"
      path = path.sub(/_[0-9]+\/_[0-9]+/, path[/_[0-9]+/])
      dest = "#{dir}/#{@cat[fn[1]]}/#{f}"
      dest = dest.sub(/_[0-9]+\/_[0-9]+/, dest[/_[0-9]+/])
      if !Dir.exist?(path) then
        FileUtils.mkdir(path)
        FileUtils.mv(mypath, dest)
      else
        if !File.exist? dest then
          FileUtils.mv(mypath, dest)
        end
      end
    end
  end
  }
  return 0
end

sortfiles(basedir)
