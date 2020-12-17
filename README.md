Fish configuration
==================

Note that all following examples are correctly colorized in a real terminal (the blueish color here is because of
GitHub).

By default, this Fish configuration displays the following terminal:

```console
┌localhost:/home/user
└12:40:30> 
```

If you are in a Git repository, it displays the current branch:

```console
┌localhost:/home/user/somegitrepo
└12:40:30 [my/branch]> 
```

If you have `kubectl` setup, it displays the current context:

```console
┌localhost:/home/user
└12:40:30 {my-context}> 
```

If you have background jobs running, it displays them:

```console
┌localhost:/home/user
│ 2 jobs: "nvim README.md", "nvim myfile.txt"
└12:40:30> 
```

Of course, if you are in all (or part) of the preceding cases, it displays everything, i.e.:

```console
┌localhost:/home/user
│ 2 jobs: "nvim README.md", "nvim myfile.txt"
└12:40:30 {my-context} [my/branch]> 
```


Customize Kubernetes contextes
==============================

You can change the color of the Kubernetes contexts. By default, they are printed in grey.

In order to do so, you need to have a `$HOME/.config/fish/k8s_contexts.fish` file which defines the `k8s_contexts`
variable with the contexts you want to customize and the colors you want to apply, separated by a colon, i.e.:

```fish
set k8s_contexts \
	"prod:brred" \
	"preprod:FFA000" \
	"dev:brgreen"
```

You can either set the color as hexadecimal value, or specified a predefined color (see the
[fish shell documentation](https://fishshell.com/docs/current/commands.html#set_color) for the complete list of
available keywords).


Activate fzf integration
========================

	sudo ln -s /usr/share/fzf/shell/key-bindings.fish /usr/share/fish/vendor_functions.d/fzf_key_bindings.fish
