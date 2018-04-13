/* AUFGABE 1.a.: Prädikat vereinigen/3 welches zwei Listen kombiniert und als eine neue Liste wiedergibt.
 *  Diese Aussagen sollen wahr ergeben bei Query:
 * ?- vereinigen([a, b], [c, d], [a, b, c, d]).
 * ?- vereinigen([a, b, c], [d, e], [a, b, c, d, e]).
 * ?- vereinigen(A,B,C). (als zusätzlicher Testfall, an dem man sieht,
 * dass die Listen in den ersten beiden Argumenten vereinigt wurden)
 * TEST CHECK DES vereinigen/3-PRÄDIKATS SIEHE BEIGEFÜGTE SCREENSHOTS
 * Notation:
 * H ... Head, T1 ... Tail1,  T2 ... Tail2, T3 ... Tail3, L2 ... zweite Liste */

erste(A):- =(A,[a, b]).
zweite(B):- =(B,[c,d]).
dritte(C):- =(C,[a,b,c,d]).

vereinigen([], Liste, Liste).
vereinigen([H|T1], L2, [H|T3]):-vereinigen(T1, L2, T3).

/* AUFGABE 1.b.: Prädikat entfernen/3 welches ein beliebiges Element (erstes Argument) aus einer Liste (zweites Argument) entfernt und die restliche Liste (drittes Argument) liefert.
Zum Beispiel, die folgenden Abfragen sollen wahre Aussagen ergeben:
?- entfernen(a, [a, b, c], [b, c]).
?- entfernen(c, [a, b, c, c], [a, b, c]).
TEST CHECK DES entfernen/3-PRÄDIKATS SIEHE BEIGEFÜGTE SCREENSHOTS */

entfernen(ZuEntfernendesElement, [ZuEntfernendesElement|Restliste], Restliste).
entfernen(ZuEntfernendesElement, [Element | Restliste], [Element | Restliste_Tail]):-entfernen(ZuEntfernendesElement, Restliste, Restliste_Tail).


/* AUFGABE 1.c.: Prädikat einfuegen/3 welches ein beliebiges Element (erstes Argument) zu einer Liste (zweites Argument) hinzufügt und eine neue Liste (drittes Argument) liefert, welche das hinzugefügte Element enthält.
Zum Beispiel, die folgenden Abfragen sollen wahre Aussagen ergeben:
?- einfuegen(a, [b, c], [a, b, c]).
?- einfuegen(a, [a, b, c], [a, a, b, c]).
--> Anmerkung: lt. Queries oben sollte das neue Element (a in den
Testfällen) am Anfang der neuen Liste eingesetzt werden)
TEST CHECK DES einfuegen/3-PRÄDIKATS SIEHE BEIGEFÜGTE SCREENSHOTS */

einfuegen(EinzufuegendesElement, OhneEinfuegung, MitEinfuegung):- entfernen(EinzufuegendesElement, MitEinfuegung, OhneEinfuegung).

/* AUFGABE 1.d.: Prädikat permutation/2 wobei das erste Argument eine Permutation vom zweiten Argument ist.
Zum Beispiel, die folgende Abfrage soll eine wahre Aussage ergeben:
?- permutation([a, b], [b, a]).
Testen Sie die folgende Abfrage:
?- permutation([a, b, c, d, e, f, g, h, i , j ,k ,l], X).
Wieviele Ergebnisse für X erwarten/bekommen Sie? --> Ich erwarte für X
12! (=12*11*10*9*8*7*6*5*4*3*2*1 = 479001600)Ergebnisse. Im beigefügten
Screentshot wird ein Ausschnitt der Lösungsmenge gezeigt (Es können
aufgrund der Vielzahl nicht alle aufgelistet werden.)
Als WEITEREN TESTFALL habe ich Folgendes getestet:
?-permutation([a,b,c,d],X).
--> Diese Permutation gibt 4! (=4*3*2*1 = 24) Lösungsmöglichkeiten aus.
Die Auswertung der Anfrage ist anbei als Screenshot. Am Ende
steht "false", da es nach diesen 24 Möglichkeiten keine
weiteren Möglichkeiten mehr gibt.
Notation:
H...Head, T...Tail
TEST CHECK DES permutation/2-PRÄDIKATS SIEHE BEIGEFÜGTE 2 SCREENSHOTS */

