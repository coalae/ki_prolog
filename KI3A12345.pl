/* AUFGABE 1.a.: Pr�dikat vereinigen/3 welches zwei Listen kombiniert und als eine neue Liste wiedergibt.
 *  Diese Aussagen sollen wahr ergeben bei Query:
 * ?- vereinigen([a, b], [c, d], [a, b, c, d]).
 * ?- vereinigen([a, b, c], [d, e], [a, b, c, d, e]).
 * ?- vereinigen(A,B,C). (als zus�tzlicher Testfall, an dem man sieht,
 * dass die Listen in den ersten beiden Argumenten vereinigt wurden)
 * TEST CHECK DES vereinigen/3-PR�DIKATS SIEHE BEIGEF�GTE SCREENSHOTS
 * Notation:
 * H ... Head, T1 ... Tail1,  T2 ... Tail2, T3 ... Tail3, L2 ... zweite Liste */

erste(A):- =(A,[a, b]).
zweite(B):- =(B,[c,d]).
dritte(C):- =(C,[a,b,c,d]).

vereinigen([], Liste, Liste).
vereinigen([H|T1], L2, [H|T3]):-vereinigen(T1, L2, T3).

/* AUFGABE 1.b.: Pr�dikat entfernen/3 welches ein beliebiges Element (erstes Argument) aus einer Liste (zweites Argument) entfernt und die restliche Liste (drittes Argument) liefert.
Zum Beispiel, die folgenden Abfragen sollen wahre Aussagen ergeben:
?- entfernen(a, [a, b, c], [b, c]).
?- entfernen(c, [a, b, c, c], [a, b, c]).
TEST CHECK DES entfernen/3-PR�DIKATS SIEHE BEIGEF�GTE SCREENSHOTS */

entfernen(ZuEntfernendesElement, [ZuEntfernendesElement|Restliste], Restliste).
entfernen(ZuEntfernendesElement, [Element | Restliste], [Element | Restliste_Tail]):-entfernen(ZuEntfernendesElement, Restliste, Restliste_Tail).


/* AUFGABE 1.c.: Pr�dikat einfuegen/3 welches ein beliebiges Element (erstes Argument) zu einer Liste (zweites Argument) hinzuf�gt und eine neue Liste (drittes Argument) liefert, welche das hinzugef�gte Element enth�lt.
Zum Beispiel, die folgenden Abfragen sollen wahre Aussagen ergeben:
?- einfuegen(a, [b, c], [a, b, c]).
?- einfuegen(a, [a, b, c], [a, a, b, c]).
--> Anmerkung: lt. Queries oben sollte das neue Element (a in den
Testf�llen) am Anfang der neuen Liste eingesetzt werden)
TEST CHECK DES einfuegen/3-PR�DIKATS SIEHE BEIGEF�GTE SCREENSHOTS */

einfuegen(EinzufuegendesElement, OhneEinfuegung, MitEinfuegung):- entfernen(EinzufuegendesElement, MitEinfuegung, OhneEinfuegung).

/* AUFGABE 1.d.: Pr�dikat permutation/2 wobei das erste Argument eine Permutation vom zweiten Argument ist.
Zum Beispiel, die folgende Abfrage soll eine wahre Aussage ergeben:
?- permutation([a, b], [b, a]).
Testen Sie die folgende Abfrage:
?- permutation([a, b, c, d, e, f, g, h, i , j ,k ,l], X).
Wieviele Ergebnisse f�r X erwarten/bekommen Sie? --> Ich erwarte f�r X
12! (=12*11*10*9*8*7*6*5*4*3*2*1 = 479001600)Ergebnisse. Im beigef�gten
Screentshot wird ein Ausschnitt der L�sungsmenge gezeigt (Es k�nnen
aufgrund der Vielzahl nicht alle aufgelistet werden.)
Als WEITEREN TESTFALL habe ich Folgendes getestet:
?-permutation([a,b,c,d],X).
--> Diese Permutation gibt 4! (=4*3*2*1 = 24) L�sungsm�glichkeiten aus.
Die Auswertung der Anfrage ist anbei als Screenshot. Am Ende
steht "false", da es nach diesen 24 M�glichkeiten keine
weiteren M�glichkeiten mehr gibt.
Notation:
H...Head, T...Tail
TEST CHECK DES permutation/2-PR�DIKATS SIEHE BEIGEF�GTE 2 SCREENSHOTS */

