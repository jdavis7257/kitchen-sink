#!/bin/bash

# Using script
# This script accepts 3 arguments.  
#   1. A path to a file containing a list of domains that will be diffed between the two nameservers
#   2. First Nameserver to compare
#   3. Second Nameserver to compare
#

domainsFile=$1
NS1=$2
NS2=$3


diff <(sort -u <(for host in $(cat $domainsFile); do dig +nottlid +noall +answer @$NS1 $host ANY; done) ) <(sort -u <(for host in $(cat $domainsFile); do dig +nottlid +noall +answer @$NS2 $host ANY; done) )
