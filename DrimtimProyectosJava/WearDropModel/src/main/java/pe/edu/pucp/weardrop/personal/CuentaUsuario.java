
package pe.edu.pucp.weardrop.personal;

//@author Eyttel
public class CuentaUsuario {
    //Atributos
    private int idCuenta;
    private String username;
    private String contrasenha;
    private boolean activo;
    private String email;
    private TipoCuenta tipo;
    
    //Constructo por defecto
    public CuentaUsuario() {
        this.tipo = new TipoCuenta();
    }
    
    //Constructor con parametros
    public CuentaUsuario(int idCuenta, String username, String password, 
                boolean activo, String email, TipoCuenta tipo) {
        this.idCuenta = idCuenta;
        this.username = username;
        this.contrasenha = password;
        this.activo = activo;
        this.email = email;
        this.tipo = tipo;
    }
    
    //Constructor copia
    public CuentaUsuario(CuentaUsuario datCuentaUsuario) {
        this.idCuenta = datCuentaUsuario.idCuenta;
        this.username = datCuentaUsuario.username;
        this.contrasenha = datCuentaUsuario.contrasenha;
        this.activo = datCuentaUsuario.activo;
        this.email = datCuentaUsuario.email;
        this.tipo = datCuentaUsuario.tipo;
    }
    
    
    //Setters y Getters
    public int getIdCuenta() {
        return idCuenta;
    }

    public void setIdCuenta(int idCuenta) {
        this.idCuenta = idCuenta;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContrasenha() {
        return contrasenha;
    }

    public void setContrasenha(String contrasenha) {
        this.contrasenha = contrasenha;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public TipoCuenta getTipo() {
        return tipo;
    }

    public void setTipo(TipoCuenta tipo) {
        this.tipo = tipo;
    }
    
    
    
}
