#!/bin/bash

ln $(pwd)/Xresources ~/.Xresources

xrdb -merge ~/.Xresources

