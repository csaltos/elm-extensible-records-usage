# Elm extensible records usage

Sample code for declaring and using Elm flexible structures to extend records
with more fields dynamically and safely.

The sample goes around the idea of a visual theme at the file `Theme.elm` and
different ways to use it.

## Sample 1

The first sample contains just a basic record extension without further
parametrizations

## Sample 2

The second sample is also a basic record extension but inside
and extra field

## Sample 3

The third sample uses records for two different cases of extensions,
this is more usual and this is the reason to considere using Elm
record extensions.

## Considerations

The sample1 and sample2 are just a warming up for reference only,
you would not create a record using extensions with you are the only
user of that record.

The sample3 is more realistic and normally it's used from different
modules on different files and even on different projects.

## Recommendations

Do not use extensions everywhere, just in the places that makes sense,
this samples are using some colors and visual styles on a
theme but as a reference only, extension are not the best solution
for actual visual themes and certainly not the only one.

A more realistic use case is the requirement to use a common model shared with
different pages on a SPA application and even from several SPA applications,
this common model can be defined with Elm record extensions that is what we are
starting to use at Talenteca.com and it's working like a charm.
