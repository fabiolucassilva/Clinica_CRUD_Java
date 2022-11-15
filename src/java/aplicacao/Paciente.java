package aplicacao;


public class Paciente {
    private int id;
    private String nome;
    private String cpf;
    private String autorizado;
    private int id_tipo_plano;

    public Paciente(int id, String nome, String cpf, String autorizado, int tipo_plano) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.autorizado = autorizado;
        this.id_tipo_plano = tipo_plano;
    }

    
    public int getTipoPlano() {
        return id_tipo_plano;
    }

    public void getTipoPlano(int tipo_plano) {
        this.id_tipo_plano = tipo_plano;
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

    public String getAutorizado() {
        return autorizado;
    }

    public void setAutorizado(String autorizado) {
        this.autorizado = autorizado;
    }

    
    
}
