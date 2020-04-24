# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [[ -f $config && ${config:e} != "zwc" ]]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
#export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
#export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
#export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
#export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

export ASDFROOT=$HOME/.asdf
export ASDFINSTALLS=$HOME/.asdf/installs
export GOPATH=$HOME/code/go
GOV=$(asdf current golang | sed  's/ (set by .*)//g')
export GOROOT=$ASDFINSTALLS/golang/1.12.9/go/

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Required for building python with asdf
#export LDFLAGS="-L/usr/local/opt/zlib/lib"
#export CPPFLAGS="-I/usr/local/opt/zlib/include"
#export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
#
export TERM="screen-256color"
