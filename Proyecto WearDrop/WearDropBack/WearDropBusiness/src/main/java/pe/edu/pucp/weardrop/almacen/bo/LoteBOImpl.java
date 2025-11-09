/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.almacen.bo;

import java.util.ArrayList;
import pe.edu.pucp.weardrop.almacen.Lote;
import pe.edu.pucp.weardrop.almacen.boi.LoteBOI;
import pe.edu.pucp.weardrop.almacen.dao.LoteDAO;
import pe.edu.pucp.weardrop.almacen.mysql.LoteImpl;

/**
 *
 * @author Leonardo
 */
public class LoteBOImpl implements LoteBOI{
    private final LoteDAO daoLote;
    
    public LoteBOImpl(){
        daoLote=new LoteImpl();
    }
    @Override
    public ArrayList<Lote> listarActivos() {
        return daoLote.listarActivos();
    }
    
    @Override
    public int insertar(Lote objeto) throws Exception {
        //El detalle mencionado en el MovimientoAlmacenBOImpl también ocurre aqui
        validar(objeto);
        return daoLote.insertar(objeto);
    }

    @Override
    public int modificar(Lote objeto) throws Exception {
        validar(objeto);
        return daoLote.modificar(objeto);
    }

    @Override
    public int eliminar(int idObjeto) throws Exception {
        return daoLote.eliminar(idObjeto);
    }

    @Override
    public Lote obtenerXId(int idObjeto) throws Exception {
        return daoLote.obtenerPorId(idObjeto);
    }

    @Override
    public ArrayList<Lote> listarTodos() throws Exception {
        return daoLote.listarTodos();
    }

    @Override
    public void validar(Lote objeto) throws Exception {
        if(objeto.getDatAlmacen()==null)
            throw new Exception("En Lote: No existe un almacen vinculado");
        if(objeto.getDatAlmacen().getId()<=0)
            throw new Exception("En Lote: La FK del Almacen es nula (Almacen)");
        if(objeto.getDescripcion().length()>255)
            throw new Exception("En Lote: La descripcion supera el máximo de caracteres permitidos (255)");
    }
    
}
