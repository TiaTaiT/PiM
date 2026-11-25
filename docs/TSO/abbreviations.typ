// /docs/TSO/abbreviations.typ
#import "/config/styles.typ": gost-header
#let data = json("../../config/abbreviations.json")
#let by-id = data.map(x => (str(x.id), x)).to-dict()

// Для ТСО
#let output = (
  (range(1, 14) + (16,))
    .map(id => by-id.at(str(id)))
    .sorted(key: x => lower(x.content).replace("ё", "е"))
)

// Для ЭМ
//#let output = (
//  (range(14, 24) + (3,))
//    .map(id => by-id.at(str(id)))
//    .sorted(key: x => lower(x.content).replace("ё", "е"))
//)

// Для ИБТСО
//#let output = (
//  (range(25, 48) + (3,)+ (18,))
//    .map(id => by-id.at(str(id)))
//    .sorted(key: x => lower(x.name).replace("ё", "е"))
//)

= ОБОЗНАЧЕНИЯ И СОКРАЩЕНИЯ

#table(
  columns: (auto, auto, 1fr),
  stroke: none,
  inset: 0pt,
  column-gutter: 0.5em,
  row-gutter: 0.5em,
  align: (left, center, left),
  ..output
    .map(x => (x.name, sym.dash.em, x.content))
    .flatten()
)

#pagebreak()