permutation([], []).
permutation([H|T], Permutiert):-permutation(T,PermutiertT),einfuegen(H, PermutiertT, Permutiert).

/* AUFGABE 2: Definieren Sie ein Prädikat setzAmEnde(X, AlteListe, NeueListe) welches eine Liste NeueListe liefert wobei das Objekt X am Ende der Liste AlteListe hinzugefügt wird.
eigene Testabfragen:
?- setzAmEnde(albert, [ali, aylin, alvin, ava], [ali, aylin, alvin,
ava,albert]).
--> AUSWERTUNG der Anfrage: TRUE.
?- setzAmEnde(X, [ben, carl, dora], [ben, carl, dora, emilia]).
--> AUSWERTUNG der Anfrage: X=emilia.
TEST CHECKS SIEHE BEIGEFÜGTE SCREENSHOTS. */

setzAmEnde(X,[],[X]).
setzAmEnde(X,[Head|Tail],[Head|NeueListe]) :- setzAmEnde(X,Tail,NeueListe).

/* AUFGABE 3: Definieren Sie ein Prädikat letztes(Mitglied, Liste) welches eine wahre Aussage liefert wenn Mitglied das letzte Element der Liste ist.
eigene Testabfragen:
?- letztes(fiona,[geraldine, hanna, inna, fiona]).
?- letztes(X,[jara, kara, mara, sara]).
Notation: H...Head, T...Tail.
TEST CHECKS SIEHE BEIGEFÜGTE SCREENSHOTS. */

letztes(Mitglied,[Mitglied]).
letztes(Mitglied,[H|T]):-letztes(Mitglied,T).

/* AUFGABE 4: Lesen Sie die SWI Prolog Dokumentation über den Operator is indem Sie die folgende Abfrage machen:
?- help(is).
Erklären Sie kurz was dieser Operator macht. */

/* LÖSUNG: (Ausführung siehe Screenshot im Anhang)
 *  Der Operator "is" hat die Stelligkeit 2, daher schreibt man auch
 *  is/2. Er wird laut Dokumentation angegeben als "-Number is
 *  +Expression", also z.B. 3 is 1+2 würde TRUE ergeben. Die umgekehrte
 *  Formulierung von 1+2 is 3, also "Expression is Number", wäre nicht
 *  möglich, und die Abfragen würde FALSE ergeben. Er ergibt "TRUE" wenn
 *  die Number dem Wert der Expression entspricht. Eine Auswertung von
 *  Abfragen wäre auch in dieser Form möglich: ?- is(X,+(1,2)). Diese
 *  Abfrage würde X=3 ergeben. Die Form ist hier also is(Number,
 *  Expression). Der Operator sollte nicht mit Operator =:=, der ein
 *  Vergleichsoperator ist, verwechselt werden
 *  Zusätzliche verwendete Quelle:
 *  http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse19
 */

/* AUFGABE 5: Definieren Sie ein Prädikat kleinsteZahl/2 welches eine wahre Aussage liefert wenn das zweite Argument die kleinste Zahl ist, die in einer Liste der Zahlen (erstes Argument) vorkommt. (1 Punkt)
Zum Beispiel, die folgende Abfrage soll ergeben:
?- kleinsteZahl([1, 2, 3, 4, 5], X).
X = 1. */

kleinsteZahl([Kleinste],Kleinste).			    % wenn kleinstes Element gefunden
kleinsteZahl([H,A|T],Min) :-H =< A,kleinsteZahl([H|T],Min). % wenn H<=A, behalte H und such weiter
kleinsteZahl([H,A|T],Min) :-H > A, kleinsteZahl([A|T],Min). % wenn H>A, nimm A und such weiter

