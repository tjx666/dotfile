# 追加以下内容

# self configuration
source ~/set_proxy.sh

# some custom alias
alias boot_flutter_server='flutter packages pub global run devtools'
alias flutter_run='echo http://127.0.0.1:9100/?port=9200 && flutter run --observatory-port 9200 --track-widget-creation'

