require 'fileutils'

module VimPlug
  @vimplugs_path = File.expand_path File.join(ENV['HOME'], '.vim', '.vimplugs.local')
  def self.add_plugin_to_vimplug(plugin_repo)
    return if contains_vimplug? plugin_repo

    vimplugs = vimplugs_from_file
    last_bundle_dir = vimplugs.rindex{ |line| line =~ /^Plug / }
    last_bundle_dir = last_bundle_dir ? last_bundle_dir+1 : 0
    vimplugs.insert last_bundle_dir, "Plug \"#{plugin_repo}\""
    write_vimplugs_to_file vimplugs
  end

  def self.remove_plugin_from_vimplugs(plugin_repo)
    vimplugs = vimplugs_from_file
    deleted_value = vimplugs.reject!{ |line| line =~ /Plug "#{plugin_repo}"/ }

    write_vimplugs_to_file vimplugs

    !deleted_value.nil?
  end

  def self.vimplug_list
    vimplugs_from_file.select{ |line| line =~ /^Plug .*/ }.map{ |line| line.gsub(/Plug "(.*)"/, '\1')}
  end

  def self.update_vimplug
    system "nvim -es -u #{ENV['HOME']}/.dotf/config/nvim/init.vim -i NONE -c \"PlugUpdate\" -c \"qa\""
  end

  private

  def self.contains_vimplug?(vimplug_name)
    FileUtils.touch(@vimplugs_path) unless File.exists? @vimplugs_path
    File.read(@vimplugs_path).include?(vimplug_name)
  end

  def self.vimplugs_from_file
    FileUtils.touch(@vimplugs_path) unless File.exists? @vimplugs_path
    File.read(@vimplugs_path).split("\n")
  end

  def self.write_vimplugs_to_file(vimplugs)
    FileUtils.cp(@vimplugs_path, "#{@vimplugs_path}.bak")
    vimplug_file = File.open(@vimplugs_path, "w")
    vimplug_file.write(vimplugs.join("\n"))
    vimplug_file.close
  end
end
