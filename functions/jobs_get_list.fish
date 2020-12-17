# Retrieve the current list of background jobs
function jobs_get_list
	jobs | cut -f '5-'
end
