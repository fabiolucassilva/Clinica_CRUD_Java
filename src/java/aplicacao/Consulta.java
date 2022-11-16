package aplicacao;


public class Consulta {
    private int id;
    private String data;
    private String desc;
    private String realizada;
    private int id_medico;
    private int id_paciente;

    public Consulta(int id, String data, String desc, String realizada, int id_medico, int id_paciente) {
        this.id = id;
        this.data = data;
        this.desc = desc;
        this.realizada = realizada;
        this.id_medico = id_medico;
        this.id_paciente = id_paciente;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getData() {
        return data;
    }
    public void setData(String data) {
        this.data = data;
    }
    
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    public String getRealizada() {
        return realizada;
    }
    public void setRealizada(String realizada) {
        this.realizada = realizada;
    }
    
    public int getIdMedico() {
        return id_medico;
    }
    public void getIdMedico(int id_medico) {
        this.id_medico = id_medico;
    }
    
    public int getIdPaciente() {
        return id_paciente;
    }
    public void getIdPaciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }
    
}
