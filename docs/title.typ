//title.typ
#let data = json("../config/variables.json")

#set page(
  paper: "a4",
  margin: (left: 28.5mm, right: 13.5mm, top: 20mm, bottom: 20mm),
  numbering: none,
)
#set text(font: "Times New Roman", size: 12pt, lang: "ru")
#set par(justify: false, leading: 0.8em, spacing: 6pt)

// Newlines in a value start a new line; empty values leave a writable line.
#let multiline(value) = value.split("\n").map(part => [#part]).join(linebreak())

// Split a text into lines that fit the given width.
#let wrap-lines(part, width) = {
  let lines = ()
  let words = part.split(" ")
  let current = ()
  for word in words {
    let candidate = (current + (word,)).join(" ")
    if current.len() > 0 and measure(candidate).width > width {
      lines.push(current.join(" "))
      current = (word,)
    } else {
      current.push(word)
    }
  }
  lines.push(current.join(" "))
  lines
}

// Every visual line gets its own underline, including automatically wrapped ones.
#let field(value) = layout(size => {
  let lines = ()
  for part in value.split("\n") {
    if part == "" {
      lines.push("")
    } else {
      lines += wrap-lines(part, size.width)
    }
  }
  lines.map(part => block(
    width: 100%,
    inset: (bottom: 2.0pt),
    stroke: (bottom: 0.5pt),
    align(center, if part == "" { [ ] } else { part }),
  )).join()
})
#let caption(body) = align(center, text(size: 10pt, style: "italic", body))
#let date-line = [«\_\_\_\_» \_\_\_\_\_\_\_\_\_\_\_\_\_\_ 20\_\_\_\_ г.]

#let signature(name) = grid(
  columns: (1fr, 7mm, 1fr),
  gutter: 2pt,
  field(""), [], field(name),
  caption[(личная подпись)], [], caption[(ФИО)],
)

#let approval(heading, organization, position, name, organization-caption) = [
  #align(center, heading)
  #v(4mm)
  #field(organization)
  #caption(organization-caption)
  #v(4mm)
  #field("")
  #v(4mm)
  #field(position)
  #caption[(должность)]
  #v(4mm)
  #signature(name)
  #v(4mm)
  #align(center, date-line)
]

#block(
  width: 100%,
  height: 257mm,
  stroke: 0.5pt,
  inset: (x: 2mm, y: 1mm),
)[
  #grid(
    columns: (1fr, 10mm, 1fr),
    approval(
      [«СОГЛАСОВАНО»],
      data.operator.organization,
      data.operator.position,
      data.operator.name,
      [(наименование эксплуатирующей организации)],
    ),
    [],
    approval(
      [«УТВЕРЖДАЮ»],
      data.customer.organization,
      data.customer.position,
      data.customer.name,
      [(наименование организации-заказчика)],
    ),
  )

  #v(1fr)
  #align(center)[
    #text(size: 14pt, weight: "bold")[#data.document_code] \
    #text(size: 14pt, weight: "bold")[#multiline(data.document_title)]
  ]
  #v(4mm)
  #text(size: 14pt, field(data.construction_name))
  #caption[(наименование стройки)]
  #v(4mm)
  #field(data.construction_code)
  #caption[(код стройки)]
  #v(1fr)

  #grid(
    columns: (1fr, 10mm, 1fr),
    [], [],
    [
      #field(data.contractor.organization)
      #caption[(наименование организации-подрядчика)]
      #v(4mm)
      #field(data.contractor.position)
      #caption[(должность)]
      #v(4mm)
      #signature(data.contractor.name)
      #v(4mm)
      #align(center, date-line)
    ],
  )
  #v(1fr)
  #align(center, text(size: 14pt)[#data.city \
  #data.year г.])
]

// Continuation of the title page: approval list.
#pagebreak()
#set page(
  margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm),
  numbering: "1",
  number-align: center,
)
#set par(leading: 0.6em, spacing: 0pt)

#align(right)[
  Продолжение титульного листа \
  Программы и методики испытаний \
  #data.document_code
]

#v(5mm)
#align(center, text(size: 14pt, weight: "bold")[ЛИСТ СОГЛАСОВАНИЯ])
#v(5mm)

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  rows: 10mm,
  stroke: 0.5pt,
  inset: (x: 2mm, y: 10pt),
  align: center + top,
  text(size: 14pt, weight: "bold")[Ф.И.О.],
  text(size: 14pt, weight: "bold")[ДОЛЖНОСТЬ],
  text(size: 14pt, weight: "bold")[ПОДПИСЬ],
  text(size: 14pt, weight: "bold")[ДАТА],
  ..range(16 * 4).map(_ => []),
)
#pagebreak()