---
title: Introduksjon
description: Konfigurer nettstaden din ved hjelp av filer, mapper og miljøvariablar.
categories: []
keywords: []
weight: 10
---

## Fornuftige standardverdiar

Hugo tilbyr mange konfigurasjonsalternativ, men standardverdiane er ofte tilstrekkelege. Ein ny nettstad krev berre desse innstillingane:

{{< code-toggle file=hugo >}}
baseURL = 'https://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
{{< /code-toggle >}}

Definer berre innstillingar som avvik frå standardverdiane. Ei mindre konfigurasjonsfil er enklare å lese, forstå og feilsøkje. Hald konfigurasjonen din kortfatta.

> [!note]
> Den beste konfigurasjonsfila er ei kort konfigurasjonsfil.

## Konfigurasjonsfil

Opprett ei konfigurasjonsfil for nettstaden i rotmappa til prosjektmappa, med namnet `hugo.toml`, `hugo.yaml`, eller `hugo.json`, i denne prioriteringsrekkjefølgja.

```text
my-project/
└── hugo.toml
```

> [!note]
> For versjonar v0.109.0 og tidlegare, heitte konfigurasjonsfila for nettstaden `config`. Sjølv om du framleis kan bruka dette namnet, er det tilrådd å byta til den nyare namnjekonvensjonen, `hugo`.

Eit enkelt døme:

{{< code-toggle file=hugo >}}
baseURL = 'https://example.org/'
languageCode = 'en-us'
title = 'ABC Widgets, Inc.'
[params]
subtitle = 'The Best Widgets on Earth'
[params.contact]
email = 'info@example.org'
phone = '+1 202-555-1212'
{{< /code-toggle >}}

For å bruka ei anna konfigurasjonsfil når du byggjer nettstaden, bruk `--config`-flagget:

```sh
hugo --config other.toml
```

Kombiner to eller fleire konfigurasjonsfiler, med venstre-til-høgre prioritet:

```sh
hugo --config a.toml,b.yaml,c.json
```

> [!note]
> Sjå spesifikasjonane for kvart filformat: [TOML], [YAML], og [JSON].

## Konfigurasjonsmappe

I staden for ei enkelt konfigurasjonsfil for nettstaden, kan du dela konfigurasjonen din etter ASD, rotkonfigurajonsnøkkel og språk. Til dømes:

```text
my-project/
└── config/
    ├── _default/
    │   ├── hugo.toml
    │   ├── menus.en.toml
    │   ├── menus.de.toml
    │   └── params.toml
    └── production/
        └── params.toml
```

Rotkonfigurasjonsnøklane er {{< root-configuration-keys >}}.

### Utelat rotnøkkelen

Når du deler konfigurasjonen etter rotnøkkel, utelat rotnøkkelen i komponentfila. Til dømes er desse ekvivalente:

{{< code-toggle file=config/_default/hugo >}}
[params]
foo = 'bar'
{{< /code-toggle >}}

{{< code-toggle file=config/_default/params >}}
foo = 'bar'
{{< /code-toggle >}}

### Rekursiv parsing

Hugo parsar `config`-mappa rekursivt, noko som tillèt deg å organisera filene i undermappper. Til dømes:

```text
my-project/
└── config/
    └── _default/
        ├── navigation/
        │   ├── menus.de.toml
        │   └── menus.en.toml
        └── hugo.toml
```

### Døme

```text
my-project/
└── config/
    ├── _default/
    │   ├── hugo.toml
    │   ├── menus.en.toml
    │   ├── menus.de.toml
    │   └── params.toml
    ├── production/
    │   ├── hugo.toml
    │   └── params.toml
    └── staging/
        ├── hugo.toml
        └── params.toml
```

Med utgangspunkt i strukturen ovanfor, når du køyrer `hugo --environment staging`, vil Hugo bruka alle innstillingar frå `config/_default` og fletta `staging` sine oppå desse.

