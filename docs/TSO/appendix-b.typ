// /docs/TSO/appendix-b.typ
// Приложение Б
#import "/config/styles.typ": form-table, form-caption, form-blank

#pagebreak()
#set heading(numbering: none)
#heading(numbering: none)[ПРИЛОЖЕНИЕ Б]
#counter(heading).update(0)

#align(center)[(обязательное)]
#align(center)[*Форма протокола индивидуальных испытаний*]
#v(1em)

#form-table(
  columns: (1.7fr, 1.8fr, 2.7fr, 1.85fr, 0.24fr, 2fr),
  table.cell(colspan: 6)[*ПРОТОКОЛ* \
    *индивидуальных испытаний*],
  table.cell(colspan: 6)[#form-caption[(наименование комплекса, системы ИТСО)]],
  table.cell(colspan: 2)[#form-blank()],
  [#form-blank()],
  table.cell(colspan: 3)[«#("_____")» #("_____________") 20#("___") г.],
  table.cell(colspan: 2)[#form-caption[(наименование организации)]],
  [],
  table.cell(colspan: 3)[#form-caption[(дата)]],
  table.cell(colspan: 6, align: left)[Объект испытаний:],
  table.cell(colspan: 6)[#form-blank(height: 1.2em)],
  table.cell(colspan: 6)[#form-caption[(наименование оборудования, подсистемы, номер чертежа, наименование объекта, здания, зоны)]],
  table.cell(colspan: 6, align: left)[Цель испытаний],
  table.cell(colspan: 6)[#form-blank(height: 1.2em)],
  table.cell(colspan: 6, align: left)[Место и время проведения испытаний],
  table.cell(colspan: 6)[#form-blank(height: 1.2em)],
  table.cell(colspan: 6, align: left)[Состав и характеристики оборудования],
  table.cell(colspan: 6)[#form-blank(height: 1.2em)],
  table.cell(colspan: 6)[#form-caption[(приводится состав и краткое изложение характеристик и возможностей оборудования подсистемы)]],
  table.cell(colspan: 6, align: left)[Методика испытаний],
  table.cell(colspan: 6)[#form-blank(height: 1.2em)],
  table.cell(colspan: 6)[#form-caption[(приводятся способы и методы испытаний, необходимое оборудование для оценки параметров и характеристик)]],
  table.cell(colspan: 6, align: left)[Результаты испытаний],
  table.cell(colspan: 6)[#form-blank(height: 1.2em)],
  table.cell(colspan: 6)[#form-caption[(приводятся результаты испытаний, обеспечение оборудованием, подсистемой основных параметров и характеристик)]],
  [Оборудование],
  table.cell(colspan: 5)[#form-blank()],
  [#form-blank()],
  table.cell(colspan: 5)[#form-caption[(система, подсистема)]],
  table.cell(colspan: 6, align: left)[ИТСО работоспособно и может быть представлено на комплексное опробование в составе системы, комплекса ИТСО],
  table.cell(colspan: 6, align: left)[Индивидуальные испытания провели представители:],
  table.cell(colspan: 6, align: left)[Заказчика:],
  table.cell(colspan: 4)[#form-blank(height: 0.8em)],
  [#form-blank(height: 0.8em)],
  [#form-blank(height: 0.8em)],
  table.cell(colspan: 4)[#form-caption[(Ф.И.О., должность, организация)]],
  [],
  [#form-caption[(подпись)]],
  table.cell(colspan: 4, align: left)[Эксплуатирующей организации:],
  [#form-blank(height: 0.8em)],
  [#form-blank(height: 0.8em)],
  table.cell(colspan: 4)[#form-caption[(Ф.И.О., должность, организация)]],
  [],
  [#form-caption[(подпись)]],
  table.cell(colspan: 4, align: left)[Монтажной организации:],
  [#form-blank(height: 0.8em)],
  [#form-blank(height: 0.8em)],
  table.cell(colspan: 4)[#form-caption[(Ф.И.О., должность, организация)]],
  [],
  [#form-caption[(подпись)]],
  table.cell(colspan: 4, align: left)[Пусконаладочной организации:],
  [#form-blank(height: 0.8em)],
  [#form-blank(height: 0.8em)],
  table.cell(colspan: 4)[#form-caption[(Ф.И.О., должность, организация)]],
  [],
  [#form-caption[(подпись)]],
)
