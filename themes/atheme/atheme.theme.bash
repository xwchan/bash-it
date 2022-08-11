# shellcheck shell=bash
# shellcheck disable=SC2034 # Expected behavior for themes.
SCM_GIT_CHAR=" git:"
SCM_GIT_SHOW_DETAILS="false"
SCM_NONE_CHAR=" "
SCM_THEME_PROMPT_DIRTY=" ${red?}✗"
SCM_THEME_PROMPT_CLEAN=" ${green?}✓"
# SCM_THEME_PROMPT_PREFIX=" ${green?}|"
# SCM_THEME_PROMPT_SUFFIX="${green?}|"

GIT_THEME_PROMPT_DIRTY=" ${red?}✗"
GIT_THEME_PROMPT_CLEAN=" ${green?}✓"
GIT_THEME_PROMPT_PREFIX=" ${bold_cyan?}"
GIT_THEME_PROMPT_SUFFIX=" ${bold_cyan?}"

function __bobby_clock() {
	printf '%s' "$(clock_prompt) "

	if [[ "${THEME_SHOW_CLOCK_CHAR:-}" == "true" ]]; then
		printf '%s' "$(clock_char) "
	fi
}

function prompt_command() {
	PS1="\n$(battery_char) $(__bobby_clock)"
	PS1+="${yellow?}$(ruby_version_prompt) "
	PS1+="${purple?}\u @ \H "
	PS1+="${reset_color?}in "
	PS1+="${green?}\w\n"
	PS1+="${bold_cyan?}$(scm_prompt_char_info)"
	PS1+="${green?}\$${reset_color?} "
}

: "${THEME_SHOW_CLOCK_CHAR:="false"}"
: "${THEME_CLOCK_CHAR_COLOR:=${red?}}"
: "${THEME_CLOCK_COLOR:=${blue?}}"
: "${THEME_CLOCK_FORMAT:="[星期%a %Y-%m-%d %H:%M:%S]"}"

safe_append_prompt_command prompt_command
