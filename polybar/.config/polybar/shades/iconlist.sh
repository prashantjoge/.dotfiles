#!/bin/bash
counter=0
i3-msg -t get_workspaces | tr ',' '\n' | sed -nr 's/"name":"([^"]+)"/\1/p' | while read -r name; do
  printf 'ws-icon-%i = "%s"\n' $((counter++)) $name
done
