// styles.typ

// --- Единый стиль обычного текста ---
// Единственное место, где задаются шрифт, кегль, межстрочный интервал
// и параметры абзаца. Все остальные стили ссылаются на эти значения.
#let regular-text-style = (
  font: "Times New Roman",
  size: 14pt,
  weight: "regular",
  lang: "ru",
  leading: 1.15em,
  first-line-indent: 12.5mm,
  justify: true,
  alignment: left,
)

// Применяет стиль обычного текста к переданному содержимому.
// Любой параметр можно переопределить, не дублируя остальные.
#let regular-text(
  body,
  font: regular-text-style.font,
  size: regular-text-style.size,
  weight: regular-text-style.weight,
  lang: regular-text-style.lang,
  leading: regular-text-style.leading,
  first-line-indent: regular-text-style.first-line-indent,
  justify: regular-text-style.justify,
  alignment: regular-text-style.alignment,
) = {
  set align(alignment)
  set text(font: font, size: size, weight: weight, lang: lang)
  set par(
    justify: justify,
    leading: leading,
    first-line-indent: first-line-indent,
  )
  body
}

#let apply-styles(doc) = {
  // Level 1 (=)
  show heading.where(level: 1): set text(size: 16pt, weight: "bold")
  show heading.where(level: 1): set align(center)

  // Level 2 (==)
  show heading.where(level: 2): set text(size: 15pt)
  show heading.where(level: 2): set align(left)

  // Level 3 (===)
  show heading.where(level: 3): set text(size: 13pt, style: "normal")
  show heading.where(level: 3): set align(left)

  // Level 4 (====)
  show heading.where(level: 4): set text(size: 11pt, weight: "regular")

  // Return the styled document content
  doc
}

// Reusable common style for page headers
#let gost-header(body) = regular-text(
  body,
  weight: "bold",
  alignment: center,
)

// Main document body styles
#let gost-style(doc) = regular-text({
  // Со второй страницы (титульный лист оформляется отдельно) задаём
  // правый отступ страницы 15 мм.
  set page(
    numbering: "1",
    number-align: center,
    margin: (right: 15mm),
  )

  // --- Подписи таблиц и рисунков по ГОСТ 7.32 ---

  // Многостраничные таблицы: фигура с таблицей может разрываться между
  // страницами (по умолчанию figure неразрывна и «сжимает» длинную таблицу)
  show figure.where(kind: table): set block(breakable: true)

  // Подпись таблицы — НАД таблицей (требует Typst 0.11+)
  show figure.where(kind: table): set figure.caption(position: top)

  // Формат подписи: «Таблица 1 — Название», слева, без абзацного отступа
  show figure.caption: it => context {
    regular-text(
      block(
        above: 1.2em,
        below: 0.6em,
        align(left)[
          #it.supplement #it.counter.display(it.numbering) — #it.body
        ],
      ),
      first-line-indent: 0pt,
      justify: false,
    )
  }

  // Подписи рисунков по ГОСТ
  show figure.where(kind: image): set figure(supplement: [Рисунок])

  // --- Обычный текст вместо заголовков 4-го уровня ---
  // Заголовки `==== …` выводятся как обычные абзацы: без полужирного
  // начертания и центрирования, но с сохранением нумерации.
  // В оглавление они не попадают.
  show heading.where(level: 4): set heading(outlined: false)
  show heading.where(level: 4): it => context {
    // Без абзацного отступа: номер всегда начинается от левого края.
    regular-text(
      [
        #if it.numbering != none [
          #numbering(it.numbering, ..counter(heading).at(it.location())) #h(0.6em)
        ]
        #it.body
      ],
      first-line-indent: 0pt,
    )
  }

  doc
})

// --- ГОСТ-оформление таблицы с подписью ---
// Поддерживает многостраничные таблицы: шапка через `header:` повторяется
// на каждой странице, а таблица разрывается по страницам без сжатия строк.
#let gost-table(
  caption: none,
  columns: auto,
  header: none,
  repeat-header: true,
  outer-stroke: 0.5pt,
  inner-stroke: 0.5pt,
  vertical-stroke: auto,
  cell-inset: (x: 2mm, y: 1mm),
  cell-align: center + horizon,
  // Выравнивание отдельных столбцов (значения ячеек). Шапка всегда
  // выравнивается по `cell-align`. Например: (left, center).
  column-align: none,
  font-size: 12pt,
  ..children,
) = {
  // Разрешаем auto → берём толщину внутренних горизонтальных линий
  let v-stroke = if vertical-stroke == auto { inner-stroke } else { vertical-stroke }

  let has-header = header != none

  // Выравнивание по столбцам: шапка — по `cell-align`, значения — по
  // `column-align` (если задано), иначе по `cell-align`.
  let align-fn = if column-align == none {
    cell-align
  } else {
    (x, y) => if has-header and y == 0 {
      cell-align
    } else if x < column-align.len() {
      column-align.at(x) + horizon
    } else {
      cell-align
    }
  }

  let n-cols = if type(columns) == int {
    columns
  } else if type(columns) == array {
    columns.len()
  } else {
    none
  }

  // Шапка таблицы: table.header(repeat: true) повторяется на каждой странице
  let head = if header == none {
    ()
  } else {
    let cells = if type(header) == array { header } else { (header,) }
    (table.header(repeat: repeat-header, ..cells),)
  }

  let tbl = regular-text(
    table(
      columns: columns,
      stroke: (x, y) => (
        top: if y == 0 { outer-stroke } else { inner-stroke },
        bottom: inner-stroke,
        left: if v-stroke == none {
          none
        } else if x == 0 {
          outer-stroke
        } else {
          v-stroke
        },
        right: if v-stroke == none {
          none
        } else if n-cols != none and x == n-cols - 1 {
          outer-stroke
        } else {
          v-stroke
        },
      ),
      inset: cell-inset,
      align: align-fn,
      ..head,
      ..children.pos(),
      // Внешняя линия снизу закрывает таблицу на последней странице
      table.hline(stroke: outer-stroke),
    ),
    size: font-size,
  )

  if caption == none {
    tbl
  } else {
    figure(
      tbl,
      caption: caption,
      kind: table,
      supplement: [Таблица],
    )
  }
}

#let section-list(body) = {
  let sec = counter(heading).get().first()
  set enum(numbering: n => numbering("1.1", sec, n))
  counter(enum).update(0)
  body
}

// --- Оформление форм приложений ---
// Единая сетка формы: тонкие линии, выравнивание по центру, без
// абзацного отступа и выключки по ширине (как в формах Word).
#let form-table(columns: auto, font-size: 11pt, ..children) = {
  set text(size: font-size)
  set par(first-line-indent: 0pt, justify: false, leading: 1em)
  table(
    columns: columns,
    stroke: 0.5pt,
    inset: (x: 2mm, y: 1.2mm),
    align: center + horizon,
    ..children,
  )
}

// Пояснение под полем формы: курсив, уменьшенный кегль.
#let form-caption(body) = text(style: "italic", size: 9pt, body)

// Пустое поле формы заданной высоты.
#let form-blank(height: 1em) = [#v(height)]