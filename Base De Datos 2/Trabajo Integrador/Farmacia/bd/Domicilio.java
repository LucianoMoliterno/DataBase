
package bd;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class Domicilio {

    @SerializedName("calle")
    @Expose
    private String calle;
    @SerializedName("numero")
    @Expose
    private Integer numero;
    @SerializedName("localidad")
    @Expose
    private String localidad;
    @SerializedName("provincia")
    @Expose
    private String provincia;

    /**
     * No args constructor for use in serialization
     * 
     */
    public Domicilio() {
    }

    /**
     * 
     * @param numero
     * @param calle
     * @param localidad
     * @param provincia
     */
    public Domicilio(String calle, Integer numero, String localidad, String provincia) {
        super();
        this.calle = calle;
        this.numero = numero;
        this.localidad = localidad;
        this.provincia = provincia;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("calle", calle).append("numero", numero).append("localidad", localidad).append("provincia", provincia).toString();
    }

}
