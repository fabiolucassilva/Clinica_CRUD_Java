package aplicacao;


public class Medico {
    private int id;
    private String nome;
    private String crm;
    private String estado_crm;
    private String cpf;
    private String autorizado;
    private int id_tipo_especialidade;

    public Medico(int id, String nome, String crm, String estado_crm, String cpf, String autorizado, int tipo_especialidade) {
        this.id = id;
        this.nome = nome;
        this.crm = crm;
        this.estado_crm = estado_crm;
        this.cpf = cpf;
        this.autorizado = autorizado;
        this.id_tipo_especialidade = tipo_especialidade;
    }

    
    public int getTipoEspecialidade() {
        return id_tipo_especialidade;
    }

    public void getTipoEspecialidade(int tipo_especialidade) {
        this.id_tipo_especialidade = tipo_especialidade;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    public String getCrm() {
        return crm;
    }

    public void setCrm(String crm) {
        this.crm = crm;
    }
    
    public String getEstadoCrm() {
        return estado_crm;
    }

    public void setEstadoCrm(String estado_crm) {
        this.estado_crm = estado_crm;
    }

    public String getAutorizado() {
        return autorizado;
    }

    public void setAutorizado(String autorizado) {
        this.autorizado = autorizado;
    }

    
    
}
