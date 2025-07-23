$env.config.buffer_editor = "hx"
$env.config.show_banner = false

def --wrapped file [...paths] {
    ^file ...$paths | parse "{name}: {type}" | str trim
}

let flake_path = "/mnt/c/flake-99";

alias f99-local-build =         nixos-rebuild switch --flake path:($flake_path) --sudo
alias f99-remote-build-desolo = nixos-rebuild switch --flake path:($flake_path)(char hash)desolo --target-host raine@192.168.1.105 --sudo

mkdir ($nu.data-dir | path join vendor autoload)
starship init nu | save -f ($nu.data-dir | path join vendor autoload starship.nu)
