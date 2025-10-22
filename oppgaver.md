# PG5602 - Oppgaver

## 📱 Forelesning 1 - SwiftUI Grunnleggende

### Oppgave 1
- Lag et nytt xcode prosjekt og kjør det
- Finn hvor viewet er og få preview til å kjøre
- Lag en ny fil i prosjektet

### Oppgave 2
- Vis en Text på skjermen med skolens navn, pass på at den vises i preview
- Endre teksten, og kjør preview på nytt
- Kjør appen i simulator (CMD+R). Vises teksten?

### Oppgave 3 
- Endre fonten til størrelse 35
- Lag en ny tekst, og skriv navnet ditt i den. Hvor vises teksten? 
- Lag en VStack som omringer de to tekstene sånn at de vises over hverandre
- Lag en tredje tekst som skriver navnet på faget. Hvor legger denne seg?

### Oppgave 4
- Sett fargen på alle tekster til rød
- Prøv forskjellige farger som .red, .green, .orange

### Oppgave 5
- Legg til et SF Symbol ikon, graduationcap
- Endre størrelsen på ikonet ved å endre font
- Endre til forskjellige ikoner, feks star, heart, person

### Oppgave 6
- Lag en HStack med to Text komponenter ved siden av hverandre
- Kombinér VStack og HStack - lag en "visittkort" layout
- Eksperimentér med .Spacer() for å flytte elementer

### Oppgave 7
- Gjør skoleteksten bold med .fontWeight(.bold)
- Gjør navneteksten italic med .italic()
- Prøv .fontWeight(.light) og .fontWeight(.heavy) på fag-teksten
- Test .fontDesign(.monospaced) og .fontDesign(.rounded)

### Oppgave 8
- Lag en ny tekst under alt på skjermen
- Lag en tekst med gradient farge: .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
- Legg til skygge: .shadow(radius: 5)
- Prøv .shadow(color: .red, radius: 3, x: 2, y: 2)
- Prøv forskjellig radius og x og y koordinater på skyggen
- Prøv å legge skygge på andre UI-elementer, feks image, Vstack osv. Fungerer det? Hvorfor/Hvorfor ikke?

## 📐 Forelesning 2 - HStack & VStack

### Oppgave 9 - HStack Grunnleggende
- Endre din eksisterende ContentView til å bruke en HStack i stedet for VStack
- Legg inn to Text komponenter ved siden av hverandre med navnet ditt og skolen
- Kjør preview og se at tekstene nå står ved siden av hverandre
- Legg til en tredje Text med faget. Hvor plasserer den seg?

### Oppgave 10 - HStack med flere elementer
- Legg til et SF Symbol ikon mellom navn-teksten og skole-teksten
- Test forskjellige ikoner: person, graduationcap, star
- Endre rekkefølgen på elementene i HStack. Hva skjer?
- Kjør appen i simulator (CMD+R). Ser du alle elementene?

### Oppgave 11 - Introduksjon til Spacer
- Legg til en Spacer() mellom navnet ditt og skolen
- Kjør preview. Hvor mye plass tar Spacer?
- Flytt Spacer til starten av HStack. Hva skjer?
- Flytt Spacer til slutten av HStack. Hva skjer?

### Oppgave 12 - Spacer med fast størrelse
- Bytt ut Spacer() med Spacer(minLength: 20)
- Test forskjellige verdier: 5, 50, 100
- Legg til to Spacer med forskjellige størrelser i samme HStack
- Sammenlign med en vanlig Spacer() uten parametere

### Oppgave 13 - VStack Grunnleggende
- Lag en ny VStack under din eksisterende HStack
- Legg inn tre Text komponenter vertikalt: "Linje 1", "Linje 2", "Linje 3"
- Kjør preview og se at tekstene står over hverandre
- Endre teksten i midterste Text. Oppdateres preview?

### Oppgave 14 - VStack med ikoner og tekst
- I din VStack, legg til SF Symbol ikoner mellom hver tekst
- Test ikoner: arrow.up, circle, arrow.down
- Endre størrelsen på ikonene med .font(.title)
- Endre fargen på kun ikonene til .blue

