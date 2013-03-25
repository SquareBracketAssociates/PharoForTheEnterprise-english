Pharo for the Enterprise (english version)
==========================================

An experiment of writing a book with the Pier syntax using plain-text editors.

This book is continuously built on an [Inria Jenkins server](https://ci.inria.fr/pharo-contribution/job/PharoForTheEnterprise/).

The engine used to build PDF and HTML outputs is hosted on
[SmalltalkHub](http://www.smalltalkhub.com/#!/~DamienCassou/Pier-Gutemberg](SmalltalkHub).

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
./download.sh vm image
```

Finally, to build the book

```bash
./compile.sh
```

The `compile.sh` script will only compile the files that are included
from the `PFTE.tex` file. If you write a new chapter, don't forget to
reference it in the `PFTE.tex` file to have it compiled.

Sample
======

Download and check a [Sample.pier file](https://github.com/DamienCassou/pier-cl/blob/master/Sample.pier), [Sample.pier.html file](https://github.com/DamienCassou/pier-cl/blob/master/Sample.pier.html?raw=true), or a [Sample.pier.pdf file](https://github.com/DamienCassou/pier-cl/blob/master/Sample.pier.pdf?raw=true).
