# =============================================================================
# Terminal
# =============================================================================

function cdls() {
	\cd "$@" && ls
}

# =============================================================================
# GitHub
# =============================================================================

function ghautoswitch() {
	local email

	if ! email=$(git config user.email); then
		echo "No email found in git config"
		return 0
	fi

	if [ "$email" = "abe@smesh.jp" ]; then
		gh auth switch --user abe-smesh
	else
		gh auth switch --user M1n01
	fi
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