### Oppgave 15 - Kombinere HStack og VStack
- Lag en ny VStack som wrapper rundt alt innholdet
- Inni denne: legg HStack øverst, deretter VStack under
- Legg til en ny Text helt nederst med "Ferdig!"
- Test at alt vises i riktig rekkefølge i preview

### Oppgave 16 - Kompleks layout
- Lag en "visittkort" layout med:
  - Øverst: HStack med navn og yrke/studie
  - I midten: VStack med skole og fag
  - Nederst: HStack med telefonnummer og e-post (dummy data)
- Bruk Spacer() for å spre elementene i HStack
- Test layouten i både preview og simulator

### Oppgave 17 - Alignment i VStack
- Ta din visittkort VStack og legg til alignment: .leading
- Se hvordan alle elementene justeres til venstre
- Test .center og .trailing alignment
- Hvilken alignment ser best ut for visittkort?

### Oppgave 18 - Spacing i HStack og VStack
- Legg til spacing: 20 i din hovedVStack
- Legg til spacing: 10 i dine HStack komponenter
- Test forskjellige spacing verdier: 5, 15, 30
- Sammenlign med og uten spacing parametere

---

## 📜 Forelesning 3 - ScrollView og ForEach

### Oppgave 1: VStack og HStack
(fortsett fra ContentView i forelesningen, ikke oppgavene over)
I ContentView.swift:
- Lag en ny VStack under den eksisterende HStacken med 3 Text elementer
- Legg elementene i en HStack inne i den nye VStack
- Bruk Spacer() for å fordele elementene jevnt

### Oppgave 2: Nesting av Stacks
- Lag en VStack som inneholder 3 HStacker
- Hver HStack skal ha et ikon til venstre og tekst til høyre
- Bruk Spacer() mellom ikon og tekst

### Oppgave 3: ScrollView Horisontal
I MyList.swift:
- Lag en horisontal ScrollView øverst som viser fagkoder
- Bruk ScrollView(.horizontal) med en HStack inni
- Vis minst 10 fagkoder som Text elementer

### Oppgave 4: ForEach med Index
- Modifiser ForEach i MyList.swift til å vise indeks/nummer foran hvert navn
- Tips: Bruk Array(names.enumerated()) og id: \.offset
- Vis som "1. Håkon", "2. Mari", osv.

### Oppgave 5: List vs ScrollView
- Lag en ny View som viser samme data med List istedenfor ScrollView
- Kommenter ut ScrollView-koden og implementer med List
- Legg merke til forskjellene i utseende og oppførsel

### Oppgave 6: Kombinert Layout
Lag en ny View med:
- En VStack som hovedcontainer
- Øverst: En tittel i en HStack med ikoner på hver side
- Midten: En ScrollView med ForEach som viser 20 elementer
- Nederst: En HStack med 3 knapper (bare Text elementer)

### Oppgave 7: ForEach med Flere Arrays
- Lag to arrays: ett for studenter og ett for lærere
- Vis begge i samme ScrollView med overskrifter
- Bruk ForEach for hver gruppe
- Skill gruppene med passende spacing

### Oppgave 8: Grid-lignende Layout
Bruk ScrollView, VStack og HStack:
- Lag et rutenett med 3 kolonner og flere rader
- Hver celle skal inneholde et ikon og tekst under
- Tips: ForEach med HStack for hver rad, eller del arrayet i grupper av 3

### Bonus: Spacer Eksperiment
- Eksperimenter med Spacer() plassering
- Lag en HStack med 3 elementer og test:
  - Spacer bare til venstre
  - Spacer bare til høyre
  - Spacer mellom alle elementer
  - Flere Spacers med minLength

---

## 🔄 Forelesning 4 - @State

### Oppgave 1: Personlig Toggle
Lag en app som:
- Har en toggle for "Jeg liker kaffe" ☕
- Viser passende emoji og tekst basert på toggle-status
- Endrer bakgrunnsfargen når toggled

### Oppgave 2: Mini Kalkulator
Lag en app som: 
- Har knapper for +1, +5, +10, -1, -5, -10
- Vise "POSITIV" eller "NEGATIV" basert på verdien
- Disable minus-knapper når count = 0

### Oppgave 3: Hilsen-Generator
Lag en app som:
- Har TextField for navn
- Dropdown/Picker for språk (Norsk, Engelsk, Spansk)
- Viser hilsen på valgt språk: "Hei [navn]", "Hello [navn]", "Hola [navn]"

