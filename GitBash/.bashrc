# proxy
proxy() {
  export http_proxy="http://127.0.0.1:2233"
  export https_proxy="http://127.0.0.1:2233"
  echo "HTTP Proxy on"
}

# close proxy
noproxy() {
  unset http_proxy
  unset https_proxy
  echo "HTTP Proxy off"
}

# custom alias
alias nvi=nvim

# charles proxy
charles_proxy() {
  export http_proxy="http://127.0.0.1:7244"
  echo "charles HTTP Proxy on"
}

# close charles proxy
charles_noproxy() {
  unset http_proxy
  echo "charles HTTP Proxy off"
}

# run c++ single file
# usage: rcc path/to/cpp/single/filepath
rcc() {
  dir_name=$(dirname $1)
  file_name=$(basename $1 .cpp)
  
  run_cmd="g++ -Wall -o $file_name $1"
  echo "Compile: $run_cmd"
  ${run_cmd}

  execute_file="$dir_name/$file_name"
  ${execute_file}
}

# some custom alias
alias boot_flutter_server='flutter packages pub global run devtools'
alias flutter_run='echo http://127.0.0.1:9100/?port=9200 && flutter run --observatory-port 9200 --track-widget-creation'
