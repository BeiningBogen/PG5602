

# PG5602 H2025


# Oppgave 1
- Lag et nytt xcode prosjekt og kjør det
- Finn hvor viewet er og få preview til å kjøre
- Lag en ny fil i prosjektet

# Oppgave 2
- Vis en Text på skjermen med skolens navn, pass på at den vises i preview
- Endre teksten, og kjør preview på nytt
- Kjør appen i simulator (CMD+R). Vises teksten?

# Oppgave 3 
- Endre fonten til størrelse 35
- Lag en ny tekst, og skriv navnet ditt i den. Hvor vises teksten? 
- Lag en VStack som omringer de to tekstene sånn at de vises over hverandre
- Lag en tredje tekst som skriver navnet på faget. Hvor legger denne seg?

# Oppgave 4
- Sett fargen på alle tekster til rød
- Prøv forskjellige farger som .red, .green, .orange

# Oppgave 5
- Legg til et SF Symbol ikon, graduationcap
- Endre størrelsen på ikonet ved å endre font
- Endre til forskjellige ikoner, feks star, heart, person
# Oppgave 6
- Lag en HStack med to Text komponenter ved siden av hverandre
- Kombinér VStack og HStack - lag en "visittkort" layout
- Eksperimentér med .Spacer() for å flytte elementer
# Oppgave 7
- Gjør skoleteksten bold med .fontWeight(.bold)
- Gjør navneteksten italic med .italic()
- Prøv .fontWeight(.light) og .fontWeight(.heavy) på fag-teksten
- Test .fontDesign(.monospaced) og .fontDesign(.rounded)

# Oppgave 8
- Lag en ny tekst under alt på skjermen
- Lag en tekst med gradient farge: .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
- Legg til skygge: .shadow(radius: 5)
- Prøv .shadow(color: .red, radius: 3, x: 2, y: 2)
- Prøv forskjellig radius og x og y koordinater på skyggen
- Prøv å legge skygge på andre UI-elementer, feks image, Vstack osv. Fungerer det? Hvorfor/Hvorfor ikke?


# Forelesning 2

# Tema HStack & VStack 

## HStack
**Url:** https://developer.apple.com/documentation/swiftui/hstack

HStack arrangerer views horisontalt (ved siden av hverandre).

```swift
HStack {
    Text("Første")
    Text("Andre")
    Text("Tredje")
}
```

### Spacer()
**Spacer** tar opp all tilgjengelig plass og skyver andre views bort fra hverandre.

```swift
HStack {
    Text("Venstre")
    Spacer()
    Text("Høyre")
}
```

Du kan også bruke Spacer med fast størrelse:
```swift
HStack {
    Text("Start")
    Spacer(minLength: 50)
    Text("Slutt")
}
```

## VStack
**Url:** https://developer.apple.com/documentation/swiftui/vstack

VStack arrangerer views vertikalt (over hverandre).

```swift
VStack {
    Text("Øverst")
    Text("I midten")
    Text("Nederst")
}
```

### Kombinering av HStack og VStack
Du kan kombinere HStack og VStack for å lage komplekse layouts:

```swift
VStack {
    Text("Tittel")
    
    HStack {
        Text("Venstre")
        Spacer()
        Text("Høyre")
    }
    
    Text("Bunn")
}
```

### Alignment og Spacing
Både HStack og VStack støtter alignment og spacing:

```swift
VStack(alignment: .leading, spacing: 10) {
    Text("Tekst 1")
    Text("Lengre tekst 2")
    Text("Kort")
}

HStack(alignment: .top, spacing: 20) {
    Text("Høy\ntekst")
    Text("Lav")
}
```

# Oppgave 9 - HStack Grunnleggende
- Endre din eksisterende ContentView til å bruke en HStack i stedet for VStack
- Legg inn to Text komponenter ved siden av hverandre med navnet ditt og skolen
- Kjør preview og se at tekstene nå står ved siden av hverandre
- Legg til en tredje Text med faget. Hvor plasserer den seg?

# Oppgave 10 - HStack med flere elementer
- Legg til et SF Symbol ikon mellom navn-teksten og skole-teksten
- Test forskjellige ikoner: person, graduationcap, star
- Endre rekkefølgen på elementene i HStack. Hva skjer?
- Kjør appen i simulator (CMD+R). Ser du alle elementene?

# Oppgave 11 - Introduksjon til Spacer
- Legg til en Spacer() mellom navnet ditt og skolen
- Kjør preview. Hvor mye plass tar Spacer?
- Flytt Spacer til starten av HStack. Hva skjer?
- Flytt Spacer til slutten av HStack. Hva skjer?