## 📋 Forelesning 5 & 6

### Oppgave 1: Enkel Todo Liste

- Viser en liste med 3 forhåndsdefinerte todos: "Lære SwiftUI", "Lage app", "Publisere"
- Har en TextField for å legge til nye todos
- Har en "Legg til"-knapp som legger til teksten i listen
- Bruker NavigationView med tittel "Oppgaver"

### Oppgave 2: Todo Liste med Sletting
Utvid din todo liste med:
- .onDelete funksjonalitet for å slette todos ved swipe
- Test sletting av forskjellige todos
- Legg til minst 5 todos og test slettingen

### Oppgave 3: Todo Liste med Validering
Forbedre din app med:
- Validering som hindrer tomme todos
- Clear TextField etter å ha lagt til en todo
- Vis antall todos i navigationstittelen (f.eks. "Oppgaver (5)")

### Oppgave 4: Todo Liste med Kategorier
Lag en utvidet versjon med:
- To arrays: `workTodos` og `personalTodos`
- Bruk List med Section for å organisere todos i kategorier
- Legg til en Picker for å velge kategori ved innlegging
- Test med forskjellige todos i hver kategori

### Oppgave 5: NavigationLink Integration
Legg til navigasjon:
- Hver todo skal være en NavigationLink
- Lag en DetailView som viser todo-teksten med stor font
- Legg til en "Tilbake"-knapp (automatisk med NavigationView)
- Test navigering mellom liste og detalj

### Oppgave 6: ZStack Eksperiment
Lag en ny view med ZStack:
- Bakgrunnsfarge eller gradient
- Overlay med todo-statistikk (antall totalt, antall i hver kategori)
- Kombiner med din eksisterende NavigationView

## Oppgave 7: 
Tenk at du lager appen til mattilsynet, og er på tilsyn. Lag form basert på det
- Restaurant navn
- Adresse
- Picker med valg av smiley-score
- Inspektør (valg av definerte inspektører fra en gitt liste)
- Dato for når eventuelle utbedringer må være gjennomført

# Forelesning 7 

Oppgaver for å fullføre skjermen ProfileView

    1.    Gi bedre mellomrom og struktur mellom elementene.
    2.    Lag en rad med to knapper under teksten.
    3.    Legg til en seksjon med ekstra informasjon om brukeren.
    4.    Sett inn en skillelinje mellom toppseksjonen og informasjonen.
    5.    Lag en liste eller seksjon nederst som viser innhold relatert til brukeren.
    6.    Gjør små visuelle forbedringer med farger, skygger eller annen styling.

⸻

# Forelesning 8 - URL & URLSession

### Oppgave 1: Hent posts fra API
- Lag en app som henter posts fra `https://jsonplaceholder.typicode.com/posts`
- Lag en Post model med id, title og body
- Vis posts i en List med kun title
- Bruk async/await med URLSession

### Oppgave 2: Vis mer post-informasjon
Utvidet post-visningen:
- Vis både title (headline) og body (caption, grå)
- Begrens body til første 50 tegn med "..."
- Test med forskjellige fontstørrelser

### Oppgave 3: Håndter loading tilstand
Legg til:
- @State var isLoading for å vise ProgressView
- Sett isLoading = true før API-kall
- Sett isLoading = false etter kallet
- Test at loading vises

### Oppgave 4: Legg til feilhåndtering
- @State var errorMessage: String?
- Vis feilmelding i stedet for liste hvis error
- "Noe gikk galt" med error.localizedDescription
- Test med ugyldig URL

### Oppgave 5: Comments API
Bytt til comments:
- Bruk `https://jsonplaceholder.typicode.com/comments`
- Lag Comment model med name, email, body
- Vis name som headline og email som subheadline
- Test at JSON dekoding fungerer

### Oppgave 6: Photos API
Implementer photos:
- Bruk `https://jsonplaceholder.typicode.com/photos`
- Lag Photo model med id, title, url, thumbnailUrl
- Vis kun title i listen foreløpig
- Håndter at noen felt kan være nil

### Oppgave 7: Switch mellom tilstander
I stedet for if-else, bruk enum:
- enum ViewState { case loading, loaded, error(String) }
- Bruk switch-statement i body
- Test at alle tilstander fungerer

