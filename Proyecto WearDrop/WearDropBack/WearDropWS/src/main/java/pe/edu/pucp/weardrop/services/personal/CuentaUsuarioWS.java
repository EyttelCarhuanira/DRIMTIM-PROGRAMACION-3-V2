/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.weardrop.services.personal;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.ArrayList;
import pe.edu.pucp.weardrop.personal.CuentaUsuario;
import pe.edu.pucp.weardrop.personal.bo.CuentaUsuarioBOImpl;
import pe.edu.pucp.weardrop.personal.boi.CuentaUsuarioBOI;

/**
 *
 * @author Leonardo
 */
@WebService(serviceName = "CuentaUsuarioWS")
public class CuentaUsuarioWS {
    
    private final CuentaUsuarioBOI boCuentaUsuario = new CuentaUsuarioBOImpl();
    
    // Listar todos los usuarios
    @WebMethod(operationName = "listarCuentasUsuario")
    public ArrayList<CuentaUsuario> listarCuentasUsuario() {
        ArrayList<CuentaUsuario> listaCuentas = null;
        try {
            listaCuentas = boCuentaUsuario.listarTodos();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return listaCuentas;
    }
    
    // Insertar una nueva cuenta de usuario
    @WebMethod(operationName = "insertarCuentaUsuario")
    public int insertarCuentaUsuario(@WebParam(name = "cuentaUsuario") CuentaUsuario cuentaUsuario) {
        int resultado = 0;
        try {
            resultado = boCuentaUsuario.insertar(cuentaUsuario);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    // Modificar una cuenta existente
    @WebMethod(operationName = "modificarCuentaUsuario")
    public int modificarCuentaUsuario(@WebParam(name = "cuentaUsuario") CuentaUsuario cuentaUsuario) {
        int resultado = 0;
        try {
            resultado = boCuentaUsuario.modificar(cuentaUsuario);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    // Eliminar una cuenta por su ID
    @WebMethod(operationName = "eliminarCuentaUsuario")
    public int eliminarCuentaUsuario(@WebParam(name = "idCuentaUsuario") int idCuentaUsuario) {
        int resultado = 0;
        try {
            resultado = boCuentaUsuario.eliminar(idCuentaUsuario);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    // Obtener una cuenta por su ID
    @WebMethod(operationName = "obtenerCuentaUsuarioPorId")
    public CuentaUsuario obtenerCuentaUsuarioPorId(@WebParam(name = "idCuentaUsuario") int idCuentaUsuario) {
        CuentaUsuario cuentaUsuario = null;
        try {
            cuentaUsuario = boCuentaUsuario.obtenerXId(idCuentaUsuario);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return cuentaUsuario;
    }
}
