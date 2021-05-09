
Dotf comes with a dead simple plugin manager that just uses vim-plug and
submodules, without any fancy config files.

Add a plugin

dav -u https://github.com/airblade/vim-rooter

Delete a plugin

ddv -u airblade/vim-rooter

The aliases (dav=dotf vim-add-plugin), (ddp=yadr vim-delete-plugin) and
(duv=dotf vim-update-all-plugins) live in the aliases file. You can then commit
the change. It's good to have your own fork of this project to do that.

