---
title: Konfigurer utdataformat!!
linkTitle: Utdataformat
description: Konfigurer utdataformat.
categories: []
keywords: []
---

{{% glossary-term "output format" %}}

Du kan generera ei side i så mange format som du vil. Definer eit ubegrensa tal av utdataformat, så lenge kvart av dei resulterer i ei unik filsystembane.

Dette er standardkonfigurasjonen for utdataformat i tabellform:

{{< datatable
  "config"
  "outputFormats"
  "_key"
  "mediaType"
  "weight"
  "baseName"
  "isHTML"
  "isPlainText"
  "noUgly"
  "notAlternative"
  "path"
  "permalinkable"
  "protocol"
  "rel"
  "root"
  "ugly"
>}}

## Standardkonfigurasjon

Det følgjande er standardkonfigurasjon som stemmer overeins med tabellen ovanfor:

{{< code-toggle config=outputFormats />}}

baseName
: (`string`) Grunnnamnet på den publiserte fila. Standard er `index`.

isHTML
: (`bool`) Om utdataformatet skal klassifiserast som HTML. Hugo brukar denne verdien for å avgjera når han skal oppretta alias-omdirigeringar og når han skal setja inn LiveReload-skriptet. Standard er `false`.

isPlainText
: (`bool`) Om malar for dette utdataformatet skal tolkast med Go sitt [text/template]-pakke i staden for [html/template]-pakken. Standard er `false`.

mediaType
: (`string`) [Mediatypen](g) til den publiserte fila. Denne må samsvara med ein av dei [konfigurerte mediatypane].

notAlternative
: (`bool`) Om dette utdataformatet skal ekskluderast frå verdiane som blir returnert av [`AlternativeOutputFormats`]-metoden på eit `Page`-objekt. Standard er `false`.

noUgly
: (`bool`) Om stygge URL-ar skal deaktiverast for dette utdataformatet når [`uglyURLs`] er aktivert i nettstadskonfigurasjonen din. Standard er `false`.

path
: (`string`) Banestien til den publiserte fila, relativt til rota av publiseringsmappa. Viss ikkje spesifisert, vil fila bli publisert med innhaldsbana si.

permalinkable
: (`bool`) Om rendreringsutdataformatet, heller enn hovudutdataformatet, skal returnerast når metodane [`Permalink`] og [`RelPermalink`] blir kalla på eit `Page`-objekt. Sjå&nbsp;. Aktivert som standard for `html`- og `amp`-utdataformata. Standard er `false`.

protocol
: (`string`) Protokollen (skjemaet) for URL-en til dette utdataformatet. Til dømes `https://` eller `webcal://`. Standard er skjemaet for [`baseURL`]-parameteren i nettstadkonfigurasjonen din, typisk `https://`.

rel
: (`string`) Viss oppgjeven, kan du tilordna denne verdien til `rel`-attributtet i `link`-element når du itererer over utdataformat i malane dine. Standard er `alternate`.

root
: (`bool`) Om filer skal publiserast i rota av publiseringsmappa. Standard er `false`.

ugly
: (`bool`) Om stygge URL-ar skal aktiverast for dette utdataformatet når `uglyURLs` er `false` i nettstadkonfigurasjonen din. Standard er `false`.

weight
: (`int`) Når sett til ein ikkje-null verdi, brukar Hugo `weight` som det første kriteriet når utdataformat blir sortert, med fall tilbake til namnet på utdataformatet. Lettare element flyt til toppen, medan tyngre element synk til botnen. Hugo rendrer utdataformat sekvensielt basert på sorteringsrekkjefølga. Standard er `0`, med unntak for `html`-utdataformatet, som har ein standardvekt på `10`.

## Endre eit utdataformat

