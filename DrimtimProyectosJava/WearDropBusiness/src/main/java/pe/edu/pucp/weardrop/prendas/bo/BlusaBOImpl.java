/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.prendas.bo;

import java.util.ArrayList;

import pe.edu.pucp.weardrop.prendas.Blusa;
import pe.edu.pucp.weardrop.prendas.boi.BlusaBOI;
import pe.edu.pucp.weardrop.prendas.dao.BlusaDAO;
import pe.edu.pucp.weardrop.prendas.mysql.BlusaImpl;

public class BlusaBOImpl implements BlusaBOI {

    private final BlusaDAO daoBlusa;

    public BlusaBOImpl() {
        this.daoBlusa = new BlusaImpl();
    }

    // --- CRUD ---

    @Override
    public int insertar(Blusa objeto) throws Exception {
        validar(objeto);
        return daoBlusa.insertar(objeto);
    }

    @Override
    public int modificar(Blusa objeto) throws Exception {
        if (objeto == null || objeto.getIdPrenda() <= 0)
            throw new Exception("En Blusa: El idPrenda es inválido para modificar.");
        validar(objeto);
        return daoBlusa.modificar(objeto);
    }

    @Override
    public int eliminar(int idObjeto) throws Exception {
        if (idObjeto <= 0)
            throw new Exception("En Blusa: El idPrenda es inválido para eliminar.");
        return daoBlusa.eliminar(idObjeto);
    }

    @Override
    public Blusa obtenerXId(int idObjeto) throws Exception {
        if (idObjeto <= 0)
            throw new Exception("En Blusa: El idPrenda es inválido para buscar.");
        return daoBlusa.obtenerPorId(idObjeto);
    }

    @Override
    public ArrayList<Blusa> listarTodos() throws Exception {
        return daoBlusa.listarTodos();
    }

    // --- Validaciones de negocio ---

    @Override
    public void validar(Blusa b) throws Exception {
        if (b == null) throw new Exception("En Blusa: El objeto es nulo.");

        // nombre requerido (≤ 100)
        if (b.getNombre() == null || b.getNombre().isEmpty())
            throw new Exception("En Blusa: El nombre es obligatorio.");
        if (b.getNombre().length() > 100)
            throw new Exception("En Blusa: El nombre supera los 100 caracteres.");

        // color requerido según esquema de Prenda (≤ 30)
        if (b.getColor() == null || b.getColor().isEmpty())
            throw new Exception("En Blusa: El color es obligatorio.");
        if (b.getColor().length() > 30)
            throw new Exception("En Blusa: El color supera los 30 caracteres.");

        // precios ≥ 0
        if (b.getPrecioUnidad() < 0)
            throw new Exception("En Blusa: El precio por unidad debe ser ≥ 0.");
        if (b.getPrecioMayor() < 0)
            throw new Exception("En Blusa: El precio mayorista debe ser ≥ 0.");
        if (b.getPrecioDocena() < 0)
            throw new Exception("En Blusa: El precio por docena (por unidad) debe ser ≥ 0.");

        // coherencia de descuentos por cantidad:
        // precioDocena ≤ precioMayor ≤ precioUnidad
        if (b.getPrecioMayor() > b.getPrecioUnidad())
            throw new Exception("En Blusa: El precio mayorista no puede ser mayor que el precio unitario.");
        if (b.getPrecioDocena() > b.getPrecioUnidad())
            throw new Exception("En Blusa: El precio por docena (por unidad) no puede ser mayor que el precio unitario.");
        if (b.getPrecioDocena() > b.getPrecioMayor())
            throw new Exception("En Blusa: El precio por docena (por unidad) no puede ser mayor que el precio mayorista.");

        // alertaMinStock ≥ 0
        if (b.getAlertaMinStock() < 0)
            throw new Exception("En Blusa: La alerta de stock debe ser ≥ 0.");

        // enums obligatorios
        if (b.getMaterial() == null)
            throw new Exception("En Blusa: El material es obligatorio.");
        if (b.getTipoBlusa() == null)
            throw new Exception("En Blusa: El tipo de blusa es obligatorio.");
        if (b.getTipoManga() == null)
            throw new Exception("En Blusa: El tipo de manga es obligatorio.");
    }
    
      @Override
    public ArrayList<Blusa> filtrarBlusas(
            String nombreLike,
            String colorLike,
            String materialLike,
            String tipoBlusaLike,
            String tipoMangaLike,
            Double precioMin,
            Double precioMax,
            Boolean soloActivos
    ) {
        // Validaciones SOLO en BOI (inline, sin helpers)
        if (nombreLike != null && nombreLike.length() > 100)
            throw new IllegalArgumentException("nombreLike excede 100 caracteres");
        if (colorLike != null && colorLike.length() > 30)
            throw new IllegalArgumentException("colorLike excede 30 caracteres");
        if (materialLike != null && materialLike.length() > 50)
            throw new IllegalArgumentException("materialLike excede 50 caracteres");
        if (tipoBlusaLike != null && tipoBlusaLike.length() > 30)
            throw new IllegalArgumentException("tipoBlusaLike excede 30 caracteres");
        if (tipoMangaLike != null && tipoMangaLike.length() > 30)
            throw new IllegalArgumentException("tipoMangaLike excede 30 caracteres");

        if (precioMin != null && precioMin < 0)
            throw new IllegalArgumentException("precioMin no puede ser negativo");
        if (precioMax != null && precioMax < 0)
            throw new IllegalArgumentException("precioMax no puede ser negativo");
        if (precioMin != null && precioMax != null && precioMin > precioMax)
            throw new IllegalArgumentException("precioMin no puede ser mayor que precioMax");

        return daoBlusa.filtrarBlusas(
                nombreLike, colorLike, materialLike, tipoBlusaLike, tipoMangaLike,
                precioMin, precioMax, soloActivos
        );
    }
    
}

