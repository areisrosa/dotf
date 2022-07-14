---
# :robot: (Dotf)iles

> **Motivation** :thought_balloon: <br>
>  Don't you hate getting a new laptop or joining a new team and then spending 
> a whole day setting up your system preferences and tools? 
> Me too. That's why we automate;
> we did it once and we don't want to do have to do it again.

## :bookmark_tabs: Introduction
 I was struggling to find a Zsh theme and that had what I was looking for so 
 I made my own theme using Powerlevel10k!

This started as Anderson Reis's Computer shell configuration dotfiles but has
grown to a multi-developer platform for machine configuration.

## :computer: Installation :tea:
To get started please run:
```shell
 $ sh -c "`curl -fsSL https://raw.githubusercontent.com/areisrosa/dotf/master/install.sh`"
```

> :notebook_with_decorative_cover: **NOTE**: Dotf will automatically install
> all of its subcomponents. If you want to be asked about each one, use:

```shell
$ sh -c "`curl -fsSL https://raw.githubusercontent.com/areisrosa/dotf/master/install.sh`" -s ask
```
* When it finishes, open a terminal of your preference and go to the
    `~/.dotf/config/ketty` open the file ketty.conf choose a theme for
    kitty however comment the line font_family if you prefer another theme. If
    it isn't there for some reason, import it from `~/.dotf/fonts` -- you
    may also need to select the `Fira Code Nerd Font` font and check the box for
    non-ascii font;
* I've also found that you need to reboot before fast key repeat will be
    enabled.

> :notebook_with_decorative_cover: **NOTE**: I'll regularly add new
> configurations so keep an eye on this repo as it grows and optimizes.

## :arrow_down: Upgrade Instructions!

Brings huge changes. If you have made any modifications (and didn't make your
own fork), you will want to backup your dotfiles prior to running `git pull
--rebase` on `~/.dotf`.

Do the following to upgrade your ~/.dotf safely:

1. `cd ~/.dotf`
2. update dotfiles: `git pull --rebase`
3. run `./install.sh`  again

## :back: Restoring (dotf)iles

If you have existing dotfiles for configuring git, zsh, vim, etc, these will be
backed-up into `~/.dotf_backup/$(date +"%Y.%m.%d.%H.%M.%S")` and replaced with
the files from this project.

> :warning: **WARNING**: The restore script does not currently restore system
> settings--only your original dotfiles. To restore system settings, you'll
> need to manually undo what you don't like (so don't forget to fork, review,
> tweak)

## :metal: My personal customizations

<details><summary><code>Read on to learn what dofiles provides!</code>👈 Click</summary>
<p>

## :man_technologist: ZSH

Think of Zsh as a more awesome bash without having to learn anything new.
Automatic spell correction for your commands, syntax highlighting, and more.
We've also provided lots of enhancements:

* Vim mode, Fzf and bash style `Ctrl-R` for reverse history finder;
* `Ctrl-x,Ctrl-l` to insert output of last command;
* Fuzzy matching - if you mistype a directory name, tab completion will fix it.

## :see_no_evil: Aliases

Lots of things we do every day are done with two or three character
mnemonic aliases, please feel free to edit them:

* `ae` - alias edit
* `ar` - alias reload

## :octocat: Git - customizations

Dotfiles will take over your `~/.gitconfig`, so if you want to store your
usernames, please put them into `~/.gitconfig.user`

It is recommended to use this file to set your user info. Alternately, you can
set the appropriate environment variables in your `~/.secrets`.

* `git log` or `gl`              - a much more usable git log
* `git branch` or `gb`           - a list of branches with summary of last commit
* `git remote`                   - a list of remotes with info
* `git tag` or `gt`              - a list of tags with info
* `git checkout -b` or `gnb`     - a (n)ew (b)ranch - like checkout -b
* `gcp`                          - cherry-pick -x (showing what was cherrypicked)
* `git simple`                   - a clean format for creating changelogs
* `git recent-branches`          - if you forgot what you've been working on
* `git unstage` or `guns`        - (remove from index) and `git uncommit` /
* `gunc` (revert to the time prior to the last commit - dangerous if already pushed) aliases

> :notebook_with_decorative_cover: **NOTE**: Some sensible default configs, such
> as improving merge messages, push only pushes the current branch, removing
> status hints, and using mnemonic prefixes in diff: (i)ndex, (w)ork tree,
> (c\)ommit and (o)bject Slightly improved colors for diff `gdmb` (g)it (d)elete
> (m)erged (b)ranches - Deletes all branches already merged on current branch

### Github Issues: [ghi gem](https://github.com/stephencelis/ghi)

We include the `ghi` command. Try `ghi list` and have fun managing issues from
command line!


## :spider_web: Tmux - What's included? 

 * [Navigation](doc/tmux/navegation.md)
 * [Code manipulation](doc/tmux/coding.md)
 * [General enhancements that don't add new commands](doc/tmux/enhancements.md)

### Configuration

The `tmux.conf` provides some sane defaults for tmux on Mac OS like a powerful
status bar and vim keybindings. You can customize the configuration in
`~/.tmux.conf.user`.

### Prefix key

The default prefix is `C-b`. But I prefer use my muscle memory with prefix `C-a`
(`=C-a` or `^A`), if you want change the prefix then go to `~/.tmux.conf`.
```
# remap prefix to Control + w
set -g prefix C-w
bind C-w send-prefix
unbind C-b
```
:notebook_with_decorative_cover: **NOTE**: I'm going to assume that `C-w` is
your prefix.

### Tmux Cheatsheet

#### Sessions, windows, panes

* `Session` is a set of windows, plus a notion of which window is current.

* `Window` is a single screen covered with panes. (Once might compare it to a
  ‘virtual desktop’ or a ‘space’.)

* `Pane` is a rectangular part of a window that runs a specific command, e.g. a shell.

#### Getting help

* `C-a ?` - display a list of keyboard shortcuts:

#### Navigate using Vim or Emacs shortcuts

Depending on the value of `mode-keys`. Emacs is the default, and if you want
Vim shortcuts for help and copy modes (e.g. `j`, `k`, `C-u`, `C-d`), add the
following line to `~/.tmux.conf`:

```
setw -g mode-keys vi
```

> :notebook_with_decorative_cover: **NOTE**: Any command mentioned in this list
> can be executed as `tmux something` or `C-a :something` (or added to
> `~/.tmux.conf`).

#### Managing sessions

Creating a session:
```shell
$ tmux new-session -s work
```

Create a new session that shares all windows with an existing session, but has
its own separate notion of which window is current:

```shell
$ tmux new-session -s work2 -t work
```

Attach to a session:
```shell
$ tmux attach -t work
```

Switch between sessions:

* `C-a (`         - previous session
* `C-a )`         - next session
* `C-a L`         - ‘last’ (previously used) session
* `C-a s`         - choose a session from a list

#### Managing windows

Switch between windows:

* `C-a 1` - switch to window `1, ..., 9, 0`
* `C-a p` - previous window
* `C-a n` - next window
* `C-a l` - ‘last’ (previously used) window
* `C-a w` - choose window from a list

Switch between windows with a twist:

* `C-a M-n` - next window with a bell, activity or content alert
* `C-a M-p` - previous such window

#### Managing split panes

Creating a new pane by splitting an existing one:

* `C-a v` - split vertically (top/bottom)
* `C-a s` - split horizontally (left/right)

Moving panes around:

* `C-a {`         - move the current pane to the previous position
* `C-a }`         - move the current pane to the next position
* `C-a C-o`       - rotate window ‘up’ (i.e. move all panes)
* `C-a M-o`       - rotate window ‘down’
* `C-a !`         - move the current pane into a new separate window (‘break pane’)
* `C-a`           - :move-pane -t :3.2 split window 3's pane 2 and move the current pane there

Resizing panes:

* `C-a M-up`, `C-a M-down`, `C-a M-left`, `C-a M-right` - resize by 5 rows/columns
* `C-a C-up`, `C-a C-down`, `C-a C-left`, `C-a C-right` - resize by 1 row/column

Applying predefined layouts:

* `C-a M-1`       - switch to even-horizontal layout
* `C-a M-2`       - switch to even-vertical layout
* `C-a M-3`       - switch to main-horizontal layout
* `C-a M-4`       - switch to main-vertical layout
* `C-a M-5`       - switch to tiled layout
* `C-a space`     - switch to the next layout

Switching between panes:

* `C-l`            - go to the next pane on the left
* `C-h`            - go to the next pane on the right
* `C-j`            - go to the next pane on the up
* `C-k`            - go to the next pane on the down
* `C-\`            - go to previous split
* `C-h/j/k/l/\`    - navigate between panes and including Vim splits
* `C-a o`          - go to the next pane (cycle through all of them)
* `C-a ;`          - go to the ‘last’ (previously used) pane

Other:

* `C-a d`   - detach from a session:
* `C-a c`   - create a new window
* `C-a a`   - rename the current window;
* `C-a q`   - display pane numbers for a short while
* `C-a y`   - toggle "synchronize" to all panes of the current windows;
* `C-a z`   - toggle pane zoom between full window size and normal pane size.
* `C-a x`   - kill the current pane
* `C-a ,`   - rename the current window or
* `C-a &`   - kill the current window.

Copy and paste inside Tmux:

```
1) Alt-ESCAPE (=M-ESCAPE): enter copy mode, use vi keys for navigation
(h,j,k,l,H,M,L,g,G,/,?);
2) v: start selection;
3) y or Enter: The End Selection;
4) Alt-p (=M-p): paste selection.
```
> :notebook_with_decorative_cover: **NOTE**: Prefix- =: View all copy buffers
> and pastes selection (Press to ESCAPE (=Esc) mode or Enter select). Hold
> "Shift" if one wishes to copy and paste into or out-of tmux using mouse
> selections.

#### Other config file settings

Force a reload of the config file on `C-a r`:

```
unbind r
bind r source-file ~/.tmux.conf
```

Some other settings that I use:
```
setw -g xterm-keys on
```

Usage, at command line:

```shell
$ tmux new -s foglamp    # create a new session named foglamp
$ tmux ls                # list active sessions
$ tmux attach            # attach to first active session
$ tmux attach -t foglamp # attach to session named "foglamp".
```
> :notebook_with_decorative_cover: **NOTE**: `tnew` is an alias to create a
> session named using the current directory

## :unicorn: Vimization of everything

Also an included `Ctrl-R` reverse history search feature in editrc, very useful
in irb, postgres command line, and etc.

## :pizza: Vim - What's included?

 * [Navigation - NERDTree, EasyMotion, FZF and more](doc/vim/navegation.md)
 * [Code manipulation - rails support, comments, snippets, highlighting](doc/vim/coding.md)
 * [Utils - indents, paste buffer management, lots more](doc/vim/utils.md)
 * [General enhancements that don't add new commands](doc/vim/enhancements.md)

A list of some of the most useful commands that Dotfiles provides in vim are
included below. This is not a comprehensive list. To get deeper knowledge,
practice a few of these every day, and then start looking into the lists
of plugins above to learn more.

### Navigation

 * `,z` - go to previous buffer (:bp)
 * `,x` - go to next buffer (:bn)
 * `Cmd-j` and `Cmd-k` to move up and down roughly by functions (`Alt` in Linux)
 * `Ctrl-o` - Old cursor position - this is a standard mapping but very useful, so included here
 * `Ctrl-i` - opposite of Ctrl-O (again, this is standard)

### Search/Code Navigation

 * `,tg` - instantly Find definition of class (must have exuberant ctags installed)
 * `,T` - same as `,tg` but in a vertical split
 * `,gf` or `Ctrl-f` - same as vim normal gf (go to file), but in a vertical
split (works with file.rb:123 line numbers also)
 * `gF` - standard vim mapping, here for completeness (go to file at line number)
 * `,k` - Search the current word under the cursor and show results in quickfix window
 * `,K` - Grep the current word up to next exclamation point (useful for ruby foo! methods)
 * `,hl` - toggle search highlight on and off
 * `,gg` or `,ag` - Grep command line, type between quotes. Uses Ag Silver Searcher.
After searching with `,gg` you can navigate the results with `Ctrl-x` and `Ctrl-z` (or standard vim `:cn` and `:cp`)
 * `,gd` - Grep def (greps for 'def [function name]') when cursor is over the function name
 * `,gcf` - Grep Current File to find references to the current file
 * `//` - clear the search
 * `,,w` (alias `,<esc>`) or `,,b` (alias `,<shift-esc>`) - EasyMotion, a
