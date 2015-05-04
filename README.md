# greluatex

Saisie directe d'extraits grégoriens dans un document (Lua)LaTeX.


## Installation

### Dépendances

Installez d'abord [gregorio et gregoriotex](https://github.com/gregorio-project/gregorio/), dont dépend cette extension.

### Pour un document isolé

Copiez `greluatex.sty` et `greluatex.lua` dans le dossier contenant le document concerné.

### Pour l'ensemble de votre distribution de LaTeX

Copiez `greluatex.sty` et `greluatex.lua` quelque part dans votre texmf, puis lancez `mktexlsr`.


## Utilisation

Dans le préambule de votre document, incluez le package `greluatex` :

    \usepackage{greluatex}

Dès lors, il ne vous reste plus qu'à compiler le document comme d'habitude, avec `lualatex -shell-escape` :

    lualatex -shell-escape DOCUMENT.TEX

Vous pouvez (ce n'est pas recommandé, sauf pour des fragments vraiment courts) saisir directement la musique au sein de votre document, grâce à l'environnement `gre`. Par exemple :

    \begin{gre}
    (c4) A(h)ve.(d) (::)
    \end{gre}

L'argument `factor`, optionnel, influe sur la taille de la partition. Vous pouvez changer la taille pour l'ensemble des partitions en saisissant, avant l'inclusion des partitions concernées :

    \setgrefactor{17}

Voyez le document `test.tex` pour un exemple.