### Oppgave 8: Refresh funksjonalitet
- Toolbar med "Oppdater"-knapp
- .task modifier for å hente ved oppstart  
- Legg til .onAppear som alternativ til .task
- Test at data oppdateres ved knapptrykk


# Animasjonsoppgaver

## Oppgave 1: Enkel knapp-styrt animasjon
Lag en view med:
- En sirkel som endrer størrelse når du trykker på en knapp
- Sirkelen skal starte på 100x100 punkter
- Når du trykker skal den vokse til 200x200 punkter
- Animer endringen med `.animation(.default, value: ...)`

## Oppgave 2: Flere animasjonsknapper
Lag en view med:
- Et kvadrat (RoundedRectangle) i midten
- Tre knapper under: "Snurr", "Voks", "Fade"
- "Snurr"-knappen roterer kvadratet 360 grader
- "Voks"-knappen skalerer kvadratet til 1.5x størrelsen og tilbake
- "Fade"-knappen reduserer opacity til 0.3 og tilbake
- Bruk `withAnimation` for hver knapp

## Oppgave 3: Sammenligning av animasjonskurver
Lag en view som demonstrerer forskjellige animasjonskurver:
- Lag 4-5 sirkler i en vertikal stack
- Hver sirkel skal ha en annen farge
- Legg til en knapp som flytter alle sirklene fra venstre til høyre
- Gi hver sirkel en annen animasjonstype:
  - Linear
  - EaseIn
  - EaseOut
  - EaseInOut
  - Spring
- Dette lager en "race"-effekt som viser hvordan forskjellige kurver oppfører seg

## Oppgave 4: Kombinerte transformasjoner
Lag en view med:
- En form i midten (valgfritt)
- En "Sprette"-knapp som flytter formen opp og ned igjen
- En "Vibrere"-knapp som roterer formen venstre, høyre, venstre, høyre, og sentrerer den
- En "Puls"-knapp som skalerer formen større og mindre
- En "Kombo"-knapp som kombinerer flere animasjoner samtidig
- En "Reset"-knapp som returnerer alt til startposisjonen

## Oppgave 5: Interaktivt kontrollpanel
Lag et kontrollpanel med:
- En form vist i midten
- Knapper for X-posisjon: "-50" og "+50"
- Knapper for Y-posisjon: "-50" og "+50"
- Knapper for rotasjon: "-45°" og "+45°"
- Knapper for skalering: "0.5x", "1x", "2x"
- En "Reset"-knapp som returnerer alle verdier til standard
- Alle endringer skal animeres med spring-animasjon

## Oppgave 6: Form-morphing
Lag en view som bytter mellom forskjellige former:
- Vis én form om gangen i midten
- Lag knapper for: "Sirkel", "Kvadrat", "Pille", "Stjerne"
- Når du trykker på en knapp skal gjeldende form forsvinne og den nye formen vises
- Bruk `.transition()` modifiers for å få former til å skalere inn/ut eller fade inn/ut
- Bonus: Prøv å kombinere transitions som `.scale.combined(with: .opacity)`

## Oppgave 7: Gesture-animasjon
Lag et element som kan dras:
- En sirkel som kan dras rundt på skjermen
- Når du slipper den skal den animere tilbake til midten
- Sirkelen skal endre farge mens den dras
- Bruk `DragGesture()` kombinert med `withAnimation`

## Oppgave 8: Gjentakende animasjon
Lag en view med:
- En form som kontinuerlig pulserer (vokser og krymper)
- Bruk `.repeatForever(autoreverses: true)`
- Legg til en knapp for å starte/stoppe animasjonen
- Bonus: Prøv å lage en loading-indikator-effekt

## Utfordring: Animasjons-lekeplass
Kombiner alt du har lært:
- Lag en enkelt form i midten
- Legg til 6+ knapper som hver trigger en unik animasjon
- Prøv å lage interessante kombinasjoner av:
  - Posisjonsendringer (offset)
  - Rotasjon
  - Skalering
  - Opacity
  - Fargeendringer
- Legg til en reset-knapp
- Få animasjonene til å føles smooth og naturlige

