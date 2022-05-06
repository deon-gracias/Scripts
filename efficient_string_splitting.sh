#!/bin/sh

var="apple grape orange"

# Print apple
echo "${var%% *}"

# Print orange
echo "${var##* }"

# Print apple grape
echo "${var% *}"

# Print grape orange
echo "${var#* }"
