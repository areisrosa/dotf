require 'fileutils'
require File.join(File.dirname(__FILE__), 'bin', 'dotf', 'vimplug')

desc "Hook our dotfiles into system-standard positions."
task :install => [:submodule_init, :submodules] do
  puts
  puts "======================================================"
  puts "Welcome to DOTF Installation."
  puts "======================================================"
  puts

  if !File.exists?("/home/dotfiles/.dotf")
    if RUBY_PLATFORM.downcase.include?("linux")
    elsif File.exists?("/usr/bin/apt")
      Rake::Task["install_apt_package"].execute
      Rake::Task["run_bundle_config"].execute
      Rake::Task["install_asdf"].execute
      asdf_path = run %{echo ~/.asdf}
      if File.exists?(asdf_path)
        puts
        puts "======================================================"
        puts "Installing asdf plugin and languages."
        puts "======================================================"
        puts
        Rake::Task["install_languange"].execute
      else
        puts
        puts "======================================================"
        puts "Asdf not is already installed."
        puts "======================================================"
        puts
      end
    else
      Rake::Task["install_brew_package"].execute
      Rake::Task["install_asdf"].execute
      asdf_path = run %{echo ~/.asdf}
      if File.exists?(asdf_path)
        puts
        puts "======================================================"
        puts "Installing plugin and languages."
        puts "======================================================"
        puts
        Rake::Task["install_languange"].execute
      else
        puts
        puts "======================================================"
        puts "Asdf not is already installed."
        puts "======================================================"
        puts
      end
    end
  end

  Rake::Task["run_bundle_config"].execute

  # This has all the runcoms from this directory.
  install_files(Dir.glob('git/*')) if want_to_install?('git configs (color, aliases)')
  install_files(Dir.glob('irb/*')) if want_to_install?('irb/pry configs (more colorful)')
  install_files(Dir.glob('ruby/*')) if want_to_install?('rubygems config (faster/no docs)')
  install_files(Dir.glob('ctags/*')) if want_to_install?('ctags config (better js/ruby support)')
  install_files(Dir.glob('tmux/*')) if want_to_install?('tmux config')
  install_files(Dir.glob('vimify/*')) if want_to_install?('vimification of command line tools')
  install_files(Dir.glob('ghc/*')) if want_to_install?('ghc config')
  install_files(Dir.glob('idea/*')) if want_to_install?('idea config')
  install_files(Dir.glob('xmonad/*')) if want_to_install?('xmonad config')
  install_files(Dir.glob('config/*')) if want_to_install?('config')
  if want_to_install?('vim configuration (highly recommended)')
    install_files(Dir.glob('vim/*'))
    Rake::Task["install_vimplug"].execute
  end

  Rake::Task["install_oh_my_zsh_override"].execute
  Rake::Task["install_scripts"].execute
  Rake::Task["install_fonts"].execute
  Rake::Task["install_lsd"].execute

  if File.exists?("/home/dotfiles/.dotf")
    Rake::Task["install_asdf"].execute
  end

  success_msg("installed")
end

task :install_apt_package do
  if want_to_install?('for apt package')
    install_apt_package
  end
end

task :install_asdf do
  if want_to_install?('asdf')
    install_asdf
  end
end

task :install_languange do
  if want_to_install?('languages')
    install_plugin_asdf
    install_languanges
  end
end

task :install_lsd do
  if want_to_install?('lsd')
    install_lsd
  end
end

task :install_fonts do
  if want_to_install?('fonts')
  install_fonts
  end
end

task :install_brew_package do
  if want_to_install?('for brew package')
    install_brew_package
  end
end

task :install_oh_my_zsh_override do
  if want_to_install?('zsh enhancements & oh-my-zsh')
    install_oh_my_zsh_override
  end
end

task :install_scripts do
  if want_to_install?('scripts')
    install_scripts
  end
end

task :run_bundle_config do
  if want_to_install?('run bundle config')
    run_bundle_config
  end
end

desc 'Updates the installation'
task :update do
  Rake::Task["vimplug_migration"].execute if needs_migration_to_vim_plugin?
  Rake::Task["install"].execute
  #TODO: for now, we do the same as install. But it would be nice
  #not to clobber zsh files
end

task :submodule_init do
  unless ENV["SKIP_SUBMODULES"]
    run %{ git submodule update --init --recursive }
  end
end

