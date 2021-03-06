# FAQ

## Shouldn't the slogan be 'beautier: BEAUti 2 for R'?

That slogan would indeed be more precise. That
extra precision would come at the cost of 
readability (the extra '2'). As there is no `BEAUti 1`,
there is no possible confusion and that extra number 
does not add extra information.

## Which version of BEAUti do you use as a guideline?

The first BEAST2 XML files created by `beautier`
followed BEAST2 v2.4. `beautier` follows the
BEAST2 versions, which is now at v2.5.1.

The BEAST2 version actually used by `babette`
can be found in the [beastier::install_beast2](https://github.com/ropensci/beastier/blob/master/R/install_beast2.R) function.

## What's the [road map](road_map.md)?

See [road map](road_map.md).

## How can I indicate a feature that I miss?

Submit an Issue.

## How can I submit code?

See [CONTRIBUTING](CONTRIBUTING.md), at 'Submitting code'

## How can I submit a bug?

See [CONTRIBUTING](CONTRIBUTING.md), at 'Submitting bugs' 

## How can I indicate something else?

Submit an Issue. Or send an email to Richel Bilderbeek.

## How do I reference to this work?

Cite:

```
Bilderbeek, Richèl JC, and Rampal S. Etienne. "babette: BEAUti 2, BEAST 2 and Tracer for R." Methods in Ecology and Evolution (2018).
```

or

```
@article{bilderbeek2018babette,
  title={babette: BEAUti 2, BEAST 2 and Tracer for R},
  author={Bilderbeek, Richèl JC and Etienne, Rampal S},
  journal={Methods in Ecology and Evolution},
  year={2018},
  publisher={Wiley Online Library}
}
```

## What is the idea behind the logo?

The butterfly symbolizes beauty.
The it was combined with an R logo. 

## What are the FASTA files?

Filename|Reference
---|---
`anthus_aco.fas`|[1]
`anthus_nd2.fas`|[1]
`G_VII_pre2003_msa.fas`|[2]
Others|Artificial

 * [1] Van Els, Paul, and Heraldo V. Norambuena. "A revision of species limits in Neotropical pipits Anthus based on multilocus genetic and vocal data." Ibis.
 * [2] Durr, PA; Wibowo, MH; Tabbu, CR; Asmara, W; Selleck, P; Wang, J; Broz, I; Graham, K.; Dimitrov, K and Afonso, C. (in preparation). Phylodynamics of Genotype VII Newcastle disease virus in Indonesia.
 
Thanks to Peter A. Durr and Paul van Els for supplying the FASTA files.

## If I set a fixed crown age with multiple alignments, only the first alignment has so

Correct. This is a feature of BEAST2, which is assumed to be correct. 

## Why are the functions prefixed with `create_`?

Or, why is this chosen:

```{r}
out <- create_beast2_input(
  "alignment.fas",
  tree_priors = create_yule_tree_prior(
    birth_rate_distr = create_exp_distr()    
  )
)
```

over this:

```{r}
out <- create_beast2_input(
  "alignment.fas",
  tree_priors = yule_tree_prior(
    birth_rate_distr = exp_distr()    
  )
)
```

Answer: because of readability. 

In this example, one could argue that prefixing `create_` 
hinders readability, as it makes the code unnecessarily
long. Additionally, `ggplot2` also omits the creation of `geom`s.

There are arguments against this line of thought: a function
'does' something, thus should contain a verb (as that would reflect its
meaning). The `create` or `make` prefix has its place in a Factory
Method Design Pattern. 

In the example above, however, the people involved in `beautier`
felt removing `create_` would be preferable. 

Yet, when doing so consistently throughout the package, problems
turn up.

When removing the `create_` prefix, this code:

```{r}
site_model <- list(
  gamma_site_model = create_gamma_site_model(),
  # ..
)
```

becomes:

```{r}
site_model <- list(
  gamma_site_model = gamma_site_model(),
  # ..
)
```

which cannot be interpreted. A workaround would be use an abbreviation
of the `gamma_site_model` argument:

```{r}
site_model <- list(
  gsm = gamma_site_model(),
  # ..
)
```

This abbreviation hurt readability. The `beautier` team felt is a
bad idea to be inconsistent in prefixing functions with `create_`.

In the end, it was decided to keep `create_`. Yes, it is more 
typing (auto-complete will fix that), but clarity comes first.

## Why the name?

`beautier` is 'BEAUti for R'. 

Additionally, it is a joke that suggests `beautier` would have more beauty than `BEAUti`.
This suggestion benefits the image of author of `beautier`, who, however, thinks that
both tools are equally valuable and beautiful.

## Why the logo?

Initially, the logo was a low-tech remake of Belle, for Beauty and the Beast. 
To prevent problems with Disney, a different logo was picked.

The current logo shows a butterfly, an animal considered to be beautiful.
The butterfly is drawn by Jose Scholte, who kindly allowed her work to
be used for free, by attribution.

## `BEAUti` problems

### Not enough memory

```
./beauti
```

```
Can't start up: not enough memory
```

On Artful Aardvark, remove `-Xms256m -Xmx4g` from the `bin/beauti` file's last line. Change:

```
"$JAVA" -Dlauncher.wait.for.exit=true -Xms256m -Xmx4g -Djava.library.path="$BEAST_LIB" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.app.beauti.BeautiLauncher -capture $*
```

to

```
"$JAVA" -Dlauncher.wait.for.exit=true -Djava.library.path="$BEAST_LIB" -Duser.language=en -cp "$BEAST_LIB/launcher.jar" beast.app.beauti.BeautiLauncher -capture $*
```

### BEAUti requires Java version at least 8

![](beauti_requires_java_8_or_more.png)

Do:

```
sudo update-alternatives --config java
```

Pick `/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java`:

```
There are 5 choices for the alternative java (providing /usr/bin/java).

  Selection    Path                                            Priority   Status
------------------------------------------------------------
  0            /usr/lib/jvm/java-9-openjdk-amd64/bin/java       1091      auto mode
  1            /usr/bin/gij-4.8                                 1048      manual mode
  2            /usr/bin/gij-5                                   1050      manual mode
  3            /usr/bin/gij-6                                   1060      manual mode
* 4            /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java   1081      manual mode
  5            /usr/lib/jvm/java-9-openjdk-amd64/bin/java       1091      manual mode
```