vimperator style tool that highlights jump-points on the screen and lets you
type to get there.
 * `,mc` - mark this word for MultiCursor (like sublime). Use `Ctrl-n` (next),
`Ctrl-p` (prev), `Ctrl-x`(skip) to add more cursors, then do normal vim
   things like edit the word.
 * `gK` - Opens the documentation for the word under the cursor.
Spacebar - Sneak - type two characters to move there in a line.
Kind of like vim's `f` but more accurate.
 * `:Gsearch foo` - global search, then do your normal `%s/search/replace/g` and
follow up with `:Greplace` to replace across all files. 
When done use `:wall` to write all the files.

### File Navigation

 * `,fzf`  - Fzf-vim fuzzy file selector
 * `,fb` - Fzf-vim buffer selector - great for jumping to a file you already have open
 * `,fbt` - jump to method - Fzf tag search within current buffer
 * `Ctrl-\` - Show current file in NERDTree

### Better keystrokes for common editing commands

 * Ctrl-Space to autocomplete. Tab for snipmate snippets.
 * `,#` `,"` `,'` `,]` `,)` `,}` to surround a word in these common wrappers.
 the # does #{ruby interpolation}. works in visual mode. Normally these are
 done with something like `ysw#` `Cmd-'`, `Cmd-"`, `Cmd-]`, `Cmd-)`, etc to
 change content inside those surrounding marks. You don't have to be inside them (`Alt` in Linux)
 * `,.` to go to last edit location (same as `'.`) because the apostrophe is hard on the pinky
 * `,ci` to change inside any set of quotes/brackets/etc

