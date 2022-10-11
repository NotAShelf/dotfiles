# from https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
# we use this to benchmark zsh startup, 10 times to be more accurate
# P.S: /usr/bin/time has been replaced with just time as time is a shell reserved variable

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); 
	do time $shell -i -c exit; 
  done
}
