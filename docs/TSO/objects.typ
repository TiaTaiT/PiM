// /docs/TSO/objects.typ
#let data = json("../../config/objects.json")
#let var = json("../../config/variables.json")

= Объект испытаний

Испытаниям подвергается комплекс инженерно-технических средств охраны (КИТСО) объекта «Центральная база» в составе стройки 
#var.construction_name:

#table(
  columns: (auto, 1fr),
  stroke: none,
  inset: 0pt,
  column-gutter: 0.5em,
  row-gutter: 0.5em,
  align: (left, left),
  ..data
    .map(x => (sym.dash.em, x.content))
    .flatten()
)

#pagebreak()