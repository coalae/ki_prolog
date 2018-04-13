/* male/1 and female/1 predicates */
female(marlies).
female(cordula).
female(maya).
female(marta).
female(dinya).
female(gitta).
female(hilda).
female(leonora).
female(roma).
female(regina).
female(anne).
female(marielis).
female(karoline).
female(steffi).
female(nadja).
female(diana).
female(ingrid).

male(aleksandar).
male(ali).
male(alphi).
male(bert).
male(lino).
male(harald).
male(lars).
male(harri).
male(thomas).
male(julius).
male(oscar).
male(roland).
male(leonard).
male(lothar).
male(gerhard).
male(hannes).

/* child/2 (child(X,Y) ... X is child of Y) */
child(regina,leonora).
child(regina,lars).
child(nadja,ingrid).
child(nadja,oscar).
child(thomas,ingrid).
child(thomas,oscar).
child(bert,karoline).
child(bert,gerhard).
child(maya,karoline).
child(maya,gerhard).
child(aleksandar,karoline).
child(aleksandar,gerhard).
child(gitta,hilda).
child(gitta,lothar).
child(marlies,hilda).
child(marlies,lothar).
child(cordula,marlies).
child(cordula,aleksandar).
child(alphi,marlies).
child(alphi,aleksandar).
child(ali,marlies).
child(ali,aleksandar).
child(dinya,maya).
child(dinya,hannes).
child(lino,marta).
child(lino,bert).
child(roma,gitta).
child(roma,gitta).
child(julius,steffi).
child(julius,thomas).
child(leonard,roland).
child(leonard,nadja).
child(diana,roland).
child(diana,nadja).
child(anne,regina).
child(anne,harri).
child(marielis,regina).
child(marielis,harri).

/* friend(X,Y) ... X is friend of Y */
friend(aleksandar,thomas).
friend(aleksandar,steffi).
friend(aleksandar,roland).
friend(aleksandar,nadja).
friend(marlies,thomas).
friend(marlies,steffi).
friend(marlies,roland).
friend(marlies,nadja).
friend(bert,thomas).
friend(bert,steffi).
friend(bert,roland).
friend(bert,nadja).
friend(marta,thomas).
friend(marta,thomas).
friend(marta,roland).
friend(marta,nadja).
friend(maya,thomas).
friend(maya,steffi).
friend(maya,roland).
friend(maya,nadja).
friend(gitta,thomas).
friend(gitta,steffi).
friend(gitta,roland).
friend(gitta,nadja).
friend(harald,thomas).
friend(harald,steffi).
friend(harald,roland).
friend(harald,nadja).
friend(regina,thomas).
friend(regina,steffi).
friend(regina,roland).
friend(regina,nadja).

/* mother(X,Y) ... X is mother of Y */
mother(X,Y):-child(Y,X),female(X).

/* father(X,Y) ... X is father of Y */
father(X,Y):-child(Y,X),male(X).

/* sister(X,Y) ... X is sister of Y */
sister(X,Y):-child(X,A), child(Y,A), female(A), child(X,B), child(Y,B), male(B), female(X),X\==Y.

/* brother(X,Y) ... X is brother of Y */
brother(X,Y):-child(X,A), child(Y,A), female(A), child(X,B), child(Y,B), male(B), male(X),X\==Y.

/* uncle(X,Y) ... X is uncle of Y */
uncle(X,Y):-brother(X,Z),child(Y,Z).

/* aunt(X,Y) ... X is aunt of Y */
aunt(X,Y):-sister(X,Z),child(Y,Z).

/* ERWEITERUNG, sodass auch entfernte vorfahren direkter linien (z.b. grossvater und grossmutter erfasst werden koennen bei relative praedikat: descendant(X,Y) ... X is a direct-line descendant of Y) */
descendant(X,Y):-child(X,Y).
descendant(A,C):-child(A,B),descendant(B,C).

/* relative(X,Y) ... X is relative of Y */
relative(X,Y):-brother(X,Y);brother(Y,X);sister(X,Y);sister(Y,X);uncle(X,Y);uncle(Y,X);aunt(X,Y);aunt(Y,X);descendant(X,Y);descendant(Y,X).

/* acquaintance(X,Y) ... X is acquaintance of Y */
acquaintance(X,Y):-relative(X,Y);friend(X,Y);friend(Y,X).
acquaintance(A,C):-(relative(A,B);friend(A,B);friend(B,A)),acquaintance(B,C),A\==C.








