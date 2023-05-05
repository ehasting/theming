#!/bin/bash

echo "Linking resources"
ln $(pwd)/Xresources ~/.Xresources || true

echo "Update database"
xrdb -merge ~/.Xresources