La oss ta eit døme for å forstå dette betre. La oss seia at du brukar Google Analytics for nettstaden din. Dette krev at du spesifiserer ein [Google tag ID] i nettstadkonfigurasjonen din:

{{< code-toggle file=hugo >}}
[services.googleAnalytics]
ID = 'G-XXXXXXXXX'
{{< /code-toggle >}}

Vurder no følgjande scenario:

1. Du vil ikkje lasta inn analysekodan når du køyrer `hugo server`.
1. Du ønskjer å bruka forskjellige Google tag ID-ar for produksjons- og oppsettsmiljøa dine. Til dømes:
    - `G-PPPPPPPPP` for produksjon
    - `G-SSSSSSSSS` for oppsett

For å tilfredsstilla desse krava, kan du konfigurera nettstaden din slik:

1. `config/_default/hugo.toml`
    - Utelat `services.googleAnalytics`-seksjonen. Dette vil hindra lasting av analysekoden når du køyrer `hugo server`.
    - Som standard set Hugo `environment` til `development` når du køyrer `hugo server`. I fråvere av ei `config/development`-mappe, brukar Hugo `config/_default`-mappa.
1. `config/production/hugo.toml`
    - Ta berre med denne seksjonen:

      {{< code-toggle file=hugo >}}
      [services.googleAnalytics]
      ID = 'G-PPPPPPPPP'
      {{< /code-toggle >}}

    - Du treng ikkje inkludera andre parametrar i denne fila. Inkluder berre dei parametrane som er spesifikke for produksjonsmiljøet ditt. Hugo vil fletta desse parametrane med standardkonfigurasjonen.
    - Som standard set Hugo `environment` til `production` når du køyrer `hugo`. Analysekodan vil bruka `G-PPPPPPPPP` tag ID-en.

1. `config/staging/hugo.toml`

    - Ta berre med denne seksjonen:

      {{< code-toggle file=hugo >}}
      [services.googleAnalytics]
      ID = 'G-SSSSSSSSS'
      {{< /code-toggle >}}

    - Du treng ikkje inkludera andre parametrar i denne fila. Inkluder berre dei parametrane som er spesifikke for oppsetsmiljøet ditt. Hugo vil fletta desse parametrane med standardkonfigurasjonen.
    - For å byggja oppsettsnettstaden din, køyr `hugo --environment staging`. Analysekodan vil bruka `G-SSSSSSSSS` tag ID-en.

## Fletting av konfigurasjonsinnstillingar

Hugo flettar konfigurasjonsinnstillingar frå tema og modular, og prioriterar prosjektet sine eigne innstillingar. Gitt denne forenkla prosjektstrukturen med to tema:

```text
project/
├── themes/
│   ├── theme-a/
│   │   └── hugo.toml
│   └── theme-b/
│       └── hugo.toml
└── hugo.toml
```

og denne prosjektnivåkonfigurasjonen:

{{< code-toggle file=hugo >}}
baseURL = 'https://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = ['theme-a','theme-b']
{{< /code-toggle >}}

Hugo flettar innstillingar i denne rekkjefølgja:

1. Prosjektkonfigurasjon (`hugo.toml` i prosjektrota)
1. `theme-a` konfigurasjon
1. `theme-b` konfigurasjon

Innstillinga `_merge` innanfor kvar toppnivåkonfigurasjonsnøkkel kontrollerar _kva_ innstillingar som vert fletta og _korleis_ dei vert fletta.

Verdien for `_merge` kan vera ein av:

none
: Inga fletting.

shallow
: Legg berre til verdiar for nye nøklar.

deep
: Legg til verdiar for nye nøklar, flett eksisterande.

Merk at du ikkje treng vera så detaljert som i standardoppsettet nedanfor; ein `_merge`-verdi høgare oppe vil bli arva om den ikkje er sett.

{{< code-toggle file=hugo dataKey="config_helpers.mergeStrategy" skipHeader=true />}}

