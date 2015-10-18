#!/bin/bash
exe=$1
loc=$(which $exe)
echo "#!$loc"
