/* Lykkehjulet                                 */
//I opgaven skal jeg se hvad der mangler og tilføje det!
//Jeg vil gerne tilføje nogle flere ord man kan gætte på og en win screen med "du vandt" også skal man kunne se hvor mange gæt man har brugt
// Har også beskrevet de fleste steder hvor word er hvad det gør

//Her opretter vi stringen "WORD" 
String word; // Hemmeligt ord
int attempts; // Antal forsøg
String category = "DANSK BY"; // Kategori
// Mulige hemmelige ord
String[] words = {"København", "Aarhus",
  "Odense", "Aalborg", "Esbjerg",
  "Horsens", "Svendborg", "Stenstrup", "Køge"}; 
// Status på spillet i et array
boolean[] guessed;

/* Viser vinduet og sætter ordet */
void setup() {
  // Vælg et tilfældigt ord som skal gættes.
  
  //Word bliver sat til et tilfældigt ord fra vores array "words" Det er altså her vi finder ordet og den er i setup fordi ellers ville den finde nye ord hele tiden
  word = words[int(random(words.length))];
  guessed = new boolean[word.length()];
  size(800, 450); // Vis vinduet
  textSize(36); // Bogstavernes størrelse
}

/* Opdaterer skærmen */
void draw() {
  background(200, 200, 255); // Nulstiller 
  textAlign(LEFT); // Venstrestil kategorien
  text(category, 105, 100); // Viser kategorien
  textAlign(CENTER); // Centrer i hver kasse
  char letter; // Bogstav i iteration af ord
  // Løb igennem alle bogstaver i ordet
  for (int i = 0; i < word.length(); i++) {
    // Sæt bogstavet ind i en firkant.
    fill(0, 0, 0); // Sort skrift
    if (guessed[i]) {
      //Her sætter den bogstavet til ordet efter hvor selve bogstavet er, håber det gav mening
      letter = word.charAt(i);
    } else {
      letter = 20;
    }
    text(letter, 125 + i*50, 200);
    noFill(); // Tomme kasser
    rect(105 + i*50, 200 - 35, 45, 45);
    text("Gæt: " + attempts, 505, 100);
  }
  
  /*
  Her prøvede jeg at lave en vandt screen, men det gik ikke så godt og der kom fejl som drillede mig meget...
  
  int j = word.length();
  if (guessed[j]) {
    background(0,255,0);
    text("DU VANDT", width/2,height/2);
  }
  */
}

/* Gætter på et bogstav */
void keyPressed() {
  char letter;
  for (int i = 0; i < word.length(); i++) {
    //ser in bogstavet er i ordet
    letter = word.substring(i, i+1).toLowerCase()
      .charAt(0);
    // Undersøg for hvert tegn om det er gættet
    if (letter == key) guessed[i] = true; //<>//
  }
  //Tilføjer til attempts. Lige nu tilføjer den dog hver gang man trykker, selvom man har trykket på tasten før
  //havde lavet det lidt bedre før, men er på tidspres fordi kom til at slette det hele ;/
  attempts++;
}
