%GRUPOS
%HECHOS

grupo(ateez).
grupo(stray_kids).
grupo(santos_bravos).
grupo(linkin_park).
grupo(three_days_grace).
grupo(breaking_benjamin).
 
%CANCIONES
%RELACION

cancion_de(bad, ateez).
cancion_de(bouncy, ateez).
cancion_de(guerrilla, ateez).

cancion_de(half_of_fame, stray_kids).
cancion_de(maniac, stray_kids).
cancion_de(miroh, stray_kids).

cancion_de(cero_por_ciento, santos_bravos).
cancion_de(kawasaki, santos_bravos).
cancion_de(velocidad, santos_bravos).

cancion_de(forgotten, linkin_park).
cancion_de(papercut, linkin_park).
cancion_de(numb, linkin_park).

cancion_de(animal_i_have_become, three_days_grace).
cancion_de(i_hate_everything_about_you, three_days_grace).
cancion_de(never_too_late, three_days_grace).

cancion_de(the_diary_of_jane, breaking_benjamin).
cancion_de(breath, breaking_benjamin).
cancion_de(i_will_not_bow, breaking_benjamin).

% GENEROS

genero(bad, kpop).
genero(bouncy, kpop).
genero(guerrilla, kpop).
genero(half_of_fame, kpop).
genero(maniac, kpop).
genero(miroh, kpop).

genero(cero_por_ciento, pop_latino).
genero(kawasaki, pop_latino).
genero(velocidad, pop_latino).

genero(forgotten, rock_alternativo).
genero(papercut, rock_alternativo).
genero(numb, rock_alternativo).
genero(animal_i_have_become, rock_alternativo).
genero(i_hate_everything_about_you, rock_alternativo).
genero(never_too_late, rock_alternativo).
genero(the_diary_of_jane, rock_alternativo).
genero(breath, rock_alternativo).
genero(i_will_not_bow, rock_alternativo).

% REGLAS

cancion_kpop(Cancion) :- genero(Cancion, kpop).

%AND 

cancion_bonitas(Cancion) :-
	genero(Cancion, pop_latino),
	cancion_de(Cancion, santos_bravos).
	
cancion_recomendada(Cancion) :-
    genero(Cancion, kpop),
    cancion_de(Cancion, ateez).
	
cancion_oscura(Cancion) :-
    genero(Cancion, rock_alternativo),
    cancion_de(Cancion, three_days_grace).

cancion_pesada(Cancion):-
	genero(Cancion, rock_alternativo),
	cancion_de(Cancion, linkin_park).
	
%AND_OR
canciones_cantar(Cancion) :- genero(Cancion, rock_alternativo),
(cancion_de(Cancion, three_days_grace); cancion_de(Cancion, breaking_benjamin)).

%regla_compuesta

canciones_chidas(Cancion):- 
	cancion_oscura(Cancion);
	cancion_pesada(Cancion).
	
canciones_wow(Cancion) :-
	cancion_bonitas(Cancion);
	cancion_recomendada(Cancion).

%Jerarquia

subgenero_de(kpop, pop_asiatico).
subgenero_de(pop_latino, pop_latino).
subgenero_de(rock_alternativo, rock).

subgenero_de(pop_asiatico, musica).
subgenero_de(pop_latino, musica).
subgenero_de(rock, musica).

