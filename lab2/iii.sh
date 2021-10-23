#!/bin/bash

ps o pid,ppid,start_time --sort=start_time | grep -v $$ | tail -n 1
