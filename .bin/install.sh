#!/usr/bin/env bash
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

# Directories that should NOT be symlinked wholesale.
# Individual files within these are linked by link_nested_dir().
NESTED_DIRS=(".claude" ".agents")

is_nested_dir() {
  local name="$1"
  for d in "${NESTED_DIRS[@]}"; do
    [[ "$name" == "$d" ]] && return 0
  done
  return 1
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      [[ `basename $f` == ".gitignore" ]] && continue
      is_nested_dir "$(basename $f)" && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi
}

# Recursively symlink individual files from a dotfiles subdirectory
# into the corresponding directory under $HOME.
# e.g. dotfiles/.claude/hooks/deny-check.sh -> ~/.claude/hooks/deny-check.sh
link_nested_dir() {
  local src_dir="$1"
  local dest_dir="$HOME/$(basename "$src_dir")"

  find "$src_dir" -type f | while read -r src_file; do
    local rel="${src_file#$src_dir/}"
    local dest="$dest_dir/$rel"
    command mkdir -p "$(dirname "$dest")"
    if [[ -e "$dest" && ! -L "$dest" ]]; then
      command mkdir -p "$HOME/.dotbackup/$(basename "$src_dir")/$(dirname "$rel")"
      command mv "$dest" "$HOME/.dotbackup/$(basename "$src_dir")/$rel"
    fi
    command ln -snf "$src_file" "$dest"
  done
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir

# Link nested directories (AI tool configs)
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
dotdir=$(dirname ${script_dir})
for d in "${NESTED_DIRS[@]}"; do
  if [[ -d "$dotdir/$d" ]]; then
    command echo "linking $d..."
    link_nested_dir "$dotdir/$d"
  fi
done

git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"