### Tabs, Windows, Splits

 * Use `Cmd-1` thru `Cmd-9` to switch to a specific tab number (like iTerm) -
 and tabs have been set up to show numbers (`Alt` in Linux)
 * `Ctrl-h,l,j,k` - to move left, right, down, up between splits. This also
 works between vim and tmux splits thanks to `vim-tmux-navigator`.
 * `Q` - Intelligent Window Killer. Close window `wincmd c` if there are
 multiple windows to same buffer, or kill the buffer `bwipeout` if this is the
 last window into it.
 * `vv` - vertical split (`Ctrl-w,v`)
 * `ss` - horizontal split (`Ctrl-w,s`)
 * `,qo` - open quickfix window (this is where output from Grep goes)
 * `,qc` - close quickfix

### Utility

 * `Ctrl-p` after pasting - Use `p` to paste and `Ctrl-p` to cycle through
 previous pastes. Provided by YankRing.
 * `,yr` - view the yankring - a list of your previous copy commands. also you
 can paste and hit `ctrl-p` for cycling through previous copy commands
 * `crs`, `crc`, `cru` via abolish.vim, coerce to snake_case, camelCase, and
 UPPERCASE. There are more `:help abolish`
 * `:NR` - NarrowRgn - use this on a bit of selected text to create a new split
 with just that text. Do some work on it, then :wq it to get the results back.
 * `,cf` - Copy Filename of current file (full path) into system (not vi) paste buffer
 * `,cn` - Copy Filename of current file (name only, no path)
 * `,yw` - yank a word from anywhere within the word (so you don't have to go to
 the beginning of it)
 * `,ow` - overwrite a word with whatever is in your yank buffer - you can be
 anywhere on the word. saves having to visually select it
 * `,ocf` - open changed files. open all files with git changes in splits
 * `,w` - strip trailing whitespaces
 * `sj` - split a line such as a hash {:foo => {:bar => :baz}} into a multiline hash (j = down)
 * `sk` - unsplit a link (k = up)
 * `Cmd-Shift-A` - align things (type a character/expression to align by, works
 in visual mode or by itself) (`Alt` in Linux)
 * `:ColorToggle` - turn on #abc123 color highlighting (useful for css)
 * `:Gitv` - Git log browsers
 * `,hi` - show current Highlight group. if you don't like the color of
 something, use this, then use `hi! link [groupname] [anothergroupname]` in
 your vimrc.after to remap the color. You can see available colors using `:hi`
 * `,gt` - Go Tidy - tidy up your html code (works on a visual selection)
 * `:Wrap` - wrap long lines (e.g. when editing markdown files)
 * `Cmd-/` - toggle comments (usually gcc from tComment) (`Alt` in Linux)
 * `gcp` (comment a paragraph)

