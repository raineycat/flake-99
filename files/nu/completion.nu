let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}
let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }
    $spans | save -f ~/.tmp-spans.nuon

    match $spans.0 {
        _ => $carapace_completer
    } | do $in $spans
}
$env.config.completions.external = {
    enable: true,
    completer: $external_completer,
};