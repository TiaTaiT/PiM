// /docs/TSO/appendix-e.typ
// Приложение Д
#import "/config/styles.typ": gost-table

#pagebreak()
#set heading(numbering: none)
#heading(numbering: none)[ПРИЛОЖЕНИЕ Д]
#counter(heading).update(0)

#align(center)[(обязательное)]
#align(center)[*ЖУРНАЛ ПРОВЕРКИ РАБОТОСПОСОБНОСТИ ИТСО*]
#v(1em)

#gost-table(
  columns: (1.27fr, 3.54fr, 1.98fr, 2.65fr, 2.5fr, 2.78fr),
  header: (
    [Дата проверки],
    [Наименование оборудования],
    [Место нахождения оборудования],
    [Пункт проверки по методике],
    [Способ проверки оборудования],
    [Результат проверки оборудования],
  ),
  ..range(17).map(_ => (
    [#v(1.2em)],
    [#v(1.2em)],
    [#v(1.2em)],
    [#v(1.2em)],
    [#v(1.2em)],
    [#v(1.2em)],
  )).flatten(),
)
