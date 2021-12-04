#!/bin/bash

echo "[ INFO ] Start image uploader script...."
img="$(cat suricata.jpg | base64 -w 0)"
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
		echo "SET user:${i} ${img}" >> generation.txt
	done
}

function upload {
	cat generation.txt | redis-cli --pipe > /dev/null
}

# Entry point
clean

echo "Time for upload 1_000 string row"
echo "--------------------------"
END=1000
generate
time upload
echo "--------------------------"
echo ""

echo "Time for upload 10_000 string row"
END=10000
generate
time upload
echo "--------------------------"
echo ""

echo "Time for upload 100_000 string row"
END=100000
generate
time upload
echo "--------------------------"
echo ""

echo "Time for upload 500_000 string row"
END=500000
generate
time upload
echo "--------------------------"
echo ""

echo "[ INFO ] Script end"