Du kan endra eit av standard utdataformata. Til dømes, for å prioritere `json`-rendring over `html`-rendring, når begge blir generert, juster [`weight`](#weight):

{{< code-toggle file=hugo >}}
[outputFormats.json]
weight = 1
[outputFormats.html]
weight = 2
{{< /code-toggle >}}

Dømet over viser at når du endrar eit standard innhaldsformat, treng du berre definera eigenskapane som avvik frå standardverdiane.

## Opprett eit utdataformat

Du kan laga nye utdataformat etter behov. Til dømes kan du ønskja å laga eit utdataformat for å støtta Atom-feeds.

### Steg 1

Utdataformat krev ein spesifisert mediatype. Sidan Atom-feeds brukar `application/atom+xml`, som ikkje er ein av dei [standard mediatypane], må du oppretta den først.

{{< code-toggle file=hugo >}}
[mediaTypes.'application/atom+xml']
suffixes = ['atom']
{{< /code-toggle >}}

Sjå [konfigurer mediatypar] for meir informasjon.

### Steg 2

Lag eit nytt utdataformat:

{{< code-toggle file=hugo >}}
[outputFormats.atom]
mediaType = 'application/atom+xml'
noUgly = true
{{< /code-toggle >}}

Merk at vi brukar standardinnstillingane for alle andre eigenskapar for utdataformat.

### Steg 3

Spesifiser [types](g) for kva sider som dette utdataformatet skal rendrerast for:

{{< code-toggle file=hugo >}}
[outputs]
home = ['html', 'rss', 'atom']
section = ['html', 'rss', 'atom']
taxonomy = ['html', 'rss', 'atom']
term = ['html', 'rss', 'atom']
{{< /code-toggle >}}

Sjå [konfigurer utdata] for meir informasjon.

### Steg 4

Lag ein mal for å rendrere utdataformatet. Sidan Atom-feeds er lister, må du laga ein listemal. Sjå [mal-oppslags-rekkjefølgja] for å finna den rette malbana:

```text
layouts/_default/list.atom.atom
```

Vi overlet skriving av malkoden som ei øving til deg. Sikte mot eit resultat som liknar på den [innebygde RSS-malen].

## Liste utdataformat

For å få tilgang til utdataformat, har kvart `Page`-objekt to metodar: [`OutputFormats`] (for alle format, inkludert det gjeldande) og [`AlternativeOutputFormats`]. Bruk `AlternativeOutputFormats` for å laga ei lenke `rel`-liste innanfor `head`-elementet på nettstaden din, som vist nedanfor:

```go-html-template
{{ range .AlternativeOutputFormats }}
  <link rel="{{ .Rel }}" type="{{ .MediaType.Type }}" href="{{ .Permalink | safeURL }}">
{{ end }}
```

## Lenke til utdataformat

Som standard returnerer metodane [`Permalink`] og [`RelPermalink`] for eit `Page`-objekt URL-en til det [types](g), vanlegvis `html`. Denne oppførselen held seg konsistent uavhengig av kva mal som brukast.

Til dømes, i `single.json.json` vil du sjå:

```go-html-template
{{ .RelPermalink }} → /that-page/
{{ with .OutputFormats.Get "json" }}
  {{ .RelPermalink }} → /that-page/index.json
{{ end }}
```

For å få desse metodane til å returnera URL-en til den _gjeldande_ malen sitt utdataformat, må du setja innstillinga [`permalinkable`] til `true` for det formatet.

Med `permalinkable` sett til true for `json` i den same `single.json.json`-malen:

```go-html-template
{{ .RelPermalink }} → /that-page/index.json
{{ with .OutputFormats.Get "html" }}
  {{ .RelPermalink }} → /that-page/
{{ end }}
```

## Mal-oppslags-rekkjefølgje

Kvart utdataformat krev ein mal som samsvarar med [mal-oppslags-rekkjefølgja].

For høgaste spesifisitet i mal-oppslags-rekkjefølgja, inkluder sidetype, utdataformat og endelse i filnamnet:

```text
[page kind].[output format].[suffix]
```

Til dømes, for seksjonssider:

Utdataformat|Malbane
:--|:--
`html`|`layouts/_default/section.html.html`
`json`|`layouts/_default/section.json.json`
`rss`|`layouts/_default/section.rss.xml`

[`AlternativeOutputFormats`]: /methods/page/alternativeoutputformats/
[`OutputFormats`]: /methods/page/outputformats/
[`Permalink`]: /methods/page/permalink/
[`RelPermalink`]: /methods/page/relpermalink/
[`baseURL`]: /configuration/all/#baseurl
[`permalinkable`]: #permalinkable
[`uglyURLs`]: /configuration/ugly-urls/
[konfigurer mediatypar]: /configuration/media-types/
[konfigurer utdata]: /configuration/outputs/
[konfigurerte mediatypane]: /configuration/media-types/
[standard mediatypane]: /configuration/media-types/
[innebygde RSS-malen]: {{% eturl rss %}}
[html/template]: https://pkg.go.dev/html/template
[mal-oppslags-rekkjefølgja]: /templates/lookup-order/
[text/template]: https://pkg.go.dev/text/template
