public class Model {
    private String jsonDataPath = "data.json ";
    
    // Variable de la class
    private JSONArray values;
    private ArrayList<Integer> index;

    // Constructeur pour initialiser la propriété JSONArray
    public Model() {
        values = loadJSONArray(jsonDataPath);
        println("values.size(): "+values.size());
        index = new ArrayList<>();
    }

    public int initAll(){
        index.clear();
        for (int i = 0; i < values.size(); i++) {
            index.add(i);
        }
        return values.size();
    }
    public int initMinXRatio(float ratio){
        index.clear();
        int out = 0;
        for (int i = 0; i < values.size(); i++) {
            JSONObject test = values.getJSONObject(i); 
            if ((test.getInt("asked")-test.getInt("mistakes"))/test.getInt("asked")<= ratio){
                index.add(i);
                out ++;
            }
        }
        return out;
    }

    public int initOnly1Type(String type){
        index.clear();
        int out = 0;
        for (int i = 0; i < values.size(); i++) {
            JSONObject test = values.getJSONObject(i); 
            if (test.getString(type).equals(type)){
                index.add(i);
                out ++;
            }
        }
        return out;
    }

    public JSONObject getObjectOfIndex(int i){
        return values.getJSONObject(index.get(i));
    }
    public void setMistakesOfIndex(int i){
        JSONObject test = values.getJSONObject(index.get(i)); 
        int mistakes = test.getInt("mistakes");
        mistakes ++;
        test.setInt("mistakes", mistakes);
        values.setJSONObject(index.get(i), test);
    }

    public void setAskedOfIndex (int i){
        JSONObject test = values.getJSONObject(index.get(i)); 
        int asked = test.getInt("asked");
        asked ++;
        test.setInt("asked", asked);
        values.setJSONObject(index.get(i), test);
    }

}