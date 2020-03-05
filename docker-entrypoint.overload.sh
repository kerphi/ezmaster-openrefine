#!/bin/bash

# inject config.json parameters to env
# only if not already defined in env
export OPENREFINE_OPTIONS=${OPENREFINE_OPTIONS:=$(jq -r -M .OPENREFINE_OPTIONS /config.json | grep -v null)}

# start openrefine daemon
exec /app/refine $@ $OPENREFINE_OPTIONS