#!/usr/bin/env sh

######################################################################
# @author    : linchuan (linch1982@gmail.com)
# @file    : switch-proxy
# @created   : Thursday Jun 13, 2019 15:15:26 CST
#
# @description : switch proxy between hongkong and us 
######################################################################
unset SHOW_USAGE SHOW_STATUS LOCATION CURR_PORT PORT

function get_curr_port() {
  CURR_PORT=`grep "socksParentProxy" $HOME/.polipo | awk -F: '{print $2}'`
}


function show_status() {
  case $CURR_PORT in
    7070) echo "$CURR_PORT: hongkong"
      ;;
    7071) echo "$CURR_PORT: us"
      ;;
    *) echo "$CURR_PORT: unkown location"
      ;;
  esac
}

function usage() {
  echo "usage: `basename $0` -[i | o | h]"
  echo "    -i: using hongkong"
  echo "    -o: using us"
  echo "    -h: print this message"
  echo "    default: show current status"
}

function set_val() {
  local var_name=$1
  shift
  if [ -z "${!var_name}" ]; then
    # 使用eval的目的是为了对变量名的变量进行赋值
    # 如果使用$var_name=$@，达不到对location赋值的效果
		#  ✘ (python3.7)  ~/bin  a=aaaa
		#  (python3.7)  ~/bin  echo $a
		# aaaa
		#  (python3.7)  ~/bin  echo $aaaa
		# 
		#  (python3.7)  ~/bin  $a=bbbb
		# zsh: command not found: aaaa=bbbb
		#  ✘ (python3.7)  ~/bin  eval $a=bbbb
		#  (python3.7)  ~/bin  echo $a
		# aaaa
		#  (python3.7)  ~/bin  echo $aaaa
		# bbbb
    eval "$var_name=$@"
  else
    echo "Error: $var_name already set"
    usage
    exit -3
  fi
}

function para_check() {
  while getopts ":ioh" o; do
    case $o in
      i) set_val LOCATION hongkong
        ;;
      o) set_val LOCATION us
        ;;
      h) usage
        SHOW_USAGE="true"
        return 0
        ;;
      \?) # other
        usage
        return -2
        ;;
    esac
  done
}

if [ $# -eq 0 ]; then
  get_curr_port
  show_status
  exit 0
fi

para_check $@

if [ $? != 0 ]; then
  exit -1
fi

if [ ! -z $SHOW_USAGE ]; then
  exit 0
fi

get_curr_port

if [ -z $LOCATION ]; then
  usage
  exit -1
fi

case $LOCATION in
  "hongkong") PORT=7070
    ;;
  "us") PORT=7071
    ;;
  *) echo "not support this location ($LOCATION)"
    exit -1
    ;;
esac

if [ $PORT -eq $CURR_PORT ]; then
  echo "already in ${LOCATION}, nothing changed."
  exit 0
fi

sed -i "s/^socksParentProxy = .*$/socksParentProxy = localhost:${PORT}/" $HOME/.polipo
brew services restart polipo
if [ $? != 0 ]; then
  echo "switch to ${LOCATION} failed."
  exit -2
else
  echo "switch to ${LOCATION} success."
  exit 0
fi
