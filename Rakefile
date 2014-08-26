require 'rake'
require 'fileutils'

class DotFile

  class << self
    def current_dir
      File.expand_path('.', File.dirname(__FILE__))
    end

    def linkables
      Dir.glob(current_dir + '/**/*{.symlink}')
    end

    def symlink_path
      ENV["HOME"] + "/.dotfiles"
    end

    def rm_symlink
      FileUtils.rm_rf(symlink_path)
    end

    def make_symlink
      rm_symlink
      system %|ln -s "#{current_dir}" "#{symlink_path}"|
    end

    def exists?
      File.exists?(symlink_path)
    end

    def each_file &block
      linkables.each do |linkable|
        file = self.new(linkable)
        block.call(file)
      end
    end
  end

  def initialize path
    @path = path
  end

  def name
    @path.split('/').last.split('.symlink').last
  end

  def symlink_path
    ENV["HOME"] + "/." + name
  end

  def rm_symlink
    FileUtils.rm_rf(symlink_path)
  end

  def exists_realfile?
    File.exists?(symlink_path) && !File.symlink?(symlink_path)
  end

  def make_symlink
    rm_symlink
    system %|ln -s "#{@path}" "#{symlink_path}"|
  end
end

task :install do
  DotFile.each_file do |file|
    if file.exists_realfile?
      puts "already exists. " + file.symlink_path
      next
    end

    file.make_symlink
    puts "linked " + file.name + " -> " + file.symlink_path
  end

  unless DotFile.exists?
    DotFile.make_symlink
    puts "linked " + DotFile.current_dir + " -> " + DotFile.symlink_path
  end
end

task :uninstall do
  DotFile.each_file do |file|
    file.rm_symlink
    puts "unlinked " + file.symlink_path
  end

  DotFile.rm_symlink
  puts "unlinked " + DotFile.symlink_path
end

task :default => 'install'
