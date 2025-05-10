// O functie care returneaza un closure
function createClosure() {
    // Contextul lexical este in acest caz o simpla variabila number
    let contextLexical = 1;

    // Functia prop
    function closure() {
        console.log(`valore = ${contextLexical}`);

        contextLexical += 1;
    }

    return closure;
}

// Construim un closure
const exemplu1 = createClosure();

exemplu1(); // va afisa pe ecran: $ valoare = 1
exemplu1(); // $ valoare = 2
exemplu1(); // $ valoare = 3

// Construim un alt closure, cu stare diferita de primul.
const exemplu2 = createClosure();

exemplu2(); // $ valoare = 1
