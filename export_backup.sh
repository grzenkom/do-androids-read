#!/usr/bin/env bash

jupyter-nbconvert --to html     --output-dir ./backup --output nlp_demo.output nlp_demo.ipynb
jupyter-nbconvert --to markdown --output-dir ./backup --output nlp_demo.output nlp_demo.ipynb
jupyter-nbconvert --to slides   --output-dir ./backup                          nlp_demo.ipynb

# TODO: add `git add && git commit`
