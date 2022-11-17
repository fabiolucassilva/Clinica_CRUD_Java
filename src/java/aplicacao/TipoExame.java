package aplicacao;


public class TipoExame {
    private int id;
    private String descricao;

    public TipoExame(int id, String desc) {
        this.id = id;
        this.descricao = desc;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getDesc() {
        return descricao;
    }
    public void setDesc(String desc) {
        this.descricao = desc;
    }
    
}