# Oppgave 12 - Spacer med fast størrelse
- Bytt ut Spacer() med Spacer(minLength: 20)
- Test forskjellige verdier: 5, 50, 100
- Legg til to Spacer med forskjellige størrelser i samme HStack
- Sammenlign med en vanlig Spacer() uten parametere

# Oppgave 13 - VStack Grunnleggende
- Lag en ny VStack under din eksisterende HStack
- Legg inn tre Text komponenter vertikalt: "Linje 1", "Linje 2", "Linje 3"
- Kjør preview og se at tekstene står over hverandre
- Endre teksten i midterste Text. Oppdateres preview?

# Oppgave 14 - VStack med ikoner og tekst
- I din VStack, legg til SF Symbol ikoner mellom hver tekst
- Test ikoner: arrow.up, circle, arrow.down
- Endre størrelsen på ikonene med .font(.title)
- Endre fargen på kun ikonene til .blue

# Oppgave 15 - Kombinere HStack og VStack
- Lag en ny VStack som wrapper rundt alt innholdet
- Inni denne: legg HStack øverst, deretter VStack under
- Legg til en ny Text helt nederst med "Ferdig!"
- Test at alt vises i riktig rekkefølge i preview

# Oppgave 16 - Kompleks layout
- Lag en "visittkort" layout med:
  - Øverst: HStack med navn og yrke/studie
  - I midten: VStack med skole og fag
  - Nederst: HStack med telefonnummer og e-post (dummy data)
- Bruk Spacer() for å spre elementene i HStack
- Test layouten i både preview og simulator

# Oppgave 17 - Alignment i VStack
- Ta din visittkort VStack og legg til alignment: .leading
- Se hvordan alle elementene justeres til venstre
- Test .center og .trailing alignment
- Hvilken alignment ser best ut for visittkort?

# Oppgave 18 - Spacing i HStack og VStack
- Legg til spacing: 20 i din hovedVStack
- Legg til spacing: 10 i dine HStack komponenter
- Test forskjellige spacing verdier: 5, 15, 30
- Sammenlign med og uten spacing parametere



# Forelesning 3 

Oppgave 1: VStack og HStack
(fortsett fra ContentView i forelesningen, ikke oppgavene over)
  I ContentView.swift:
  - Lag en ny VStack under den eksisterende HStacken med 3 Text elementer
  - Legg elementene i en HStack inne i den nye VStack
  - Bruk Spacer() for å fordele elementene jevnt

  Oppgave 2: Nesting av Stacks

  - Lag en VStack som inneholder 3 HStacker
  - Hver HStack skal ha et ikon til venstre og tekst til høyre
  - Bruk Spacer() mellom ikon og tekst

  Oppgave 3: ScrollView Horisontal

  I MyList.swift:
  - Lag en horisontal ScrollView øverst som viser fagkoder
  - Bruk ScrollView(.horizontal) med en HStack inni
  - Vis minst 10 fagkoder som Text elementer

  Oppgave 4: ForEach med Index

  - Modifiser ForEach i MyList.swift til å vise indeks/nummer foran hvert navn
  - Tips: Bruk Array(names.enumerated()) og id: \.offset
  - Vis som "1. Håkon", "2. Mari", osv.

  Oppgave 5: List vs ScrollView

  - Lag en ny View som viser samme data med List istedenfor ScrollView
  - Kommenter ut ScrollView-koden og implementer med List
  - Legg merke til forskjellene i utseende og oppførsel

  Oppgave 6: Kombinert Layout

  Lag en ny View med:
  - En VStack som hovedcontainer
  - Øverst: En tittel i en HStack med ikoner på hver side
  - Midten: En ScrollView med ForEach som viser 20 elementer
  - Nederst: En HStack med 3 knapper (bare Text elementer)

  Oppgave 7: ForEach med Flere Arrays

  - Lag to arrays: ett for studenter og ett for lærere
  - Vis begge i samme ScrollView med overskrifter
  - Bruk ForEach for hver gruppe
  - Skill gruppene med passende spacing

  Oppgave 8: Grid-lignende Layout

  Bruk ScrollView, VStack og HStack:
  - Lag et rutenett med 3 kolonner og flere rader
  - Hver celle skal inneholde et ikon og tekst under
  - Tips: ForEach med HStack for hver rad, eller del arrayet i grupper av 3

  Bonus: Spacer Eksperiment

  - Eksperimenter med Spacer() plassering
  - Lag en HStack med 3 elementer og test:
    - Spacer bare til venstre
    - Spacer bare til høyre
    - Spacer mellom alle elementer
    - Flere Spacers med minLength
