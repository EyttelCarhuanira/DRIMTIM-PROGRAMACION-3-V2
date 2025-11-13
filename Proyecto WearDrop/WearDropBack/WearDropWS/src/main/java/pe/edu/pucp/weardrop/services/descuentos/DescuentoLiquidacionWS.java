/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package pe.edu.pucp.weardrop.services.descuentos;

import jakarta.jws.WebService;
import jakarta.jws.WebMethod;
import jakarta.jws.WebParam;
import java.util.List;

import pe.edu.pucp.weardrop.descuento.boi.DescuentoLiquidacionBOI;
import pe.edu.pucp.weardrop.descuento.bo.DescuentoLiquidacionBOImpl;
import pe.edu.pucp.weardrop.promocionesdescuentos.DescuentoLiquidacion;

/**
 *
 * @author leona
 */
@WebService(serviceName = "DescuentoLiquidacion")
public class DescuentoLiquidacionWS {
    private final DescuentoLiquidacionBOI boDesc=new DescuentoLiquidacionBOImpl();
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    @WebMethod(operationName = "mostrar_descuentosliquidacion")
    public List<DescuentoLiquidacion> mostrar_descuentosliquidacion(){
        List<DescuentoLiquidacion> listaDesc=null;
        try{
            listaDesc=boDesc.listarTodos();
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return listaDesc;
    }
    
   
    @WebMethod(operationName = "insertarDescuento")
    public int insertarDescuento(@WebParam(name="datDesc") DescuentoLiquidacion datDesc){
        int resultado=0;
        try{
            resultado=boDesc.insertar(datDesc);
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    //Para modificar Almacen
    @WebMethod(operationName = "modificarDecuentoLiquidacion")
    public int modificarDecuentoLiquidacion(@WebParam(name="datDesc") DescuentoLiquidacion datDesc){
        int resultado=0;
        try{
            resultado=boDesc.modificar(datDesc);
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    @WebMethod(operationName = "eliminarDescuentoLiquidacion")
    public int eliminarDescuentoLiquidacion(@WebParam(name="idDesc") int idDesc){
        int resultado=0;
        try{
            resultado=boDesc.eliminar(idDesc);
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return resultado;
    }
    
    //Para Obtener Por ID
    @WebMethod(operationName = "obtenerPorId")
    public DescuentoLiquidacion obtenerPorId(@WebParam(name="idDesc") int idDesc){
        DescuentoLiquidacion datProm=null;
        try{
            datProm=boDesc.obtenerXId(idDesc);
        } catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return datProm;
    }
}