## Tips
- Bruk `@State`-variabler for å lagre animasjonsverdier
- Bruk `.animation(.spring(), value: stateVariable)` for implisitte animasjoner
- Bruk `withAnimation { }` for eksplisitte animasjoner
- Spring-animasjoner føles ofte mest naturlige: `.spring(response: 0.6, dampingFraction: 0.7)`
- Du kan forsinke animasjoner: `.animation(.spring().delay(0.5), value: ...)`
- Eksperimenter med forskjellige durations og timing-kurver

---

## 💾 SwiftData - Database Persistering

### Oppgave 1: Grunnleggende SwiftData Setup
Basert på StudentRegistry prosjektet:
- Studer Models.swift filen for å forstå @Model klassene
- Se hvordan Student, Course og Enrollment er relatert
- Kjør appen og test å legge til en student
- Verifiser at data lagres ved å restarte appen

### Oppgave 2: StudentDetailView Implementation
I StudentDetailView.swift:
- Implementer body viewet basert på kommentarene i koden
- Vis student informasjon i en Section
- Vis påmeldte kurs i en egen Section
- Vis grade hvis den eksisterer, ellers vis "In Progress"
- Test at preview fungerer

### Oppgave 3: Enroll Student i Course
- Lag EnrollStudentView som viser available courses for en student
- Bruk availableCourses computed property som allerede er implementert
- Legg til funksjonalitet for å enrolle student i valgt kurs
- Test at studenten kan meldes på flere kurs

### Oppgave 4: Course Management
- Implementer CoursesView for å vise alle kurs
- Legg til AddCourseView for å legge til nye kurs
- Implementer sletting av kurs med .onDelete
- Test at kurs kan legges til og slettes

### Oppgave 5: Advanced Queries
- I StudentsView, legg til søkefunksjonalitet med .searchable
- Filtrer studenter basert på navn eller email
- Sorter studenter alfabetisk (allerede implementert med @Query)
- Test søkefunksjonaliteten

### Oppgave 6: Enrollment Management
- Lag en EnrollmentsView som viser alle påmeldinger
- Vis student navn, course title og grade (hvis satt)
- Legg til funksjonalitet for å sette karakterer
- Filtrer på completerte vs. in-progress påmeldinger

### Oppgave 7: Data Relationships
- Test og forstå cascade delete reglene i Models.swift
- Hva skjer når du sletter en student som har påmeldinger?
- Hva skjer når du sletter et kurs som har påmeldinger?
- Eksperimenter med forskjellige delete rules

### Oppgave 8: SwiftData Previews
- Studer hvordan preview data settes opp i StudentsView
- Lag preview data for CoursesView og EnrollmentsView
- Sørg for at preview-dataene viser realistiske relasjoner
- Test at previews fungerer for alle views

### Oppgave 9: Query Modifiers
- Eksperimenter med @Query modifiers:
  - Sortering: @Query(sort: \\Student.name)
  - Filtering: @Query(filter: #Predicate<Student> { $0.name.contains("a") })
- Lag en view som viser kun studenter med A-karakter
- Lag en view som viser kurs sortert etter credits

### Oppgave 10: Complex Data Operations
- Legg til bulk operations: "Delete all students", "Delete all courses"
- Implementer import/export av dummy data
- Lag en statistics view som viser:
  - Totalt antall studenter
  - Totalt antall kurs
  - Gjennomsnittlig antall påmeldinger per student
- Test performance med mange data entries

### Bonus Oppgaver:

#### Oppgave 11: Custom View Modifiers
Som nevnt i kommentarene i StudentDetailView:
- Lag custom view modifiers for styling
- Implementer en "regnbue font" modifier
- Style alle views med konsistent design

#### Oppgave 12: Advanced SwiftData Features
- Implementer batch operations
- Legg til data syncing simulation
- Implementer undo/redo funksjonalitet
- Legg til data backup og restore

#### Oppgave 13: Error Handling
- Legg til proper error handling for database operations
- Vis brukervennlige feilmeldinger
- Implementer retry logic for failed operations
- Test edge cases som network failures

### Tips for SwiftData:
- @Model klassene må være classes, ikke structs
- Bruk @Query for automatisk updates når data endres
- modelContext.insert() for å legge til nye objekter
- modelContext.delete() for å slette objekter
- @Relationship definerer foreign keys og delete rules
- Test alltid cascading deletes grundig
