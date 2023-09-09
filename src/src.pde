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

void mousePressed() {
	vue.userMouseClicked(mouseX, mouseY);
}