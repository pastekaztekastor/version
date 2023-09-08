static enum ViewType {
    HomePage,
	SelectMode,
    InfiniteMode, // Entrainement
    TimedMode,    // Contre la montre
    MistakeWork,  // Révisions
    AllWordsOnce, // Tous les mots
    ListEditing,
    WordEditing,
    Score
}

Vue vue;

void setup() {
	size(500,500);
	vue = new Vue();
}

void draw() {
	vue.drawVue();
}

void keyPressed() {
  	vue.userInput(key);
}

void mouseMoved() {
	vue.userMouseReleased(mouseX, mouseY);
}

void mouseClicked() {
	vue.userMouseClicked(mouseX, mouseY);
}


/*
int currentIndex = 0;
ArrayList<Mot> mots = new ArrayList<>();

void setup() {
  size(400, 200);
  textSize(24);
	int nbLoad =0;
  // Charger le contenu du fichier data.txt
	String[] lines;
  lines = loadStrings("data.txt");
	for(int i = 0; i ++ ; i < lines.length){
		String[] parts = split(lines[i], '/');
		if (parts.length == 4) {
      String a = parts[0];
      String b = parts[1];
      String c = parts[2];
			String d = parts[3];
		}
		Mot m = new Mot(a,b,c,int(d));
		mots.add(m);
	}
}

void draw() {
  background(255);
  fill(0);
  switch (stat) {
		case 3 :
			// Cas 3 - On indique le score 
		case 2 :
			// Cas 2 - On affiche la 2 em réponse
		case 1 :
			// Cas 1 - On affiche la 1 er réponse
		case 0 :
			// Cas 0 - On pose la question
			text(mots.get(currentIndex).getA, )
	}
}

void keyPressed() {
	// On passe de 0->1->2
  if (key == ' ' && stat < 3) {
		stat = (stat+1)%4;
  }

	if (stat == 2){
		if (keyCode == LEFT){
			// je ne me suis pas trompé on change juste le
		}
		if (keyCode == RIGHT){
			// Je me suis trompé 
		}
	}
}

public class Mot {
	String a;
	String b;
	String c;
	int d;

	public Mot (String a, String b, String c, int d) {
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
	}

	String getA(){return a;}
	String getB(){return b;}
	String getC(){return c;}
	int getD(){return d;}

	void succes(){d++;}
	void fail(){d--;}
}

*/