#set rect(radius: 2pt) 

#set heading(numbering: "1.")

#set text(lang: "es", size: 11pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)


#show raw: set text(font: "JetBrainsMono NFM")

#grid(
    columns: (1fr, 1fr),
    gutter: 3pt,
    [Daniel Alejandro Osornio López], align(right)[14 / Nov / 2023],
    [0244685\@up.edu.mx]
)

#align(center)[#text(size: 12pt)[*JavaScript*]]

JavaScript es uno de los lenguajes más usados por la amplia gama de tareas que puede desempeñar gracias al ecosistema
que ha desarrollado. Aunque sus orígnes son en la web, con _runtimes_ como `bun` o `nodejs` se pueden realizar todo tipo
tareas.

"2023 continues JavaScript’s streak as its eleventh year in a row as the most commonly-used programming language." @so_js

Como JavaScript se originó para dar interactividad en la Web, su uso principal es para asuntos relacionados principalmente con la web. 
Desde el _render_ de interfaces de html con React, Svelte, o demás frameworks; hasta la programación de _backends_ usando librerías como express.js.

También se pueden realizar apps nativas fáciles de distribuir entre múltiples sistemas operativos usando teconologías de la Web
con herramientas como Electron o Tauri, lo que lo hacen buen candidato para contar con una gran pila de desarrolladores
disponibles y desarrollar aplicaciones multi plataforma usando frameworks ampliamente conocidos por su importancia a la Web y deistribuirlo
a plataformas como iOS, MacOS, Linux y Windows con la misma base de código que emplea HTML, CSS y JS.

Para las bases de código que desean tener mas confiabilidad en el código pueden emplear TypeScript, que agrega un sistema
de tipado sobre JavaScript, lo que mejora ampliamente la codificación y la integración con herramientas como IDEs o LSPs.

JavaScript es una parte fundamental para cualquier página Web que podemos aprovechar para programar distintas partes del mismo, fuera
de solo la interacción con botones. Al ser un lenguaje sencillo y flexible sus aplicaciones son muchas.

#text(fill: white, [@para_que @aws_js @tauri])
 
#bibliography("bib.yml")
