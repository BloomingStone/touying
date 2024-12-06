#import "../lib.typ": *
#import themes.metropolis: *
#import "@preview/diagraph:0.3.0": *


#show figure.caption: set text(size: 15pt)
#show footnote.entry: set text(size: 8pt)
#set heading(numbering: (..nums) => {
  if nums.pos().len() <= 2 {
    numbering("1.1.", ..nums)
  }
})
#show heading.where(level: 3): x => {
  underline(
    stroke: (thickness: 1.5pt, paint: orange, cap: "round"),
    offset: 3pt,
    background: true,
  )[#x]
}
#show heading.where(level: 3): set text(weight: "medium", size: 23pt)
#set footnote(numbering: "[1]")

#set table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) => if y == 0 {
    gray
  } else {
    silver
  },
  inset: (top: .5em, bottom: .5em),
)

// --------- BASIC INFORMATION ---------

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  font: ("Linux Libertine", "Source Han Sans SC", "Source Han Sans"),
  config-info(

    title: [],

    // subtitle: [A Simple Investigation of Content Delivery Network],
    author: [],
    date: datetime.today(),
  ),
  // config-common(new-section-slide-fn: none),
)

#title-slide()

#components.adaptive-columns(outline(title: none, indent: 1em, depth: 2))