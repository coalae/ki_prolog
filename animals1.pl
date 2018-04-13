/* animals program */

/* knowledge basis */
bird(pigeon).
bird(ostrich).
bird(eagle).
flightless(ostrich).

/* add 5 more birds */
bird(swan).
bird(duck).
bird(parrot).
bird(tucan).
bird(penguin).

talkless(pigeon).
talkless(ostrich).
talkless(eagle).
talkless(swan).
talkless(duck).
talkless(penguin).

swimless(pigeon).
swimless(ostrich).
swimless(eagle).
swimless(parrot).
swimless(tucan).

/* rules */
ablefly1(X):-not(flightless(X)),bird(X).

ablefly2(X):-bird(X),\+(flightless(X)).

/* rule for talking birds */
abletalk(X):-bird(X),\+(talkless(X)).

/* rule for swimming birds */
ableswim(X):-bird(X),\+(swimless(X)).



