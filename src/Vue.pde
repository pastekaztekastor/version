/*
 _   _                                                                 
| | | |                                                                
| | | |_   _  ___                                                      
| | | | | | |/ _ \                                                     
\ \_/ / |_| |  __/                                                     
 \___/ \__,_|\___|                                                     
                                                                       
*/
public class Vue {
    Controler controler;

    // Define 
    private int sizeTypoH1 = 50;
    private int sizeTypoH2 = 30;
    private int sizeTypoH3 = 10;
    private int delta_H1   = 40;
    private int delta_H2   = 15;
    private int delta_box  = 15;
    private int size_BtnNext = 20;
    private int delta_XBtnValidate = 60;
    private int alphaMouseOver = 50;

    private color colorClearLight        = color(241, 222, 222);     // Misty Rose
    private color colorClearEmphasis     = color(254, 147, 140);     // Congo Pink
    private color colorClearDark         = color(13, 2, 33);         // Xiketic
    private color colorClearHighlight    = color(108, 212, 255);     // Baby blue
    private color colorAlpha             = color(0, 0, 0, 0);        // Alpha

    // Variable 
    private ViewType view;
    private PVector pos_Midle;
    private PVector pos_subTitle;
    private PVector pos_BR;
    private PVector pos_Title;
    private PVector pos_TitlePage;
    private PVector pos_Question;
    private PVector pos_Answer1;
    private PVector pos_Answer2;
    private PVector pos_BtnNext;
    private PVector size_ModeSelector;
    private String titlePage;
    private int x,y;
    private int practiceStep;

    public Vue () {
	    controler = new Controler();
        this.view = ViewType.HomePage;
        resize(width, height);
        x = 0;
        y = 0;
        practiceStep = 0;
    }

    public void resize(int w, int h){
        this.pos_BR             = new PVector(w, h);
        this.pos_Midle          = new PVector(w/2, h/2);
        this.pos_Title          = new PVector(w/2, h/2);
        this.size_ModeSelector  = new PVector(w/2, h/4);
        this.pos_TitlePage      = new PVector(w/2, h/15);
        this.pos_Question       = new PVector(w/2, 5*h/15);
        this.pos_Answer1        = new PVector(w/2, 7*h/15);
        this.pos_Answer2        = new PVector(w/2, 8*h/15);
        this.pos_BtnNext        = new PVector(w/2, 13*h/15);
    }

    public void loadVue(ViewType view){
        this.view = view; 
        if (view == ViewType.InfiniteMode || view == ViewType.TimedMode || view == ViewType.MistakeWork || view == ViewType.AllWordsOnce){
            controler.initIndexModel(view);
            controler.nextElementsTest(view);
            controler.getTest();
        }
        if (view == ViewType.SelectMode){
            practiceStep = 0;
        }
    }

/*                                                                     
 _   _                 _                     _ _                       
| | | |               | |                   | | |                      
| | | |___  ___ _ __  | |__   __ _ _ __   __| | | ___ _ __             
| | | / __|/ _ \ '__| | '_ \ / _` | '_ \ / _` | |/ _ \ '__|            
| |_| \__ \  __/ |    | | | | (_| | | | | (_| | |  __/ |               
 \___/|___/\___|_|    |_| |_|\__,_|_| |_|\__,_|_|\___|_|               
                                                                       
*/
    public void userInput(char input){
        println("view: "+view);

        switch (view) {
            case HomePage : 
                loadVue(ViewType.SelectMode);
                break;
            case SelectMode :
                char lowerInput = Character.toLowerCase(input); // Convertir en minuscules
                println("input: "+lowerInput);
                switch (lowerInput) {
                    default :
                    case 'e' : 
                        loadVue(ViewType.InfiniteMode);
                        break;
                    case 'c' : 
                        loadVue(ViewType.TimedMode);
                        break;
                    case 'r' : 
                        loadVue(ViewType.MistakeWork);
                        break;
                    case 't' : 
                        loadVue(ViewType.AllWordsOnce);
                        break;
                }
                break; 
            case InfiniteMode : 
                switch (input) {
                    default :
                        loadVue(ViewType.SelectMode);                     
                        break;
                }
                break;
            case TimedMode : 
                switch (input) {
                    default :
                        loadVue(ViewType.SelectMode);                     
                        break;
                }
                break;
            case MistakeWork : 
                switch (input) {
                    default :
                        loadVue(ViewType.SelectMode);                     
                        break;
                }
                break;
            case AllWordsOnce : 
                switch (input) {
                    default :
                        loadVue(ViewType.SelectMode);                     
                        break;
                }
                break;
        }
    }

