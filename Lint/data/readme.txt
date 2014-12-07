Hello Stef,

I checked here :)

The Smalllint rules can be automatically exported to .tex from the comments in #longDescription in each Smalllint rule.
Then, to export the .tex, just run:

==============
Gofer new
  squeaksource: 'PharoTaskForces';
  package: 'Manifest-Support';
  load.

SimpleLatexDoc exportLatexDocForRules
==============

Just tried here in my image and it generated the attached .tex :)


On Sat, Sep 14, 2013 at 2:58 PM, Stéphane Ducasse <stephane.ducasse@inria.fr> wrote:
I'm finishing a full pass on the lint chapter.

Stef



-- 
Andre Hora