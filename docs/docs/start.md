---
sidebar_position: 2
---

# 开始

在开始之前，请确保你已经安装了 Typst 环境，如果没有，可以使用 [Web App](https://typst.app/) 或 VS Code 的 [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp) 和 [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview) 插件。

要使用 Touying，你只需要在文档里加入

```typst
#import "@preview/touying:0.2.0": *

#let (init, slide, slides) = utils.methods(s)
#show: init

#show: slides

= Title

== First Slide

Hello, Touying!

#pause

Hello, Typst!
```

这很简单，你创建了你的第一个 Touying slides，恭喜！🎉

## 更复杂的例子

事实上，Touying 提供了多种 slides 编写风格，例如这里依靠一级和二级标题来划分新 slide，实际上你也可以使用 `#slide[..]` 的写法，以获得 Touying 提供的更多更强大的功能。

```typst
#import "@preview/touying:0.2.0": *

#let s = (s.methods.enable-transparent-cover)(self: s)
#let (init, slide) = utils.methods(s)
#show: init

// simple animations
#slide[
  a simple #pause *dynamic*

  #pause
  
  slide.

  #meanwhile

  meanwhile #pause with pause.
][
  second #pause pause.
]

// complex animations
#slide(setting: body => {
  set text(fill: blue)
  body
}, repeat: 3, self => [
  #let (uncover, only, alternatives) = utils.methods(self)

  in subslide #self.subslide

  test #uncover("2-")[uncover] function

  test #only("2-")[only] function

  #pause

  and paused text.
])

// math equation animations
#slide[
  == Touying Equation

  #touying-equation(`
    f(x) &= pause x^2 + 2x + 1  \
         &= pause (x + 1)^2  \
  `)

  #meanwhile

  Touying equation is very simple.
]

// multiple pages for one slide
#slide[
  == Multiple Pages for One Slide

  #lorem(200)
]

// appendix by freezing last-slide-number
#let s = (s.methods.appendix)(self: s)
#let (slide,) = utils.methods(s)

#slide[
  == Appendix
]
```

除此之外，Touying 还提供了很多内置的主题，能够简单地编写精美的 slides，基本上，您只需要在文档顶部加入一行

```
#let s = themes.metropolis.register(s, aspect-ratio: "16-9")
```

即可使用 metropolis 主题。关于更详细的教程，您可以参阅后面的章节。
