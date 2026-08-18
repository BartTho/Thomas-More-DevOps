# git

#### Huidige instellingen weergeven:

`git config --list`

#### Gebruikersinfo instellen:

1. `git config --global user.name "Uw naam"`

2. `git config --global user.email somebody@somewhere.net`

3. `git config --global core.editor vim`\
Opmerking: voer de bovenstaande opdrachten uit zonder de optie `--global` om de parameters voor één project in te stellen.

#### Maak een repository:

`git init`

#### Maak een kale repository:

`git init --bare`

#### Om een ​​bestand uit versiebeheer en werkmap te verwijderen:

`git rm`

#### Om een ​​bestand uit versiebeheer te verwijderen, maar niet uit uw werkmap:

`git rm --cached myfile.txt`

#### Om een ​​verwijderd bestand te herstellen:

`git rev-list -n 1 HEAD -- <bestandspad>`\
`git checkout <verwijderde_commit>^ -- <bestandspad>`

#### Om een ​​bestand te verplaatsen of hernoemen:

`git mv myfile myrenamedfile`

#### Een bestand voorbereiden voor commit:

`git add <bestandsnaam>`

#### Om alle bestanden te committen die zijn ingesteld om te worden gestaged, voert u het volgende uit:

`git commit`

#### Om alle bestanden te committen die zijn ingesteld om te worden gestaged, voert u het volgende uit:

`git commit`

#### Om alle bestanden te committen die worden ingesteld om gefaseerd te worden, en git een overzicht van wat er is gewijzigd:

`git commit -v`

#### Om alles te committen:

`git commit -a`

#### Om te committen en de opmerking inline te schrijven:

`git commit -m "Dit is een bericht."`

#### Informatie over een commit weergeven:

`git show <checksum> (of tag-id)`

#### Om meer info te krijgen dan de opdracht git status biedt, gebruikt u (toont geen gefaseerde wijzigingen):

`git diff`
