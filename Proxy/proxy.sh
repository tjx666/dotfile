proxyWithoutPrompt() {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export all_proxy="socks5://127.0.0.1:7890"
  export no_proxy="localhost,127.0.0.1"

  export HTTP_PROXY="http://127.0.0.1:7890"
  export HTTPS_PROXY="http://127.0.0.1:7890"
  export ALL_PROXY="socks5://127.0.0.1:7890"
  export NO_PROXY="localhost,127.0.0.1,172.16.5.83"
}

proxyWithoutPrompt

# proxy
proxy () {
  proxyWithoutPrompt
  echo "HTTP Proxy on"
}

noproxy () {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  unset no_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset ALL_PROXY
  unset NO_PROXY
  echo "HTTP Proxy off"
}

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