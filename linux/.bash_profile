# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
  fi

  # User specific environment and startup programs

  PATH=$PATH:$HOME/bin

  export PATH

  # Change default dark-blue to lighter-blue
  # Courtesy of [@jared-smartt](https://github.hpe.com/jared-smartt)
  LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS
