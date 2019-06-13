#!/usr/bin/env sh

######################################################################
# @author      : linchuan (linch1982@gmail.com)
# @file        : switch-proxy
# @created     : Thursday Jun 13, 2019 15:15:26 CST
#
# @description : switch proxy between hongkong and us 
######################################################################
JUST_SHOW=false
JUST_SHOW_USAGE=false

function show_status() {
    port=`grep "socksParentProxy" $HOME/.polipo | awk -F: '{print $2}'`
    case $port in
        7070) echo "$port hongkong"
            ;;
        7071) echo "$port us"
            ;;
        *) echo "unkown location"
            ;;
    esac
}

function para_check() {
    function usage() {
        echo "usage: `basename $0` -[i | o | h]"
        echo "      -i: using hongkong"
        echo "      -o: using us"
        echo "      -h: print this message"
        echo "      default: show current status"
    }

    case $# in
        0) JUST_SHOW="true"
            return 0
            ;;
        1) if [ $1 != "-i" ] && [ $1 != "-o" ] && [ $1 != "-h" ]; then
            usage
            return -1
            fi
            ;;
        *) usage
            return -1
            ;;
    esac

    while getopts ":ioh" o; do
        case $o in
            i) location=hongkong
                ;;
            o) location=us
                ;;
            h) usage
                JUST_SHOW_USAGE="true"
                return 0
                ;;
            \*) # other
                usage
                return -2
                ;;
        esac
    done
}

para_check $@

# case $? in
#     1) exit 0
#         ;;
#     0) 
#         ;;
#     *) exit -1
# esac

if [ $? != 0 ]; then
    exit -1
fi


if [ $JUST_SHOW = "true" ]; then
    show_status
    exit 0
fi


if [ $JUST_SHOW_USAGE = "true" ]; then
    exit 0
fi

case $location in
    "hongkong") port=7070
        ;;
    "us") port=7071
        ;;
    *) echo "not support this location ($location)"
        exit -1
        ;;
esac

sed -i "s/^socksParentProxy = .*$/socksParentProxy = localhost:${port}/" $HOME/.polipo
brew services restart polipo
if [ $? != 0 ]; then
    echo "switch failed"
    exit -2
else
    echo "switch to $location success"
    exit 0
fi

