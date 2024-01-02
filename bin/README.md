# LaTeX management
The binaries for latex come from `~/utils/latex`.
Their use case is

```shell
get_rand_proposition 44
```
where 44 represent the total amount of propositions

```shell
extract_propositions ./ abc.tex p3
```
where `./` represents the root dir, `abc.tex` the name of the file from where to extract the propositions
and `p3` is the filter of priority of the propositions to include. However, you can leave that blank to include all.
