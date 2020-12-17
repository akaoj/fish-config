# Restart SSH agent
function restart_ssh_agent
	set -u SSH_AGENT_PID
	set -u SSH_AUTH_SOCK

	start_ssh_agent
end
