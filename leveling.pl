levelUp(ID) :-
    inventory(ID,Name,Type,MaxHealth,Level,_,Element,Attack,Special,Exp),
    TempLevel is (Level+1),
    (
        (TempLevel == 4; TempLevel == 7)
        -> 
        (
            TempMaxHealth is (MaxHealth*1.5),
            TempHealth is TempMaxHealth,
            TempAttack is (Attack*1.2),
            TempSpecial is (Special*1.2),
            evolve(ID),
            NewID is ID+30,
            retract(inventory(NewID,NewName,Type,MaxHealth,Level,_,Element,Attack,Special,Exp)),
            asserta(inventory(NewID,NewName,Type,TempMaxHealth,TempLevel,TempHealth,Element,TempAttack,TempSpecial,Exp))
        )
        ;
        (
            TempMaxHealth is (MaxHealth*1.5),
            TempHealth is TempMaxHealth,
            TempAttack is (Attack*1.2),
            TempSpecial is (Special*1.2),
            retract(inventory(ID,_,_,_,Level,_,_,_,_,_)),
            asserta(inventory(ID,Name,Type,TempMaxHealth,TempLevel,TempHealth,Element,TempAttack,TempSpecial,Exp))
        )
    ).
    
levelUpEnemy(ID) :-
    enemyTokemon(ID,Name,Type,MaxHealth,Level,_,Element,Attack,Special),
    TempLevel is (Level+1),
    TempMaxHealth is (MaxHealth*1.5),
    TempHealth is TempMaxHealth,
    TempAttack is (Attack*1.2),
    TempSpecial is (Special*1.2),
    retract(enemyTokemon(ID,_,_,_,Level,_,_,_,_)),
    asserta(enemyTokemon(ID,Name,Type,TempMaxHealth,TempLevel,TempHealth,Element,TempAttack,TempSpecial)).

evolve(ID) :-
    inventory(ID,Name,Type,MaxHealth,Level,_,Element,Attack,Special,Exp),
    TempID is (ID + 30),
    tokedex(TempID, TempName, _, _, _, _, _, _),
    TempHealth is MaxHealth,
    retract(inventory(ID,Name,Type,MaxHealth,Level,_,Element,Attack,Special,Exp)),
    asserta(inventory(TempID, TempName, Type, MaxHealth, Level, TempHealth, Element, Attack, Special, Exp)).

markLevelUp(ID,Level,Exp) :-
    Level =:= 1,
    Exp > 100,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 2,
    Exp > 300,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 3,
    Exp > 500,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 4,
    Exp > 700,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 5,
    Exp > 1000,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 6,
    Exp > 1300,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 7,
    Exp > 1600,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 8,
    Exp > 1900,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 9,
    Exp > 2200,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 10,
    Exp > 2500,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Level =:= 11,
    Exp > 2800,
    write('Leveled Up!!!'),nl,
    levelUp(ID),!.

markLevelUp(ID,Level,Exp) :-
    Exp < 2800.