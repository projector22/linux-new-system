#!/bin/bash

printf "%s\n" "Resetting all Linux New System apps..."

bash delete-projects.sh
bash clone-projects.sh