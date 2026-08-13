function prompt_precmd() {
    local magenta=$'\e[35m' cyan=$'\e[36m' reset=$'\e[m' green=$'\e[32m'

    # --- アイコン定義 (Nerd Fonts) ---
    local icon_branch=$'\ue0a0'  #  Branch
    local icon_git=$'\uf1d3'     #  Git
    local icon_github=$'\uf09b'  #  GitHub
    local icon_folder=$'\uf07c'  #  Folder
    # -------------------------------

    # 1. Git情報の取得
    local branch="$(git branch --show-current 2>/dev/null)"
    local git_user="$(git config user.name 2>/dev/null)"

    # 2. GitHub CLI (gh) ユーザーの取得
    # 注意: `gh api user` コマンドは遅いため、設定ファイル(hosts.yml)から直接読み取って高速化しています
    local gh_user=""
    local current_dir
    local company_dir="$HOME/dev/company/smesh"
    local gh_config_dir="$HOME/.config/gh"

    current_dir=$(pwd -P) || return
    if [[ "$current_dir" == "$company_dir" || "$current_dir" == "$company_dir"/* ]]; then
        gh_config_dir="$HOME/.config/gh-smesh"
    fi

    local gh_config="$gh_config_dir/hosts.yml"

    # ghコマンドがあり、設定ファイルが存在する場合のみ取得
    if command -v gh >/dev/null && [[ -f "$gh_config" ]]; then
        # hosts.ymlから "github.com" ブロックにある "user:" を抽出
        gh_user=$(grep -A 5 "github.com" "$gh_config" 2>/dev/null | grep "user:" | head -n 1 | awk '{print $2}')
    fi

    # 3. 表示用の文字列整形
    local user_info=""
    # gitユーザーが設定されている場合のみ表示する (git管理外でも表示したい場合は条件を外してください)
    if [[ -n "$git_user" ]]; then
        # gh_userが空の場合は "?" や "未ログイン" などを表示しても良い
        local gh_display="${gh_user:-?}"
        user_info=" <${icon_git} ${git_user}, ${icon_github} ${gh_display}>"
    fi

    if [[ -n "$branch" ]]; then
        branch=" [ ${cyan}${icon_branch} ${branch}${reset}]"
    fi

    PROMPT="${magenta}${icon_folder} %/ ${reset}${branch}${user_info}
 $ "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd
