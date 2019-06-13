#!/usr/bin/env sh

######################################################################
# @author    : linchuan (linch1982@gmail.com)
# @file      : getopt1
# @created   : Tuesday Jun 11, 2019 11:28:25 CST
#
# @description : for getopts try
######################################################################

while getopts ":a:c:" OPTION
do
  case $OPTION in
    a)ALL=true
      echo "ALL is $ALL"
      ;;
    c)COPIES=${OPTARG}
      echo "COPIES is $COPIES"
      ;;
    :) # missing params
      echo "`basename $0`: $OPTARG missing params" 1>&2
      exit -2
      ;;
    ?) # usage statemant
      echo "wrong option $OPTION"
      echo "`basename $0` -[a h f v] -[c value] file" 1>&2
      ;;
  esac
done

