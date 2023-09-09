public class Controler {
    private Model model;    

    private int tempStart;
    private int tempStop;
    private int score;
    private int wordPassed;
    private int sizeModel;

    private int nextIndex = 0;

    private JSONObject test;


    public Controler () {
	    model = new Model();
    }
    public int initIndexModel(ViewType view){
        switch (view){
            default :
            case InfiniteMode :
            case TimedMode :
            case AllWordsOnce :
                sizeModel = model.initAll();
                break;
            case MistakeWork :
                sizeModel = model.initMinXRatio(0.25);
                break;
        }
        return sizeModel;
    }

    public void nextElementsTest(ViewType view){
        switch (view){
            default :
            case InfiniteMode :
            case TimedMode :
            case MistakeWork :
                nextIndex = int(random(0, sizeModel));
                break;
            case AllWordsOnce :
                nextIndex ++;
                break;
        }
    }
    public void getTest(){
        test = model.getObjectOfIndex(nextIndex);
        model.setAskedOfIndex(nextIndex);
    }

    public String getQuestion(){
        return test.getString("question");
    }
    public String getAnswer1(){
        return test.getString("latinComplet");
    }
    public String getAnswer2(){
        return test.getString("translation");
    }
    public int getNextIndex() {
        return nextIndex;
    }
    public void testSuccec(){
        
    }
    public void testFail(){
        model.setMistakesOfIndex(nextIndex);
    }
}
