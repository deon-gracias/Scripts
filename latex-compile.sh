#!/bin/bash

pdflatex ./*.tex
biber ./*.tex
pdflatex ./*.tex
