
package bd;

import java.time.*;
import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class Venta {

    @SerializedName("numeroTicket")
    @Expose
    private String numeroTicket;
    @SerializedName("productoVenta")
    @Expose
    private List<ProductoVentum> productoVenta = new ArrayList<ProductoVentum>();
    @SerializedName("fecha")
    @Expose
    private LocalDateTime fecha;
    @SerializedName("formaPago")
    @Expose
    private Integer formaPago;
    @SerializedName("precioTotal")
    @Expose
    private float precioTotal;
    @SerializedName("vendedor")
    @Expose
    private Persona vendedor;
    @SerializedName("cobrador")
    @Expose
    private Persona cobrador;
    @SerializedName("cliente")
    @Expose
    private Persona cliente;

    /**
     * No args constructor for use in serialization
     * 
     */
    public Venta() {
    }

    /**
     * 
     * @param fecha
     * @param cliente
     * @param vendedor
     * @param cobrador
     * @param productoVenta
     * @param formaPago
     * @param precioTotal
     * @param numeroTicket
     */
    public Venta(String numeroTicket, List<ProductoVentum> productoVenta, String fecha, Integer formaPago, float precioTotal, Vendedor vendedor, Cobrador cobrador, Cliente cliente) {
        super();
        this.numeroTicket = numeroTicket;
        this.productoVenta = productoVenta;
        this.fecha = fecha;
        this.formaPago = formaPago;
        this.precioTotal = precioTotal;
        this.vendedor = vendedor;
        this.cobrador = cobrador;
        this.cliente = cliente;
    }

    public String getNumeroTicket() {
        return numeroTicket;
    }

    public void setNumeroTicket(String numeroTicket) {
        this.numeroTicket = numeroTicket;
    }

    public List<ProductoVentum> getProductoVenta() {
        return productoVenta;
    }

    public void setProductoVenta(List<ProductoVentum> productoVenta) {
        this.productoVenta = productoVenta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Integer getFormaPago() {
        return formaPago;
    }

    public void setFormaPago(Integer formaPago) {
        this.formaPago = formaPago;
    }

    public float getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(float precioTotal) {
        this.precioTotal = precioTotal;
    }

    public Persona getVendedor() {
        return vendedor;
    }

    public void setVendedor(Persona vendedor) {
        this.vendedor = vendedor;
    }

    public Persona getCobrador() {
        return cobrador;
    }

    public void setCobrador(Persona cobrador) {
        this.cobrador = cobrador;
    }

    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("numeroTicket", numeroTicket).append("productoVenta", productoVenta).append("fecha", fecha).append("formaPago", formaPago).append("precioTotal", precioTotal).append("vendedor", vendedor).append("cobrador", cobrador).append("cliente", cliente).toString();
    }

}
