:- dynamic(tokemon/10).      /* Data pokemon di inventory*/
:- dynamic(init/1).          /* Mark game dimulai */

:- include('command.pl').
:- include('player.pl').
:- include('battle.pl').
/* tokemon(ID, Name, Type, MaxHealth, Level, Health, Element, Attack, Special, EXP) */
/* player(username, tokemon) */

title :- 
    write('                                      ,\\                     '),nl,
    write('    _.----.        ____         ,  _\\   ___    ___     ____  '),nl,
    write('_,-        `.    |    |  /`.   \\,-    |   \\  /   |   |    \\  |`.'),nl,
    write('\\      __    \\    -.  | /   `.  ___    |    \\/    |    -.   \\ |  |'),nl,
    write(' \\.    \\ \\   |  __  |  |/    , _  `.  |          | __  |    \\|  |'),nl,
    write('   \\    \\/   /, _`.|      , / / / /   |          , _`.|     |  |'),nl,
    write('    \\     ,-/  /   \\    ,   | \\/ / ,`.|         /  /   \\  |     |'),nl,
    write('     \\    \\ |   \\_/  |   `-.  \\    `  /|  |    ||   \\_/  | |\\    |'),nl,
    write('      \\    \\ \\      /       `-.`.___,- |  |\\  /| \\      /  | |   |'),nl,
    write('       \\    \\ `.__,|  |`-._    `|      |__| \\/ |  `.__,|  | |   |'),nl,
    write('        \\_.-       |__|    `-._ |              -.|     -.| |   |'),nl,
    write('                                `                            -._|'),nl,nl,
    
    write(' ____  _____  _  _  ____  __  __  _____  _  _ '),nl,
    write('(_  _)(  _  )( )/ )( ___)(  \\/  )(  _  )( \\( )'),nl,
    write('  )(   )(_)(  )  (  )__)  )    (  )(_)(  )  ( '),nl,
    write(' (__) (_____)(_)\\_)(____)(_/\\/\\_)(_____)(_)\\_)'),nl,nl,
    write('Gotta catch em all!'),nl,
    write('Hello there! Welcome to the world of Tokemon! My name is Aril!'),nl,
    write('People call me the Tokemon Professor! This world is inhabited by'),nl,
    write('creatures called Tokemon! There are hundreds of Tokemon loose in'),nl,
    write('Labtek 5! You can catch them all to get stronger, but what Im'),nl,
    write('really interested in are the 2 legendary Tokemons, Icanmon dan'),nl,
    write('Sangemon. If you can defeat or capture all those Tokemons I will'),nl,
    write('not kill you.'),nl,nl,
    write('Available commands:'),nl,
    write('     start. -- start the game!'),nl,
    write('     help. -- show available commands'),nl,
    write('     quit. -- quit the game'),nl,
    write('     n. s. e. w. -- move'),nl,
    write('     map. -- look at the map'),nl,
    write('     heal -- cure Tokemon in inventory if in gym center'),nl,
    write('     status. -- show your status'),nl,
    write('     save(Filename). -- save your game'),nl, 
    write('     load(Filename). -- load previously saved game'),nl,
    write('     Legends:'),nl,
    write('       - X = Pagar'),nl,
    write('       - P = Player'),nl, nl.

initFirst :-
    write('We welcome you to Tokemon'), nl,
    write('What is your name, Tokemon trainer?'), nl,
    read(Username),
    write('Hello '), write(Username), nl,
    write('Choose your tokemon!'), nl,
    write('1. bulsabaur'), nl, write('Type: grass'), nl, nl,
    write('2. charamder'), nl, write('Type: fire'), nl, nl,
    write('3. squirtrel'), nl, write('Type: water'), nl, nl,
    write('Insert tokemon: '),
    read(Tokemonawal), nl,
    tokedex(ID,Tokemonawal,_,_,_,_,_,_),
    addTokemon(ID),

    write('Your information, trainer'), nl,
    write('Username: '), write(Username), nl,nl,
    statusInventory,!.

start :- 
    init(_),
    write('Game sudah dimulai'),!.

start :-
    \+init(_),
    title,
    asserta(init(1)),
    initLegendary(100),
    initLegendary(101),
    initFirst,
    initPlayer,!.
