# =============================================================================
# Terminal
# =============================================================================

function cdls() {
	\cd "$@" && ls
}

# =============================================================================
# GitHub
# =============================================================================

function gh() {
	local current_dir
	local company_dir="$HOME/dev/company/smesh"
	local gh_config_dir="$HOME/.config/gh"

	current_dir=$(pwd -P) || return
	if [[ "$current_dir" == "$company_dir" || "$current_dir" == "$company_dir"/* ]]; then
		gh_config_dir="$HOME/.config/gh-smesh"
	fi

	GH_CONFIG_DIR="$gh_config_dir" command gh "$@"
}

# =============================================================================
# Codex
# =============================================================================

function codex() {
	local current_dir
	local company_dir="$HOME/dev/company/smesh"
	local codex_home="$HOME/.codex"

	current_dir=$(pwd -P) || return
	if [[ "$current_dir" == "$company_dir" || "$current_dir" == "$company_dir"/* ]]; then
		codex_home="$HOME/.codex-smesh"
	fi

	CODEX_HOME="$codex_home" command codex "$@"
}
