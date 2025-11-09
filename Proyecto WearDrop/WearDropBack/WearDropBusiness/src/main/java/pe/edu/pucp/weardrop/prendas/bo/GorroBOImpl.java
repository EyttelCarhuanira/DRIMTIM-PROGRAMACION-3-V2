/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.prendas.bo;

import java.util.ArrayList;

import pe.edu.pucp.weardrop.prendas.Gorro;
import pe.edu.pucp.weardrop.prendas.boi.GorroBOI;
import pe.edu.pucp.weardrop.prendas.dao.GorroDAO;
import pe.edu.pucp.weardrop.prendas.mysql.GorroImpl;

public class GorroBOImpl implements GorroBOI {

    private final GorroDAO daoGorro;

    public GorroBOImpl() {
        this.daoGorro = new GorroImpl();
    }

    // --- CRUD ---

    @Override
    public int insertar(Gorro objeto) throws Exception {
        validar(objeto);
        return daoGorro.insertar(objeto);
    }

    @Override
    public int modificar(Gorro objeto) throws Exception {
        if (objeto == null || objeto.getIdPrenda() <= 0)
            throw new Exception("En Gorro: El idPrenda es inválido para modificar.");
        validar(objeto);
        return daoGorro.modificar(objeto);
    }

    @Override
    public int eliminar(int idObjeto) throws Exception {
        if (idObjeto <= 0)
            throw new Exception("En Gorro: El idPrenda es inválido para eliminar.");
        return daoGorro.eliminar(idObjeto);
    }

    @Override
    public Gorro obtenerXId(int idObjeto) throws Exception {
        if (idObjeto <= 0)
            throw new Exception("En Gorro: El idPrenda es inválido para buscar.");
        return daoGorro.obtenerPorId(idObjeto);
    }

    @Override
    public ArrayList<Gorro> listarTodos() throws Exception {
        return daoGorro.listarTodos();
    }

    // --- Validaciones de negocio ---

    @Override
    public void validar(Gorro g) throws Exception {
        if (g == null) throw new Exception("En Gorro: El objeto es nulo.");

        // nombre requerido (≤ 100)
        if (g.getNombre() == null || g.getNombre().isEmpty())
            throw new Exception("En Gorro: El nombre es obligatorio.");
        if (g.getNombre().length() > 100)
            throw new Exception("En Gorro: El nombre supera los 100 caracteres.");

        // color requerido (≤ 30) — sigue el esquema general de Prenda
        if (g.getColor() == null || g.getColor().isEmpty())
            throw new Exception("En Gorro: El color es obligatorio.");
        if (g.getColor().length() > 30)
            throw new Exception("En Gorro: El color supera los 30 caracteres.");

        // precios ≥ 0
        if (g.getPrecioUnidad() < 0)
            throw new Exception("En Gorro: El precio por unidad debe ser ≥ 0.");
        if (g.getPrecioMayor() < 0)
            throw new Exception("En Gorro: El precio mayorista debe ser ≥ 0.");
        if (g.getPrecioDocena() < 0)
            throw new Exception("En Gorro: El precio por docena (por unidad) debe ser ≥ 0.");

        // coherencia de descuentos por cantidad:
        //  precioDocena ≤ precioMayor ≤ precioUnidad
        if (g.getPrecioMayor() > g.getPrecioUnidad())
            throw new Exception("En Gorro: El precio mayorista no puede ser mayor que el precio unitario.");
        if (g.getPrecioDocena() > g.getPrecioUnidad())
            throw new Exception("En Gorro: El precio por docena (por unidad) no puede ser mayor que el precio unitario.");
        if (g.getPrecioDocena() > g.getPrecioMayor())
            throw new Exception("En Gorro: El precio por docena (por unidad) no puede ser mayor que el precio mayorista.");

        // alertaMinStock ≥ 0
        if (g.getAlertaMinStock() < 0)
            throw new Exception("En Gorro: La alerta de stock debe ser ≥ 0.");

        // enums obligatorios
        if (g.getMaterial() == null)
            throw new Exception("En Gorro: El material es obligatorio.");
        if (g.getTipoGorra() == null)
            throw new Exception("En Gorro: El tipo de gorra es obligatorio.");

        // booleans: tallaAjustable / impermeable no necesitan validación extra
    }
     @Override
    public ArrayList<Gorro> filtrarGorros(
            String nombreLike,
            String colorLike,
            String materialLike,
            String tipoGorraLike,
            Boolean tallaAjustable,
            Boolean impermeable,
            Double precioMin,
            Double precioMax,
            Boolean soloActivos
    ) {
        // Validaciones inline SOLO en BOI:
        if (nombreLike != null && nombreLike.length() > 100)
            throw new IllegalArgumentException("nombreLike excede 100 caracteres");
        if (colorLike != null && colorLike.length() > 30)
            throw new IllegalArgumentException("colorLike excede 30 caracteres");
        if (materialLike != null && materialLike.length() > 50)
            throw new IllegalArgumentException("materialLike excede 50 caracteres");
        if (tipoGorraLike != null && tipoGorraLike.length() > 30)
            throw new IllegalArgumentException("tipoGorraLike excede 30 caracteres");

        if (precioMin != null && precioMin < 0)
            throw new IllegalArgumentException("precioMin no puede ser negativo");
        if (precioMax != null && precioMax < 0)
            throw new IllegalArgumentException("precioMax no puede ser negativo");
        if (precioMin != null && precioMax != null && precioMin > precioMax)
            throw new IllegalArgumentException("precioMin no puede ser mayor que precioMax");

        return daoGorro.filtrarGorros(
                nombreLike, colorLike, materialLike, tipoGorraLike,
                tallaAjustable, impermeable,
                precioMin, precioMax, soloActivos
        );
    }
    
}

