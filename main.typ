// main.typ
#import "/config/styles.typ": gost-style, apply-styles

#include "/docs/title.typ"

// Activate GOST layout globally for all included files below
#show: gost-style

#set heading(numbering: "1.1.1.1")
#show heading: set align(center)

#outline(depth: 2)
#pagebreak()

#show: apply-styles

#include "/docs/TSO/abbreviations.typ"
#include "/docs/TSO/objects.typ"
#include "/docs/TSO/purpose.typ"
#include "/docs/TSO/generals.typ"
#include "/docs/TSO/volume.typ"
#include "/docs/TSO/conditions.typ"
#include "/docs/TSO/supports.typ"
#include "/docs/TSO/testers.typ"
#include "/docs/TSO/reporting.typ"
#include "/docs/TSO/appendix-a.typ"
#include "/docs/TSO/appendix-b.typ"
#include "/docs/TSO/appendix-c.typ"
#include "/docs/TSO/appendix-d.typ"
#include "/docs/TSO/appendix-e.typ"