permutation([], []).
permutation([H|T], Permutiert):-permutation(T,PermutiertT),einfuegen(H, PermutiertT, Permutiert).

/* AUFGABE 2: Definieren Sie ein Pr�dikat setzAmEnde(X, AlteListe, NeueListe) welches eine Liste NeueListe liefert wobei das Objekt X am Ende der Liste AlteListe hinzugef�gt wird.
eigene Testabfragen:
?- setzAmEnde(albert, [ali, aylin, alvin, ava], [ali, aylin, alvin,
ava,albert]).
--> AUSWERTUNG der Anfrage: TRUE.
?- setzAmEnde(X, [ben, carl, dora], [ben, carl, dora, emilia]).
--> AUSWERTUNG der Anfrage: X=emilia.
TEST CHECKS SIEHE BEIGEF�GTE SCREENSHOTS. */

setzAmEnde(X,[],[X]).
setzAmEnde(X,[Head|Tail],[Head|NeueListe]) :- setzAmEnde(X,Tail,NeueListe).

/* AUFGABE 3: Definieren Sie ein Pr�dikat letztes(Mitglied, Liste) welches eine wahre Aussage liefert wenn Mitglied das letzte Element der Liste ist.
eigene Testabfragen:
?- letztes(fiona,[geraldine, hanna, inna, fiona]).
?- letztes(X,[jara, kara, mara, sara]).
Notation: H...Head, T...Tail.
TEST CHECKS SIEHE BEIGEF�GTE SCREENSHOTS. */

letztes(Mitglied,[Mitglied]).
letztes(Mitglied,[H|T]):-letztes(Mitglied,T).

/* AUFGABE 4: Lesen Sie die SWI Prolog Dokumentation �ber den Operator is indem Sie die folgende Abfrage machen:
?- help(is).
Erkl�ren Sie kurz was dieser Operator macht. */

/* L�SUNG: (Ausf�hrung siehe Screenshot im Anhang)
 *  Der Operator "is" hat die Stelligkeit 2, daher schreibt man auch
 *  is/2. Er wird laut Dokumentation angegeben als "-Number is
 *  +Expression", also z.B. 3 is 1+2 w�rde TRUE ergeben. Die umgekehrte
 *  Formulierung von 1+2 is 3, also "Expression is Number", w�re nicht
 *  m�glich, und die Abfragen w�rde FALSE ergeben. Er ergibt "TRUE" wenn
 *  die Number dem Wert der Expression entspricht. Eine Auswertung von
 *  Abfragen w�re auch in dieser Form m�glich: ?- is(X,+(1,2)). Diese
 *  Abfrage w�rde X=3 ergeben. Die Form ist hier also is(Number,
 *  Expression). Der Operator sollte nicht mit Operator =:=, der ein
 *  Vergleichsoperator ist, verwechselt werden
 *  Zus�tzliche verwendete Quelle:
 *  http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse19
 */

/* AUFGABE 5: Definieren Sie ein Pr�dikat kleinsteZahl/2 welches eine wahre Aussage liefert wenn das zweite Argument die kleinste Zahl ist, die in einer Liste der Zahlen (erstes Argument) vorkommt. (1 Punkt)
Zum Beispiel, die folgende Abfrage soll ergeben:
?- kleinsteZahl([1, 2, 3, 4, 5], X).
X = 1. */

kleinsteZahl([Kleinste],Kleinste).			    % wenn kleinstes Element gefunden
kleinsteZahl([H,A|T],Min) :-H =< A,kleinsteZahl([H|T],Min). % wenn H<=A, behalte H und such weiter
kleinsteZahl([H,A|T],Min) :-H > A, kleinsteZahl([A|T],Min). % wenn H>A, nimm A und such weiter

