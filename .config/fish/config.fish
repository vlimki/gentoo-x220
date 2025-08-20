if status is-interactive
    # Commands to run in interactive sessions can go here
end

export TERM=xterm-256color

fish_vi_key_bindings

function fish_prompt
	echo "$(set_color green)gentoo $(set_color brblue)$(prompt_pwd)$(tput sgr0)> "
end

set fish_greeting ""

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color brblue
            echo -n "[N] "
        case insert
            set_color brblue
            echo -n "[I] "
        case visual
            set_color brblue
            echo -n "[V] "
    end
    set_color normal
end
