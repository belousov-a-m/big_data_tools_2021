#!/bin/bash
echo "[ INFO ] Start str uploading script...."
LOG_DISABLE=1
function clean {
	[[ -z "$LOG_DISABLE" ]] && echo "[ INFO ] Start clean"
	redis-cli KEYS "user:*" | xargs redis-cli DEL > /dev/null
	[[ -z "$LOG_DISABLE" ]] && echo "[ INFO ] Clean complete"
}
function generation {
	# Clean generated file
	> generation.txt
	for ((i = 1; i < END+1; i++)); do
		echo "SET user:${i} someValue${i}" >> generation.txt
	done
}

function upload {
	cat generation.txt | redis-cli --pipe > /dev/null
}

# Entry point
clean

echo "Time for upload 1.000.000 string row"
END=1000000
generation
time upload
clean
echo "--------------------------"
echo ""

echo "Time for upload 10.000.000 string row"
END=10000000
generation
time upload
clean
echo "--------------------------"
echo ""


echo "[ INFO ] Script end"

