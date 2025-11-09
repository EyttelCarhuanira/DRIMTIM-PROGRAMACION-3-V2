/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.weardrop.prendas.bo;

import java.util.ArrayList;

import pe.edu.pucp.weardrop.prendas.Pantalon;
import pe.edu.pucp.weardrop.prendas.boi.PantalonBOI;
import pe.edu.pucp.weardrop.prendas.dao.PantalonDAO;
import pe.edu.pucp.weardrop.prendas.mysql.PantalonImpl;

public class PantalonBOImpl implements PantalonBOI {

    private final PantalonDAO daoPantalon;

    public PantalonBOImpl() {
        this.daoPantalon = new PantalonImpl();
    }

    // --- CRUD ---

    @Override
    public int insertar(Pantalon objeto) throws Exception {
        validar(objeto);
        return daoPantalon.insertar(objeto);
    }

    @Override
    public int modificar(Pantalon objeto) throws Exception {
        if (objeto == null || objeto.getIdPrenda() <= 0)
            throw new Exception("En Pantalón: El idPrenda es inválido para modificar.");
        validar(objeto);
        return daoPantalon.modificar(objeto);
    }

    @Override
    public int eliminar(int idObjeto) throws Exception {
        if (idObjeto <= 0)
            throw new Exception("En Pantalón: El idPrenda es inválido para eliminar.");
        return daoPantalon.eliminar(idObjeto);
    }

    @Override
    public Pantalon obtenerXId(int idObjeto) throws Exception {
        if (idObjeto <= 0)
            throw new Exception("En Pantalón: El idPrenda es inválido para buscar.");
        return daoPantalon.obtenerPorId(idObjeto);
    }

    @Override
    public ArrayList<Pantalon> listarTodos() throws Exception {
        return daoPantalon.listarTodos();
    }

    // --- Validaciones de negocio ---

    @Override
    public void validar(Pantalon p) throws Exception {
        if (p == null) throw new Exception("En Pantalón: El objeto es nulo.");

        // nombre requerido (≤ 100)
        if (p.getNombre() == null || p.getNombre().isEmpty())
            throw new Exception("En Pantalón: El nombre es obligatorio.");
        if (p.getNombre().length() > 100)
            throw new Exception("En Pantalón: El nombre supera los 100 caracteres.");

        // color requerido (≤ 30) — siguiendo tu esquema general de Prenda
        if (p.getColor() == null || p.getColor().isEmpty())
            throw new Exception("En Pantalón: El color es obligatorio.");
        if (p.getColor().length() > 30)
            throw new Exception("En Pantalón: El color supera los 30 caracteres.");

        // precios ≥ 0
        if (p.getPrecioUnidad() < 0)
            throw new Exception("En Pantalón: El precio por unidad debe ser ≥ 0.");
        if (p.getPrecioMayor() < 0)
            throw new Exception("En Pantalón: El precio mayorista debe ser ≥ 0.");
        if (p.getPrecioDocena() < 0)
            throw new Exception("En Pantalón: El precio por docena (por unidad) debe ser ≥ 0.");

        // coherencia de descuentos por cantidad:
        //  precioDocena ≤ precioMayor ≤ precioUnidad
        if (p.getPrecioMayor() > p.getPrecioUnidad())
            throw new Exception("En Pantalón: El precio mayorista no puede ser mayor que el precio unitario.");
        if (p.getPrecioDocena() > p.getPrecioUnidad())
            throw new Exception("En Pantalón: El precio por docena (por unidad) no puede ser mayor que el precio unitario.");
        if (p.getPrecioDocena() > p.getPrecioMayor())
            throw new Exception("En Pantalón: El precio por docena (por unidad) no puede ser mayor que el precio mayorista.");

        // alertaMinStock ≥ 0
        if (p.getAlertaMinStock() < 0)
            throw new Exception("En Pantalón: La alerta de stock debe ser ≥ 0.");

        // enums obligatorios
        if (p.getMaterial() == null)
            throw new Exception("En Pantalón: El material es obligatorio.");
        if (p.getTipoPantalon() == null)
            throw new Exception("En Pantalón: El tipo de pantalón es obligatorio.");

        // medidas > 0
        if (p.getLargoPierna() <= 0)
            throw new Exception("En Pantalón: El largo de pierna debe ser mayor que 0.");
        if (p.getCintura() <= 0)
            throw new Exception("En Pantalón: La medida de cintura debe ser mayor que 0.");

        // elasticidad: boolean, sin validación adicional
    }

    @Override
    public ArrayList<Pantalon> filtrarPantalones(
            String nombreLike,
            String colorLike,
            String materialLike,
            String tipoPantalonLike,
            Boolean elasticidad,
            Double precioMin,
            Double precioMax,
            Double largoMin,
            Double largoMax,
            Double cinturaMin,
            Double cinturaMax,
            Boolean soloActivos
    ) {
        // Validaciones SOLO en BOI (sin métodos auxiliares)
        if (nombreLike != null && nombreLike.length() > 100) {
            throw new IllegalArgumentException("nombreLike excede 100 caracteres");
        }
        if (colorLike != null && colorLike.length() > 30) {
            throw new IllegalArgumentException("colorLike excede 30 caracteres");
        }
        if (materialLike != null && materialLike.length() > 50) {
            throw new IllegalArgumentException("materialLike excede 50 caracteres");
        }
        if (tipoPantalonLike != null && tipoPantalonLike.length() > 30) {
            throw new IllegalArgumentException("tipoPantalonLike excede 30 caracteres");
        }

        if (precioMin != null && precioMin < 0) {
            throw new IllegalArgumentException("precioMin no puede ser negativo");
        }
        if (precioMax != null && precioMax < 0) {
            throw new IllegalArgumentException("precioMax no puede ser negativo");
        }
        if (precioMin != null && precioMax != null && precioMin > precioMax) {
            throw new IllegalArgumentException("precioMin no puede ser mayor que precioMax");
        }

        if (largoMin != null && largoMin < 0) {
            throw new IllegalArgumentException("largoMin no puede ser negativo");
        }
        if (largoMax != null && largoMax < 0) {
            throw new IllegalArgumentException("largoMax no puede ser negativo");
        }
        if (largoMin != null && largoMax != null && largoMin > largoMax) {
            throw new IllegalArgumentException("largoMin no puede ser mayor que largoMax");
        }

        if (cinturaMin != null && cinturaMin < 0) {
            throw new IllegalArgumentException("cinturaMin no puede ser negativa");
        }
        if (cinturaMax != null && cinturaMax < 0) {
            throw new IllegalArgumentException("cinturaMax no puede ser negativa");
        }
        if (cinturaMin != null && cinturaMax != null && cinturaMin > cinturaMax) {
            throw new IllegalArgumentException("cinturaMin no puede ser mayor que cinturaMax");
        }

        return daoPantalon.filtrarPantalones(
                nombreLike, colorLike, materialLike, tipoPantalonLike, elasticidad,
                precioMin, precioMax, largoMin, largoMax, cinturaMin, cinturaMax, soloActivos
        );
    }
}
