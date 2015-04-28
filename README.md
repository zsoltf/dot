dot
===

personal dotfiles branched by machine


## bash
#### aliases
.bashrc.custom
```bash
# aliases
alias df="dfc"
alias l="ls++"
alias ll="ls++ -a"
alias img="gotermimg -u=true"
alias vb="vim ~/.bashrc.custom"
alias du="cdu -i -d h"

# bundler
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo vendor/ruby >> .gitignore"
alias ber="be rspec"
alias berp="be rake db:test:prepare && ber"

# for xvfb
alias xvfb='Xvfb :1 -screen 5 1024x768x8 &'
export DISPLAY=:1.5

# dropbox
alias drop="python ~/.dropbox/dropbox.py"
```
#### tmux on startup
```bash
# always open tmux
if ( tmux list-sessions ); then
  tmux -2u att 2> /dev/null
else
  tmux -2u new -s trusty
fi
```

## tmux
#### shortcuts
```
# Create splits and vertical splits
bind-key ^V split-window -h
```
#### settings
```
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
```
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