    public void userMouseReleased(int x, int y){
        this.x = x;
        this.y = y;
    }

    public void userMouseClicked(int x, int y){
        switch (view){
            case SelectMode :
                int p = 0;
                if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
                    x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
                    y > size_ModeSelector.y * p + delta_box &&
                    y < size_ModeSelector.y * (p+1) -delta_box)
                {
                    loadVue(ViewType.InfiniteMode);
                }
                p = 1;
                if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
                    x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
                    y > size_ModeSelector.y * p + delta_box &&
                    y < size_ModeSelector.y * (p+1) -delta_box)
                {
                    loadVue(ViewType.TimedMode);
                }
                p = 2;
                if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
                    x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
                    y > size_ModeSelector.y * p + delta_box &&
                    y < size_ModeSelector.y * (p+1) -delta_box)
                {
                    loadVue(ViewType.MistakeWork);
                }
                p = 3;
                if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
                    x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
                    y > size_ModeSelector.y * p + delta_box &&
                    y < size_ModeSelector.y * (p+1) -delta_box)
                {
                    loadVue(ViewType.AllWordsOnce);
                }
                break;
            case InfiniteMode :
                PVector TL = new PVector(pos_BtnNext.x - size_BtnNext, pos_BtnNext.y - size_BtnNext);
                PVector BR = new PVector(pos_BtnNext.x + size_BtnNext, pos_BtnNext.y + size_BtnNext);

                if (x > TL.x &&
                    x < BR.x &&
                    y > TL.y &&
                    y < BR.y &&
                    practiceStep <= 1) 
                {
                    nextStepComute();
                }
                if (practiceStep == 2) {
                    PVector TLa = new PVector(pos_BtnNext.x - size_BtnNext - delta_XBtnValidate, pos_BtnNext.y - size_BtnNext);
                    PVector BRa = new PVector(pos_BtnNext.x + size_BtnNext - delta_XBtnValidate, pos_BtnNext.y + size_BtnNext);

                    if (x > TLa.x &&
                        x < BRa.x &&
                        y > TLa.y &&
                        y < BRa.y)
                    {
                        controler.testSuccec();
                        controler.nextElementsTest(view);
                        controler.getTest();
                        nextStepComute();
                    }
                    // NO Fail
                    PVector TLb = new PVector(pos_BtnNext.x - size_BtnNext + delta_XBtnValidate, pos_BtnNext.y - size_BtnNext);
                    PVector BRb = new PVector(pos_BtnNext.x + size_BtnNext + delta_XBtnValidate, pos_BtnNext.y + size_BtnNext);
                    if (x > TLb.x &&
                        x < BRb.x &&
                        y > TLb.y &&
                        y < BRb.y) 
                    {
                        controler.testFail();
                        controler.nextElementsTest(view);
                        controler.getTest();
                        nextStepComute();
                    }
                }
                break;
        }
    }
