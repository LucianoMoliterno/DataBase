
package bd;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class ProductoVentum {

    @SerializedName("totalVenta")
    @Expose
    private Integer totalVenta;
    @SerializedName("precioTotal")
    @Expose
    private Integer precioTotal;
    @SerializedName("productos")
    @Expose
    private Productos productos;

    /**
     * No args constructor for use in serialization
     * 
     */
    public ProductoVentum() {
    }

    /**
     * 
     * @param totalVenta
     * @param precioTotal
     * @param productos
     */
    public ProductoVentum(Integer totalVenta, Integer precioTotal, Productos productos) {
        super();
        this.totalVenta = totalVenta;
        this.precioTotal = precioTotal;
        this.productos = productos;
    }

    public Integer getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(Integer totalVenta) {
        this.totalVenta = totalVenta;
    }

    public Integer getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(Integer precioTotal) {
        this.precioTotal = precioTotal;
    }

    public Productos getProductos() {
        return productos;
    }

    public void setProductos(Productos productos) {
        this.productos = productos;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("totalVenta", totalVenta).append("precioTotal", precioTotal).append("productos", productos).toString();
    }

}
