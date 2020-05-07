#!/bin/bash 
# v0.0.1
# Comment out exports if setting ENV variable with CI/CD pipeline
export SC_CLUS_VIP="10.10.20.129"
export SC_USER_NAME="administrator@vsphere.local"
export SC_USER_PASS="VMware1!"

/usr/bin/expect <(cat << EOF
spawn kubectl vsphere login --server=$::env(SC_CLUS_VIP) --vsphere-username $::env(SC_USER_NAME) --insecure-skip-tls-verify
expect "Password:"
send "$::env(SC_USER_PASS)\n"
interact
EOF
)
