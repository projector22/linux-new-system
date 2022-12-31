#!/bin/bash

printf "Resetting all Linux New System apps...\n"

bash delete-projects.sh
bash clone-projects.sh