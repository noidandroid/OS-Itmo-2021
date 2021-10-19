#!/bin/bash


ps -e -o pid,vsz,comm= |
sort -nk2 | tail -n1