desc "Init and update submodules."
task :submodules do
  unless ENV["SKIP_SUBMODULES"]
    puts "======================================================"
    puts "Downloading DOTF submodules...please wait"
    puts "======================================================"

    run %{
      cd $HOME/.dotf
      git submodule update --recursive
      git clean -df
    }
    puts
  end
end

desc "Performs migration from pathogen to vim-plugin"
task :vimplug_migration do
  puts "======================================================"
  puts "Migrating from pathogen to vim-plugin vim plugin manager."
  puts "This will move the old .vim/bundle directory to"
  puts ".vim/bundle.old and replacing all your vim plugins with"
  puts "the standard set of plugins. You will then be able to"
  puts "manage your vim's plugin configuration by editing the"
  puts "file .vim/vimplugs.vim"
  puts "======================================================"

  Dir.glob(File.join('vim', 'bundle','**')) do |sub_path|
    run %{git config -f #{File.join('.git', 'config')} --remove-section submodule.#{sub_path}}
    # `git rm --cached #{sub_path}`
    FileUtils.rm_rf(File.join('.git', 'modules', sub_path))
  end
  FileUtils.mv(File.join('vim','bundle'), File.join('vim', 'bundle.old'))
end

desc "Runs Vim Plugin installer in a clean vim environment"
task :install_vimplug do
  puts "======================================================"
  puts "Installing and updating vim-plugin."
  puts "The installer will now proceed to run PluginInstall"
  puts "to install vim-plugin."
  puts "======================================================"

  puts ""

  vimplug_path = File.join('vim','bundle', 'vim-plug')
  unless File.exists?(vimplug_path)
    run %{
      cd $HOME/.doft
      git clone https://github.com/junegunn/vim-plug.git #{vimplug_path}
    }
  end

  VimPlug::update_vimplug
end

task :default => 'install'

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def number_of_cores
  if RUBY_PLATFORM.downcase.include?("darwin")
    cores = run %{ sysctl -n hw.ncpu }
  else
    cores = run %{ nproc }
  end
  puts
  cores.to_i
end

def run_bundle_config
  return unless system("which bundle")

  bundler_jobs = number_of_cores - 1
  puts "======================================================"
  puts "Configuring Bundlers for parallel gem installation"
  puts "======================================================"
  run %{ bundle config --global jobs #{bundler_jobs} }
  puts
end

def install_brew_package
  run %{which brew}
  unless $?.success?
    puts "======================================================"
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{ bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" }
  end

  puts
  puts
  puts "======================================================"
  puts "Updating Homebrew."
  puts "======================================================"
  run %{brew update}
  puts
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  run %{
  brew install zsh ctags git hub tmux curl coreutils
  brew install macvim asdf reattach-to-user-namespace
  brew the_silver_searcher ghi
  }
  run %{echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc}
  puts
  puts
end

def install_apt_package
  run %{which apt}
  unless $?.success?
    puts "======================================================"
    puts "Installing package sudo...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{ sudo apt install -yqq sudo }
  end

  puts
  puts
  puts "======================================================"
  puts "Installing packages...There may be some warnings."
  puts "======================================================"
  run %{
  sudo apt update
  apt install -yqq local lsb-release software-properties-common
  apt install -yqq autoconf build-essential
  apt install -yqq curl fasd fontconfig git
  apt install -yqq python python-setuptools python-dev pip cargo
  apt install -yqq tmux vim neovim python-neovim python3-neovim
  apt install -yqq wget zsh kitty
  apt install -yqq ctags git hub reattach-to-user-namespace
  apt install -yqq the_silver_searcher ghi
  apt clean
  rm -rf /var/lib/apt/list/* /tmp/* /var/tmp/*
  }
  puts
  puts
end

def install_asdf
  puts "======================================================"
  puts "Installing asdf a manage multiple runtime versions with"
  puts "a single CLI tool"
  puts "======================================================"
  run %{ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0 } if RUBY_PLATFORM.downcase.include?("linux")
  puts
end

def install_plugin_asdf
  puts "======================================================"
  puts "Installing plugin asdf for languages programantions..."
  run %{
   asdf plugin-add java
   asdf plugin-add ruby
   asdf plugin-add yarn
   asdf plugin-add rust
   asdf plugin-add elixir
   asdf plugin-add erlang
   asdf plugin-add golang
   asdf plugin-add kotlin
   asdf plugin-add python
   asdf plugin-add nodejs
   asdf plugin-add crystal
  }
  puts
end

def install_languanges
  puts "======================================================"
  puts "Installing languages programantions..."
  run %{
   asdf install crystal latest
   asdf install elixir latest
   asdf install erlang latest
   asdf install golang latest
   asdf install kotlin latest
   asdf install python latest
   asdf install nodejs latest
   asdf install java latest
   asdf install ruby latest
   asdf install yarn latest
   asdf install rust latest
  }
  puts
end

def install_lsd
  puts "======================================================"
  puts "Installing lsd (ls deluxe)"
  puts "======================================================"
  run %{ cargo install --git https://github.com/Peltoche/lsd.git --branch master } if RUBY_PLATFORM.downcase.include?("linux")
  puts
end
def install_fonts
  puts "======================================================"
  puts "Installing patched fonts for Powerline/Lightline."
  puts "======================================================"
  run %{ cp -f $HOME/.doft/fonts/* $HOME/Library/Fonts } if RUBY_PLATFORM.downcase.include?("darwin")
  run %{ mkdir -p ~/.fonts && cp -rf ~/.dotf/fonts/* ~/.fonts && fc-cache -vf ~/.fonts } if RUBY_PLATFORM.downcase.include?("linux")
  puts
end

def ask(message, values)
  puts message
  while true
    values.each_with_index { |val, idx| puts " #{idx+1}. #{val}" }
    selection = STDIN.gets.chomp
    if (Float(selection)==nil rescue true) || selection.to_i < 0 || selection.to_i > values.size+1
      puts "ERROR: Invalid selection.\n\n"
    else
      break
    end
  end
  selection = selection.to_i-1
  values[selection]
end

def install_oh_my_zsh_override
  puts
  puts "Installing Oh My Zsh Override (ZSH Enhancements)..."

  # The runcoms are only going to be installed if has never been installed
  install_files(Dir.glob('zsh/oh-my-zsh-override/zshrc'))
  install_files(Dir.glob('zsh/runcoms/zprofile'))
  install_files(Dir.glob('zsh/runcoms/zshenv'))

  puts
  puts "Creating directories for your customizations"
  run %{
  mkdir -p $HOME/.zsh.before
  mkdir -p $HOME/.zsh.after
  mkdir -p $HOME/.zsh.prompts
  }

  if "#{ENV['SHELL']}".include? 'zsh' then
    puts "Zsh is already configured as your shell of choice."
    puts "Restart your session to load the new settings."
  else
    puts "Setting zsh as your default shell"
    if File.exists?("/usr/local/bin/zsh")
      if File.readlines("/private/etc/shells").grep("/usr/local/bin/zsh").empty?
        puts "Adding zsh to standard shell list"
        run %{ echo "/usr/local/bin/zsh" | sudo tee -a /private/etc/shells }
      end
      run %{ chsh -s /usr/local/bin/zsh }
    else
      run %{ chsh -s /bin/zsh }
    end
  end
end

def install_scripts
  puts
  puts "Installing scripts"

  install_files(Dir.glob('scripts/fonts')) if want_to_install?('fonts scripts')
  install_files(Dir.glob('scripts/keyboars')) if want_to_install?('keyboards scripts')
  install_files(Dir.glob('scripts/monitors')) if want_to_install?('monitors scripts')
  install_files(Dir.glob('scripts/polybars')) if want_to_install?('polybars scripts')
  install_files(Dir.glob('scripts/wallpapers')) if want_to_install?('wallpapers scripts')
end

def want_to_install? (section)
  if ENV["ASK"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def install_files(files)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "==========================================================="
    puts "Reference the #{file}"
    puts "==========================================================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if File.exists? File.join('dotbot')
      run %{ bash install.sh }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

  puts "============================================================="
  puts
  end
end

def needs_migration_to_vimplug?
  File.exists? File.join('vim', 'bundle', 'tpope-vim-pathogen')
end

def list_vim_submodules
  result=`git submodule -q foreach 'echo $name"||"\`git remote -v | awk "END{print \\\\\$2}"\`'`.select{ |line| line =~ /^vim.bundle/ }.map{ |line| line.split('||') }
  Hash[*result.flatten]
end

def success_msg(action)
  puts %q{
   ____        _    __
  |  _ \  ___ | |_ / _|
  | | | |/ _ \| __| |_
  | |_| | (_) | |_|  _|
  |____/ \___/ \__|_|
  }
  puts "Dotf successfully installed"
  puts "DOTF has been #{action}. Please restart your terminal and vim."
end
