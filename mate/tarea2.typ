#set heading(numbering: "1.")

#set text(lang: "en", size: 10pt)

#let reading(body) = strike(stroke: 1.1em + rgb("ff303030"),body)


#show raw: set text(font: "JetBrainsMono NFM")

#grid(
    columns: (1fr, 1fr),
    gutter: 3pt,
    [Daniel Alejandro Osornio López], align(right)[15 / Nov / 2023],
    [0244685\@up.edu.mx]
)

#align(center)[Actividad 4.1]


Sea $S_n$ una función propirsional cuyo conjunto de trabajo se mapea en $ZZ$



+ Demuestre que $1 dot.c 2 + 2 dot.c 3 + 3 dot.c 4 + ... + n(n+1) = (n(n+1)(n+2))/(3) forall n in ZZ^+$

	- Caso base con $n = 1$:
	
		#block(
		$
		1 (1 + 1) &= (1(1 + 1)(1 + 2))/3\
		2 &= (2 dot.c 3)/3\
		2 &= 2
		$
		)
		
	- Caso inductivo, donde suponemos que cumple para $n = k$, de forma que $S(k) = (k(k+1)(k+2))/(3)$:
	
		#block(
		$
		"Si " S(k) &=> S(k + 1)\
		S(k + 1) &= ((k+1)((k+1)+1)((k+1)+2))/(3)\
		&= ((k+1)(k+2)(k+3))/(3)
		$
		)
		
		#block(
		$
		S(k + 1) &= S(k) + phi(k)\
		&= (k(k+1)(k+2))/(3) + (k+1)((k+1)+1)\
		&= (k(k+1)(k+2) + 3(k+1)(k+2))/(3)\
		&= ((k+1)(k+2)(k+3))/(3)\
		&= ((k+1)(k+1+1)(k+1+2))/(3)\
		&= (n(n+1)(n+2))/(3)
		$
		)
		
		Por lo tanto, queda demostrado que si cumple con la progresión
		
+ Demuestre que $0 + 3 + 8 + ... + (n^2-1) = (n(2n+5)(n-1))/(6) forall n in ZZ^+$

	- Caso base con $n = 1$:
	
		#block(
		$
		(1^2 - 1) &= (1(2 + 5)(1 - 1))/6\
		0 &= (1(2 + 5)(0))/6\
		0 &= 0
		$
		)
		
	- Caso inductivo, donde suponemos que cumple para $n = k$, de forma que $S(k) = (k(2k+5)(k-1))/(6)$:
	
		#block(
		$
		"Si " S(k) &=> S(k + 1)\
		S(k + 1) &= ((k+1)(2(k+1)+5)((k+1)-1))/(6)\
		&= ((k+1)(2k+7)(k))/(6)\
		$
		)
	
		#block(
		$
		S(k + 1) &= S(k) + phi(k)\
		&= (k(2k+5)(k-1))/(6) + ((k+1)^2-1)\
		&= (k(2k+5)(k-1) + 6((k+1)^2-1))/(6)\
		&= (k(2k+5)(k-1) + 6(k^2+2k))/(6)\
		&= ((2k+5)(k^2-k) + 6(k^2+2k))/(6)\
		&= (2k^3 + 3k^2 - 5k + 6k^2+12k)/(6)\
		&= (2k^3 + 9k^2 + 7k)/(6)\
		&= ((k+1)(2k+7)(k))/(6)\
		&= ((k+1)(2(k+1-1)+7)(k+1-1))/(6)\
		&= (n(2(n-1)+7)(n-1))/(6)\
		&= (n(2n-2+7)(n-1))/(6)\
		&= (n(2n-5)(n-1))/(6)
		$
		)
		
		Por lo tanto, queda demostrado que si cumple con la progresión
