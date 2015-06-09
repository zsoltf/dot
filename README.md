dot
===

personal dotfiles branched by machine
.bashrc.d       bash aliases and functions
.dot            installers
.vim            vim, the editor
.bashrc         bash configuration
.dircolors      ls colors
.fbtermrc       frame buffer terminal
.gitconfig      git configuration
.inputrc        inputrc for nice completion
.pryrc          ruby irb replacement
.tmux.conf      terminal multiplexer

## bash
##### aliases.bash
```bash
alias c="clear;"
alias g="git"
alias gc="git commit -m"
alias apt="sudo apt-get"
alias img="gotermimg -u=true"
```

## vim

## dircolors

## fbterm

## git

## pry

## tmux
#### tmux on startup
```bash
# always open tmux
if ( tmux list-sessions ); then
  tmux -2u att 2> /dev/null
else
  tmux -2u new -s trusty
fi
```
#### shortcuts
```bash
# Create splits and vertical splits
bind-key ^V split-window -h
```
#### settings
```bash
# prefix
unbind C-b
set -g prefix C-s
bind-key C-s send-prefix

# No escape time for vi mode
set -sg escape-time 50

# Bigger history
set -g history-limit 10000

set -g automatic-rename on

set -g monitor-activity on
set -g visual-activity on

# set mouse mode for resizing panes
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on
set -g mouse-select-window on
```
#### statusline
powerline glyphs with molokai theme
```bash
# color scheme molokai
set -g status on
set -g status-interval 2
set -g status-utf8 on
set-window-option -g utf8 on
set -g status-left-length 52
set -g status-right-length 451

set -g pane-border-fg colour245
set -g pane-border-bg "#080808"
set -g pane-active-border-fg "#FD971F"
set -g pane-active-border-bg "#080808"

set -g status-fg black
set -g status-bg colour234

set -g window-status-style fg=black,bg=black
set -g window-status-format "#[fg=#002b36,bg=default]#[fg=#525144,bg=default] #I #W#F #[fg=default,bg=#002b36]"
set -g window-status-current-format "#[fg=#002b36,bg=#6292A9] #I #W#F#P #[fg=#6292A9,bg=#002b36]"
set -g window-status-separator ""

set -g status-left '#[fg=##6292A9,bg=#002b36] #S'
set -g status-right '#[fg=#073642,bg=#002b36]#[fg=#586e75,bg=#073642] %H:%M '

setw -g window-status-activity-style fg="#f65d19",bg="#f65d19"

set -g message-style fg=black,bg='#FD971F'
set -g display-time 2000
```

