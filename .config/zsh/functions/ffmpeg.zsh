# useful functions for using ffmpeg to transcode media to/from
# formats that can be used with Davinci Resolve
# full credit to bazuin-32 for the functions

# converts mp4/h.264 videos to mov/dnxhd
# usage:
# 	mp42mov input.mp4
# 	mp42mov -r ~/Videos/some_folder
function mp42mov {
	setopt +o nomatch

	local input_files=()

	if [[ "$1" == "-r" ]]; then
		# recursive, next argument should be a directory
		if [ ! -d "$2" ]; then
			echo "$0: error: '$2' is not a directory" 1>&2
			return 1
		fi

		for file in $2/**.{mp,MP}4; do # some files use capitals (MP4), others use lowercase (mp4), so both are handled
			input_files+=("$file")
		done
	elif [ -f "$1" ]; then
		# we were given just a file, so we try to check all arguments
		# in case more files were given, and make sure they are mp4
		for arg in "$@"; do
			extension="${$(basename -- $arg)##*.}"
			
			# TODO: fix this first if statement, its body runs even
			# on valid mp4 files
#			if [[ $extension != "mp4" || $extension != "MP4" ]]; then
#				echo $extension
#				echo "$0: warning: '$arg' is not an mp4 file, discarding and continuing..." 1>&2
			if [ ! -f "$arg" ]; then
				echo here
				echo "$0: warning: '$arg' is not an mp4 file, discarding and continuing..." 1>&2
			else
				echo "adding $arg"
				input_files+=("$arg")
			fi
		done
	
	elif [ -d "$1" ]; then
		# we were given a directory, so transcode all mp4s in
		# that dir without recursion (since we have the `-r` flag for that)

		for file in $1/*.{mp,MP}4; do
			input_files+=("$file")
		done

	elif [[ "$1" != "" ]]; then
		# we have some random input
		echo "$0: error: '$1' is not a file" 1>&2
		return 1
	else
		# no argument was given
		echo "$0: error: no input files" 1>&2
		return 1
	fi

	local num_files=${#input_files[@]}
	if [ $num_files -lt 1 ]; then
		echo "$0: error: no input files" 1>&2
		return 1
	fi

	for file in "${input_files[@]}"; do
		file_no_ext="${file%.*}"

		ffmpeg -hwaccel cuda -i "$file" -vcodec dnxhd -acodec pcm_s24le -s 1920x1080 -r 60 -b:v 36M -pix_fmt yuv422p -f mov "$file_no_ext.mov"
	done

	setopt -o nomatch
}


function mov2mp4 {
	setopt +o nomatch

	local input_files=()

	if [[ "$1" == "-r" ]]; then
		# recursive, next argument should be a directory
		if [ ! -d "$2" ]; then
			echo "$0: error: '$2' is not a directory" 1>&2
			return 1
		fi

		for file in $2/**.{mov,MOV}; do # some files use capitals (MP4), others use lowercase (mp4), so both are handled
			input_files+=("$file")
		done
	elif [ -f "$1" ]; then
		# we were given just a file, so we try to check all arguments
		# in case more files were given, and make sure they are mp4
		for arg in "$@"; do
			extension="${$(basename -- $arg)##*.}"
			
			# TODO: fix this first if statement, its body runs even
			# on valid mp4 files
#			if [[ $extension != "mp4" || $extension != "MP4" ]]; then
#				echo $extension
#				echo "$0: warning: '$arg' is not an mp4 file, discarding and continuing..." 1>&2
			if [ ! -f "$arg" ]; then
				echo here
				echo "$0: warning: '$arg' is not an mp4 file, discarding and continuing..." 1>&2
			else
				echo "adding $arg"
				input_files+=("$arg")
			fi
		done
	
	elif [ -d "$1" ]; then
		# we were given a directory, so transcode all mp4s in
		# that dir without recursion (since we have the `-r` flag for that)

		for file in $1/*.{mov,MOV}; do
			input_files+=("$file")
		done

	elif [[ "$1" != "" ]]; then
		# we have some random input
		echo "$0: error: '$1' is not a file" 1>&2
		return 1
	else
		# no argument was given
		echo "$0: error: no input files" 1>&2
		return 1
	fi

	local num_files=${#input_files[@]}
	if [ $num_files -lt 1 ]; then
		echo "$0: error: no input files" 1>&2
		return 1
	fi
	
	for file in "${input_files[@]}"; do
		file_no_ext="${file%.*}"

		ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i "$file" -preset slow -vf yadif -codec:v h264_nvenc -crf 1 -bf 2 -flags +cgop -pix_fmt yuv420p -codec:a aac -strict -2 -b:a 384k -r:a 48000 -movflags faststart "$file_no_ext.mp4"
	done

	setopt -o nomatch
}
