#!/bin/bash
set +x
cd "$(eval echo "$1")"
sbcl