### Rails & Ruby

 * `,vv` and `,cc` to switch between view and controller - these are maps to
 :Rcontroller and :Rview. Explore the :R<Tab> family of commands for more fun
  from rails.vim!
 * `,rs` and `,rl` to run rspec or a spec line in iTerm (check iTerm window for results)
 * `,ss` and `,sl` for the same using `spring rspec` which makes your Rails
 specs faster by caching the Rails env (must have spring gem installed)
 * vim-ruby-refactoring - try `,rem`, `,rel` to extract methods or let statements
 * `:Bopen [gem name]` to navigate to a gem.
 * `,orb` - outer ruby block. takes you one level up from nested blocks (great for rspec)

### Vim Dev

 * `,vc` - (Vim Command) copies the command under your cursor and executes it in
 vim. Great for testing single line changes to vimrc.
 * `,vr` - (Vim Reload) source current file as a vim file

### Vim Cheatsheet
> :warning: **WARNING**: This cheatsheet is summarized from personal experience and other
> online tutorials. It should not be considered as an official advice.

#### Global

* `:help keyword` - open help for keyword
* `:o file`       - open file
* `:saveas file`  - save file as
* `:close`        - close current pane

#### Normal mode - movement

* `h`         - move cursor left
* `j`         - move cursor down
* `k`         - move cursor up
* `l`         - move cursor right
* `H`         - move to top of screen
* `M`         - move to middle of screen
* `L`         - move to bottom of screen
* `w`         - jump forwards to the start of a word
* `W`         - jump forwards to the start of a word (words can contain punctuation)
* `e`         - jump forwards to the end of a word
* `E`         - jump forwards to the end of a word (words can contain punctuation)
* `b`         - jump backwards to the start of a word
* `B`         - jump backwards to the start of a word (words can contain punctuation)
* `0`         - jump to the start of the line
* `^`         - jump to the first non-blank character of the line
* `$`         - jump to the end of the line
* `g_`        - jump to the last non-blank character of the line
* `gg`        - go to the first line of the document
* `G`         - go to the last line of the document
* `{number}G` - go to line {number}
* `t{char}`   - Till before [count]'th occurrence of {char} to the right
* `T{char}`   - Till before [count]'th occurrence of {char} to the left
* `f{char}`   - To [count]'th occurrence of {char} to the right
* `F{char}`   - To [count]'th occurrence of {char} to the left
* `;`         - Repeat latest f, t, F or T [count] times
* `,`         - Repeat latest f, t, F or T in opposite direction
* `}`         - jump to next paragraph (or function/block, when editing code)
* `{`         - jump to previous paragraph (or function/block, when editing code)
* `zz`        - center cursor on screen
* `Ctrl + b`  - move back one full screen
* `Ctrl + f`  - move forward one full screen
* `Ctrl + d`  - move forward 1/2 a screen
* `Ctrl + u`  - move back 1/2 a screen

