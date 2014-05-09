Pharo for the Enterprise (english version) [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=PharoForTheEnterprise)](https://ci.inria.fr/pharo-contribution/job/PharoForTheEnterprise/)
==========================================

An experiment of writing a book with the Pier syntax using plain-text editors.

This book is continuously built on an [Inria Jenkins server](https://ci.inria.fr/pharo-contribution/job/PharoForTheEnterprise/).

The [engine used](http://www.smalltalkhub.com/#!/~DamienCassou/Pier-Gutemberg) to build PDF and HTML outputs is hosted on
SmalltalkHub.

There is an [Emacs plugin](https://github.com/DamienCassou/pier-cl) to help you write Pier file within Emacs.

How to
======

You first have to download this project

```bash
# if you have commit access:
git clone git@github.com:SquareBracketAssociates/PharoForTheEnterprise-english.git
# if you don't
git clone git://github.com/SquareBracketAssociates/PharoForTheEnterprise-english.git
```

Then you must download the Pharo VM and image

```bash
./download.sh
```

Finally, to build the book

```bash
./compile.sh
```

The `compile.sh` script will only compile the files that are included
from the `pillar-conf.ston` file. If you write a new chapter, don't
forget to reference it in this file to have it compiled.

Figures
=======

If you include figures in your chapter, please pay attention to the following:

- you must neither use spaces nor underscores (`_`) in the file names ;
- you must put the figures in a sub directory called `figures` in the chapter's directory ;
- you must add your chapter to the list of chapters in the `book.latex.template` file (below the `\graphicspath` line).

Sample
======

Download and check a [Sample.pier file](https://github.com/DamienCassou/pier-cl/blob/master/Sample.pier), [Sample.pier.html file](https://github.com/DamienCassou/pier-cl/blob/master/Sample.pier.html?raw=true), or a [Sample.pier.pdf file](https://github.com/DamienCassou/pier-cl/blob/master/Sample.pier.pdf?raw=true).
