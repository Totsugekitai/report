# お決まり
.RECIPEPREFIX = >
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:
MAKEFLAGS += --warn-undefined-variables
.DELETE_ON_ERROR:
MAKEFLAGS += -r

TARGET := report.pdf

LATEXMK := latexmk
LATEXMKFLAG := -r ./latexmkrc -pdflua

# ここからどうぞ
.PHONY: all continue clean

all: $(TARGET)

%.pdf: %.tex
> $(LATEXMK) $(LATEXMKFLAG) $<

continue: LATEXMKFLAG += -pvc
continue: all

clean:
> rm -f *.bbl *.blg *.aux *.log *.dvi *.fls *.fdb_latexmk *.ltjruby *.out *.synctex.gz

