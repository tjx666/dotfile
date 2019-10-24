# proxy
proxy () {
  export http_proxy="http://127.0.0.1:2233"
  export https_proxy="http://127.0.0.1:2233"
  echo "HTTP Proxy on"
}

# close proxy
noproxy () {
  unset http_proxy
  unset https_proxy
  echo "HTTP Proxy off"
}

# custom alias
alias nvi=nvim

# charles proxy
charles_proxy () {
  export http_proxy="http://127.0.0.1:7244"
  echo "charles HTTP Proxy on"
}

# close charles proxy
charles_noproxy () {
  unset http_proxy
  echo "charles HTTP Proxy off"
}

# some custom alias
alias boot_flutter_server='flutter packages pub global run devtools'
alias flutter_run='echo http://127.0.0.1:9100/?port=9200 && flutter run --observatory-port 9200 --track-widget-creation'
