# Retrieve current Kubernetes context
function k8s_get_context
	# Print nothing if there is no k8s config file
	if test -e "$HOME/.kube/config"
		grep 'current-context' "$HOME/.kube/config" 2>/dev/null | cut -f 2 -d ' ' | tr --delete "\n"
	end
end
