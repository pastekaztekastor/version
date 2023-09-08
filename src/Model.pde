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
        for (int i = 0; i < values.size(); i++) {
            index.add(i);
        }
    }

    public String getIndexObject(int i, String s){
        JSONObject o = values.getJSONObject(i);
        return o.getString(s);
    }
}