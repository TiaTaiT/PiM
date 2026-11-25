// /docs/TSO/standards.typ
#import "/config/styles.typ": gost-header
#let data = json("../../config/standards.json")

== Перечень руководящих и нормативных документов

// Нумерация пунктов как <раздел>.<подраздел>.<пункт>: 4.1.1, 4.1.2, ...
#set enum(numbering: n => context {
  // counter(heading).get() возвращает весь путь: для "== ..." это (4, 1)
  let nums = counter(heading).get()
  numbering("1.1.1", nums.at(0), nums.at(1), n)
})

#enum(
  ..data.map(item => item.content),
)