#### Normal mode - editing

* `r`        - replace a single character
* `J`        - join line below to the current one
* `cc`       - change (replace) entire line
* `cw`       - change (replace) to the start of the next word
* `ce`       - change (replace) to the end of the next word
* `cb`       - change (replace) to the start of the previous word
* `c0`       - change (replace) to the start of the line
* `c$`       - change (replace) to the end of the line
* `s`        - delete character and substitute text
* `S`        - delete line and substitute text (same as cc)
* `xp`       - transpose two letters (delete and paste)
* `.`        - repeat last command
* `u`        - undo
* `Ctrl + r` - redo

### Insert mode - inserting/appending text

* `i`        - insert before the cursor
* `I`        - insert at the beginning of the line
* `a`        - insert (append) after the cursor
* `A`        - insert (append) at the end of the line
* `o`        - append (open) a new line below the current line
* `O`        - append (open) a new line above the current line
* `ea`       - insert (append) at the end of the word
* `Esc`      - exit insert mode

### Insert mode -  delete and insert

* `ctrl-h`      - While in *Insert mode*: delete character before the cursor
* `ctrl-w`      - While in *Insert mode*: delete word before the cursor
* `d{motion}`   - Delete text that {motion} moves over
* `dd`          - Delete line
* `D`           - Delete characters under the cursor until the end of the line
* `c{motion}`   - Delete {motion} text and start insert
* `cc`          - Delete line and start insert
* `C`           - Delete to the end of the line and start insert
* `r{char}`     - Replace the character under the cursor with {char}
* `R`           - Enter replace mode: Each character replaces existing one
* `x`           - Delete [count] characters under and after the cursor