## Miljøvariablar

Du kan òg konfigurera innstillingar ved hjelp av miljøvariablar i operativsystemet:

```sh
export HUGO_BASEURL=https://example.org/
export HUGO_ENABLEGITINFO=true
export HUGO_ENVIRONMENT=staging
hugo
```

Det ovanståande set konfigurasjonsvala [`baseURL`], [`enableGitInfo`], og [`environment`] og byggjer deretter nettstaden din.

> [!note]
> Ei miljøvariabel har prioritet over verdiane sett i konfigurasjonsfila. Dette betyr at om du set ein konfigurasjonsverdi med både ei miljøvariabel og i konfigurasjonsfila, vil verdien i miljøvariabelen verta brukt.

Miljøvariablar forenklar konfigurasjonen for [CI/CD](g)-implementeringar som GitHub Pages, GitLab Pages og Netlify ved å tillata deg å setja verdiar direkte i dei respektive konfigurasjonane og arbeidsflytsfilene.

> [!note]
> Miljøvariabelnamna må ha prefiks `HUGO_`.
>
> For å setja tilpassa nettstad-parametrar, set prefiks til namnet med `HUGO_PARAMS_`.

For snake_case-variabelnamn, vil ikkje standardprefikset `HUGO_` fungera. Hugo sluttar seg til skiljetegnet frå det første tegnet etter `HUGO`. Dette gjer det mogleg med variantar som `HUGOxPARAMSxAPI_KEY=abcdefgh` ved bruk av alle [tillatne skiljetegn].

I tillegg til å konfigurera standardinnstillingar, kan miljøvariablar brukast til å overstyra standardverdiar for visse interne innstillingar:

DART_SASS_BINARY
: (`string`) Den absolute filsystempatha til Dart Sass-programmet. Som standard søkjer Hugo etter programmet i kvar av filbanane i miljøvariabelen `PATH`.

HUGO_FILE_LOG_FORMAT
: (`string`) Ein formatstreng for filstien, linjenummeret og kolonnenummeret som vert vist når feil vert rapportert, eller når `Position`-metoden vert kalla frå ein shortcode eller ein Markdown-renderingskrok. Gyldige token er `:file`, `:line`, og `:col`. Standard er `:file::line::col`.

HUGO_MEMORYLIMIT
: {{< new-in 0.123.0 />}}
: (`int`) Den maksimale mengda systemminne, i gigabyte, som Hugo kan bruka under rendering av nettstaden din. Standard er 25% av totalt systemminne. Merk at `HUGO_MEMORYLIMIT` er ei "best effort"-innstilling. Ikkje forvent at Hugo skal byggja ein million sider med berre 1 GB minne. Du kan få meir informasjon om korleis dette oppfører seg under bygginga ved å byggja med `hugo --logLevel info` og sjå etter `dynacache`-etiketten.

HUGO_NUMWORKERMULTIPLIER
: (`int`) Talet på arbeidarar som vert brukte i parallell behandling. Standard er talet på logiske CPUar.

## Gjeldande konfigurasjon

Vis den fullstendige nettstadkonfigurasjonen med:

```sh
hugo config
```

Vis ei spesifikk konfigurasjonsinnstilling med:

```sh
hugo config | grep [key]
```

Vis dei konfigurerte filmonteringane med:

```sh
hugo config mounts
```

[`baseURL`]: /configuration/all#baseurl
[`enableGitInfo`]: /configuration/all#enablegitinfo
[`environment`]: /configuration/all#environment
[Google tag ID]: https://support.google.com/tagmanager/answer/12326985?hl=en
[JSON]: https://datatracker.ietf.org/doc/html/rfc7159
[tillatne skiljetegn]: https://pubs.opengroup.org/onlinepubs/000095399/basedefs/xbd_chap08.html
[TOML]: https://toml.io/en/latest
[YAML]: https://yaml.org/spec/
