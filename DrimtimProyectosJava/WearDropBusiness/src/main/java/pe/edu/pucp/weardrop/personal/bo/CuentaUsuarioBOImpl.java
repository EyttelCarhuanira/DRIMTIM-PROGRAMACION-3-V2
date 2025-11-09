/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.personal.bo;

import java.util.ArrayList;
import pe.edu.pucp.weardrop.personal.CuentaUsuario;
import pe.edu.pucp.weardrop.personal.boi.CuentaUsuarioBOI;
import pe.edu.pucp.weardrop.personal.dao.CuentaUsuarioDAO;
import pe.edu.pucp.weardrop.personal.mysql.CuentaUsuarioImpl;

/**
 *
 * @author HP
 */
public class CuentaUsuarioBOImpl implements CuentaUsuarioBOI{
    
    private CuentaUsuarioDAO daoCuentaUsuario;
    
    public CuentaUsuarioBOImpl(){
        daoCuentaUsuario = new CuentaUsuarioImpl();
    }
    
    @Override
    public int insertar(CuentaUsuario objeto) throws Exception {
        validar(objeto);
        return daoCuentaUsuario.insertar(objeto);
    }

    @Override
    public int modificar(CuentaUsuario objeto) throws Exception {
        validar(objeto);
        return daoCuentaUsuario.modificar(objeto);
    }

    @Override
    public int eliminar(int idObjeto) throws Exception {
        return daoCuentaUsuario.eliminar(idObjeto);    
    }

    @Override
    public CuentaUsuario obtenerXId(int idObjeto) throws Exception {
        return daoCuentaUsuario.obtenerPorId(idObjeto);    
    }

    @Override
    public ArrayList<CuentaUsuario> listarTodos() throws Exception {
        return daoCuentaUsuario.listarTodos();    
    }

    @Override
    public void validar(CuentaUsuario cu) throws Exception {
        if(cu.getUsername().trim().length()>75)
            throw new RuntimeException("El nombre de usuario a registrar excede los 75 caracteres.");
        if(cu.getContrasenha().trim().length()>75)
            throw new RuntimeException("El nombre de usuario a registrar excede los 75 caracteres.");
        if(!(cu.getEmail().contains("@gmail.com") || cu.getEmail().contains("@hotmail.com")))
            throw new RuntimeException("El email no contiene el dominio @gamil.com o @hotmail.com");
    }
    
}