### Visual mode - marking text

* `v`        - start visual mode, mark lines, then do a command (like y-yank)
* `V`        - start linewise visual mode
* `o`        - move to other end of marked area
* `O`        - move to other corner of block
* `aw`       - mark a word
* `ab`       - a block with ()
* `aB`       - a block with {}
* `ib`       - inner block with ()
* `iB`       - inner block with {}
* `Esc`      - exit visual mode
* `Ctrl + v` - start visual block mode

### Visual mode - visual commands

* `>`       - shift text right
* `<`       - shift text left
* `y`       - yank (copy) marked text
* `d`       - delete marked text
* `~`       - switch case

### Visual mode or Normal - cut and paste

* `yy`       - yank (copy) a line
* `2yy`      - yank (copy) 2 lines
* `yw`       - yank (copy) the characters of the word from the cursor position
to the start of the next word
* `y$`       - yank (copy) to end of line
* `p`        - put (paste) the clipboard after cursor
* `P`        - put (paste) before cursor
* `dd`       - delete (cut) a line
* `2dd`      - delete (cut) 2 lines
* `dw`       - delete (cut) the characters of the word from the cursor position
to the start of the next word
* `D`        - delete (cut) to the end of the line
* `d$`       - delete (cut) to the end of the line
* `d^`       - delete (cut) to the first non-blank character of the line
* `d0`       - delete (cut) to the begining of theline
* `x`        - delete (cut) character

### Command mode - search and replace

* `/pattern`       - search for pattern
* `?pattern`       - search backward for pattern
* `\vpattern`      - 'very magic' pattern: non-alphanumeric characters are
interpreted as special regex symbols (no escaping needed)
* `n`              - repeat search in same direction
* `N`              - repeat search in opposite direction
* `:%s/old/new/g`  - replace all old with new throughout file
* `:%s/old/new/gc` - replace all old with new throughout file with confirmations
* `:noh`           - remove highlighting of search matches

