#!/bin/bash
echo "[ INFO ] Start Hash script uploader ...."
LOG_DISABLE=1
function clean {
	[[ -z "$LOG_DISABLE" ]] && echo "[ INFO ] Start clean"
	redis-cli KEYS "user:*" | xargs redis-cli DEL > /dev/null
	[[ -z "$LOG_DISABLE" ]] && echo "[ INFO ] Clean complete"
}

function generate {
	# Clean generated file
	> generation.txt
	for ((i = 1; i < END+1; i++)); do
		echo "HMSET user:${i} KEYFIRST value${i} KEYSECOND value${i} KEYTHIRD value${i}" >> generation.txt
	done
}

function upload {
	cat generation.txt | redis-cli --pipe > /dev/null
}

# Entry point
clean

echo ""
echo "Time for upload 1.000.000 hash"
END=1000000
generate
time upload
clean
echo "--------------------------"

echo ""
echo "Time for upload 10.000.000 hash"
END=10000000
generate
time upload
clean
echo "--------------------------"

echo "[ INFO ] Script end"
