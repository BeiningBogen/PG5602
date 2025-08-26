

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