### Command mode - search in multiple files

* `:vimgrep /pattern/ {file}` - search for pattern in multiple files
* `:cn`                       - jump to the next match
* `:cp`                       - jump to the previous match
* `:copen`                    - open a window containing the list of matches

### Command mode - exiting

* `:w`                  - write (save) the file, but don't exit
* `:w !sudo tee %`      - write out the current file using sudo
* `:wq` or `:x` or `ZZ` - write (save) and quit
* `:q`                  - quit (fails if there are unsaved changes)
* `:q!` or `ZQ`         - quit and throw away unsaved changes

### Command mode - working with multiple files

* `:e file`         - edit a file in a new buffer
* `:bnext` or `:bn` - go to the next buffer
* `:bprev` or `:bp` - go to the previous buffer
* `:bd`             - delete a buffer (close a file)
* `:ls`             - list all open buffers
* `:sp file`        - open a file in a new buffer and split window
* `:vsp file`       - open a file in a new buffer and vertically split window
* `Ctrl + ws`       - split window
* `Ctrl + ww`       - switch windows
* `Ctrl + wq`       - quit a window
* `Ctrl + wv`       - split window vertically
* `Ctrl + wh`       - move cursor to the left window (vertical split)
* `Ctrl + wl`       - move cursor to the right window (vertical split)
* `Ctrl + wj`       - move cursor to the window below (horizontal split)
* `Ctrl + wk`       - move cursor to the window above (horizontal split)

### Command mode or Normal - tabs

* `:tabnew` or `:tabnew file`   - open a file in a new tab
* `Ctrl + wT`                   - move the current split window into its own tab
* `gt` or `:tabnext` or `:tabn` - move to the next tab
* `gT` or `:tabprev` or `:tabp` - move to the previous tab
* `<number>gt`                  - move to tab <number>
* `:tabmove <number>`           - move current tab to the <number>th position (indexed from 0)
* `:tabclose` or `:tabc`        - close the current tab and all its windows
* `:tabonly` or `:tabo`         - close all tabs except for the current one
* `:tabdo command`              - run the command on all tabs (e.g. :tabdo q -
closes all opened tabs)
</p>
</details>

## :gear: Dotfiles settings

* [Debugging vim keymappings](doc/vim/keymaps.md)
* [Overriding vim settings with ~/.vimrc.after and friends](doc/vim/override.md)
* [Adding your own vim plugins](doc/vim/manage_plugins.md)

## :whale: Testing with Docker

We can use Docker to test some changes in a **Linux** Container.

Assuming your host system has `docker` and `docker-compose` properly installed, run:

```shell
$ docker-compose run dotfiles
```

This will build the container image if it never built it before (which may take
a while -- future times will be faster) and then run a `zsh` session inside
that container for you. There you can play around, test commands, aliases, etc.

> :warning: **WARNING**: This repo is primarily macOS oriented. So any support
> for Linux can only be done with the help of the community.

## :scroll: License
This project is licensed under GNU. Please fork, contribute and share.

## :mega: Loathing, Mehs and Praise
1. Loathing should be directed into pull requests that make it better. woot.
2. Bugs with the setup should be put as GitHub issues.
3. Praise should be directed to
![@areis__](https://img.shields.io/twitter/follow/areisrosa.svg?style=social&label=@areis__)

> :warning: **WARNING**: The creator of this repo is not responsible if your
> machine ends up in a state you are not happy with. If you are concerned, look
> at the code to review everything this will do to your machine.

## :tada: Misc

* [Credits & Thanks](doc/misc/credits.md)
* [Other recommended macOS productivity tools](doc/misc/macos_tools.md)
* [Yan's Blog](https://yanpritzker.com)

## :grin: Made with :sparkling_heart: by yours truly. 