/*                                                                     
______                       __                  _   _                 
|  _  \                     / _|                | | (_)                
| | | |_ __ __ ___      __ | |_ _   _ _ __   ___| |_ _  ___  _ __  ___ 
| | | | '__/ _` \ \ /\ / / |  _| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
| |/ /| | | (_| |\ V  V /  | | | |_| | | | | (__| |_| | (_) | | | \__ \
|___/ |_|  \__,_| \_/\_/   |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/

*/                                                                      
    public void drawVue() {
        drawBackGround();
        switch (view) {
            case HomePage : 
                drawHomePage();
                break;
            case SelectMode : 
                drawSelectModePage();
                break;
            case TimedMode : 
                drawTimer(); 
            case MistakeWork : 
            case AllWordsOnce : 
                break;
            case InfiniteMode : 
                drawTitlePage("Entrainement");
                drawBackwardButton();
                if (practiceStep >= 0) {
                    drawQuestion(controler.getQuestion());
                }
                if (practiceStep >= 1) {
                    drawAnswer1(controler.getAnswer1());
                }
                if (practiceStep >= 2) {
                    drawAnswer2(controler.getAnswer2());
                    drawFinalStepButton();
                }
                if (practiceStep < 2)
                    drawNextStepButton();
                break;
        }
    }

    private void drawHomePage(){
        // Draw the title
        textSize(sizeTypoH1);
        textAlign(CENTER, CENTER);
        fill(colorClearEmphasis);
        text("Version", pos_Title.x, pos_Title.y);
        
        // Draw the sub title 
        textSize(sizeTypoH3);
        textAlign(CENTER, CENTER);
        fill(colorClearDark);
        text("Press the space bar", pos_Title.x, pos_Title.y+delta_H1);

        // Draw the Rectangles 
        rectMode(CENTER);
        fill(colorClearHighlight, 0);
        stroke(colorClearHighlight);
        strokeWeight(3);
        rect(pos_Midle.x, pos_Midle.y, pos_BR.x*0.9, pos_BR.y*0.9);
    }

    private void drawSelectModePage(){
        // On doit afficher les 4 options
        rectMode(CENTER);
        strokeWeight(3);
        textAlign(CENTER, CENTER);
        stroke(colorClearHighlight);
        // TODO factoriser
        // Entrainement
        int p = 0;
        fill(colorClearEmphasis);
        textSize(sizeTypoH2);
        text("Entrainement", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p - delta_H2);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Fait défilé tous les mot en aléatoire, pas de fin", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p + delta_H2);
        if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
            x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
            y > size_ModeSelector.y * p + delta_box &&
            y < size_ModeSelector.y * (p+1) -delta_box){
                fill(colorClearHighlight,alphaMouseOver);
        }
        else {
            fill(colorClearHighlight,0);
        }
        rect(width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p, size_ModeSelector.x-delta_box, size_ModeSelector.y-delta_box);
        
        // Contre la montre
        p = 1;
        fill(colorClearEmphasis);
        textSize(sizeTypoH2);
        text("Contre la montre", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p - delta_H2);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Réussire le plus mots dans un temps imparti", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p + delta_H2);
        if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
            x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
            y > size_ModeSelector.y * p + delta_box &&
            y < size_ModeSelector.y * (p+1) -delta_box){
                fill(colorClearHighlight,alphaMouseOver);
        }
        else {
            fill(colorClearHighlight,0);
        }
        rect(width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p, size_ModeSelector.x-delta_box, size_ModeSelector.y-delta_box);
        
        // Révisions
        p = 2;
        fill(colorClearEmphasis);
        textSize(sizeTypoH2);
        text("Révision", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p - delta_H2);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Ne propose que les mots les moins réussi", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p + delta_H2);
        if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
            x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
            y > size_ModeSelector.y * p + delta_box &&
            y < size_ModeSelector.y * (p+1) -delta_box){
                fill(colorClearHighlight,alphaMouseOver);
        }
        else {
            fill(colorClearHighlight,0);
        }
        rect(width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p, size_ModeSelector.x-delta_box, size_ModeSelector.y-delta_box);
       
        // Tous les mots
        p = 3;
        fill(colorClearEmphasis);
        textSize(sizeTypoH2);
        text("Tous les mots", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p - delta_H2);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Fait défilé tous les mots en aléatoire une fois", width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p + delta_H2);
        if (x > width/2 - (size_ModeSelector.x - delta_box) / 2 &&
            x < width/2 + (size_ModeSelector.x - delta_box) / 2 &&
            y > size_ModeSelector.y * p + delta_box &&
            y < size_ModeSelector.y * (p+1) -delta_box){
                fill(colorClearHighlight,alphaMouseOver);
        }
        else {
            fill(colorClearHighlight,0);
        }
        rect(width/2, size_ModeSelector.y/2 + size_ModeSelector.y * p, size_ModeSelector.x-delta_box, size_ModeSelector.y-delta_box);
    }

    private void drawBackGround(){
        background(colorClearLight);
    }

    private void drawTitlePage(String s){
        textSize(sizeTypoH1);
        textAlign(CENTER, CENTER);
        fill(colorClearEmphasis);
        text(s, pos_TitlePage.x, pos_TitlePage.y);
    }

    private void drawQuestion(String s){
        textSize(sizeTypoH2);
        textAlign(CENTER, CENTER);
        fill(colorClearHighlight);
        text(s, pos_Question.x, pos_Question.y);
    }

    private void drawAnswer1(String s){
        textSize(sizeTypoH2);
        textAlign(CENTER, CENTER);
        fill(colorClearDark);
        text(s, pos_Answer1.x, pos_Answer1.y);
    }

    private void drawAnswer2(String s){
        textSize(sizeTypoH2);
        textAlign(CENTER, CENTER);
        fill(colorClearDark);
        text(s, pos_Answer2.x, pos_Answer2.y);
    }

    private void drawNextStepButton(){ 
        PVector TL = new PVector(pos_BtnNext.x - size_BtnNext, pos_BtnNext.y - size_BtnNext);
        PVector BR = new PVector(pos_BtnNext.x + size_BtnNext, pos_BtnNext.y + size_BtnNext);

        stroke(colorClearDark);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Next", pos_BtnNext.x, pos_BtnNext.y);
        if (x > TL.x &&
            x < BR.x &&
            y > TL.y &&
            y < BR.y) {
                fill(colorClearDark,alphaMouseOver);
        }
        else {
            fill(colorClearDark,0);
        }
        rect(pos_BtnNext.x, pos_BtnNext.y, 2*size_BtnNext, 2* size_BtnNext);
    }
    private void drawFinalStepButton(){
        // YES Succec
        PVector TLa = new PVector(pos_BtnNext.x - size_BtnNext - delta_XBtnValidate, pos_BtnNext.y - size_BtnNext);
        PVector BRa = new PVector(pos_BtnNext.x + size_BtnNext - delta_XBtnValidate, pos_BtnNext.y + size_BtnNext);

        stroke(colorClearDark);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Yes", pos_BtnNext.x - delta_XBtnValidate, pos_BtnNext.y);
        if (x > TLa.x &&
            x < BRa.x &&
            y > TLa.y &&
            y < BRa.y) {
                fill(colorClearDark,alphaMouseOver);
        }
        else {
            fill(colorClearDark,0);
        }
        rect(pos_BtnNext.x - delta_XBtnValidate, pos_BtnNext.y, 2*size_BtnNext, 2* size_BtnNext);

        // NO Fail
        PVector TLb = new PVector(pos_BtnNext.x - size_BtnNext + delta_XBtnValidate, pos_BtnNext.y - size_BtnNext);
        PVector BRb = new PVector(pos_BtnNext.x + size_BtnNext + delta_XBtnValidate, pos_BtnNext.y + size_BtnNext);

        stroke(colorClearDark);
        fill(colorClearDark);
        textSize(sizeTypoH3);
        text("Yes", pos_BtnNext.x + delta_XBtnValidate, pos_BtnNext.y);
        if (x > TLb.x &&
            x < BRb.x &&
            y > TLb.y &&
            y < BRb.y) {
                fill(colorClearDark,alphaMouseOver);
        }
        else {
            fill(colorClearDark,0);
        }
        rect(pos_BtnNext.x + delta_XBtnValidate, pos_BtnNext.y, 2*size_BtnNext, 2* size_BtnNext);
    }
    private void drawBackwardButton(){
        // TODO drawBackwardButton
    }
    private void drawTimer(){
        // TODO drawTimer
    }

    private void nextStepComute(){
        practiceStep = (practiceStep+1)%3;
    }
}
