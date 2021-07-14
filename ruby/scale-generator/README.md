# Scale Generator

Given a tonic, or starting note, and a set of intervals, generate
the musical scale starting with the tonic and following the
specified interval pattern.

Etant donnée une tonique, et une gamme d'intervalles, générer la gamme musicale depuis la tonique, selon le schéma d'intervalles donné.

Les gammes en musique occidentale sont basées sur la gamme chromatique. Cette gamme peut être exprimée comme le grouope suivant :


Scales in Western music are based on the chromatic (12-note) scale. This
scale can be expressed as the following group of pitches:

A, A#, B, C, C#, D, D#, E, F, F#, G, G#

A given sharp note (indicated by a #) can also be expressed as the flat
of the note above it (indicated by a b) so the chromatic scale can also be
written like this:

Un dièse donné peut aussi être exprimé comme le bémol de la note au-dessus.

A, Bb, B, C, Db, D, Eb, E, F, Gb, G, Ab

The major and minor scale and modes are subsets of this twelve-pitch
collection. They have seven pitches, and are called diatonic scales.
The collection of notes in these scales is written with either sharps or
flats, depending on the tonic. Here is a list of which are which:

Les gammes majeur et mineures, et les modes sont des sous-ensembles de cette c-gamme chromatique à 12 notes. Il y a 7 notes de base, et on les appelle l'échelle diatonique.
La collection des notes de ces gammes est écrite soit en dièse, soit en bémol, selon la tonique. Voici une liste de quoi est quoi :

No Sharps or Flats: Pas de dièses ou bémols
C major - C majeur
a minor - a mineur

Use Sharps: en utilisant des dièse :
G, D, A, E, B, F# major - G, D, A, E, B, F# Majeur utilisent des dièses
e, b, f#, c#, g#, d# minor - e, b, f#, c#, g#, d#  mineur utilisent des dièses

Use Flats: utilisent des bémols
F, Bb, Eb, Ab, Db, Gb major
d, g, c, f, bb, eb minor

The diatonic scales, and all other scales that derive from the
chromatic scale, are built upon intervals. An interval is the space
between two pitches.

Les gammes diatoniques, et toutes les autres, dérivent de la gamme chromatique, et sont construites sur des intervalles. Un intervalle est l'espace entre deux tons.

The simplest interval is between two adjacent notes, and is called a
"half step", or "minor second" (sometimes written as a lower-case "m").

Le plus simple intervalle est appelé "demi-ton", ou deuxième mineure, parfois écrit "m".


The interval between two notes that have an interceding note is called
a "whole step" or "major second" (written as an upper-case "M"). The
diatonic scales are built using only these two intervals between
adjacent notes.

L'intervalle entre deux notes est appelé "ton" ou "deuxième majeure" "M" Les gammes diatoniques sont construites en utilisant seulement ces deux intervalles entre des notes adjacentes.

Non-diatonic scales can contain other intervals.  An "augmented first"
interval, written "A", has two interceding notes (e.g., from A to C or
Db to E). There are also smaller and larger intervals, but they will not
figure into this exercise.

Les gammes non-diatoniques peuvent contenir d'autres intervalles : la première augmentée, notée A, a deux notes d'intervalles ( de A à C, ou Db à E). Il y a aussi des intervalles plus petits et plus grands, mais il ne figureront pas dans cet exercice.

* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby scale_generator_test.rb

To include color from the command line:

    ruby -r minitest/pride scale_generator_test.rb


## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
