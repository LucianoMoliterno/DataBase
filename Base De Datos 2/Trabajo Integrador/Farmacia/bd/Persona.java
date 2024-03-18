
package bd;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang.builder.ToStringBuilder;

public class Persona {

    @SerializedName("dni")
    @Expose
    private Integer dni;
    @SerializedName("nombre")
    @Expose
    private String nombre;
    @SerializedName("apellido")
    @Expose
    private String apellido;
    @SerializedName("domicilio")
    @Expose
    private Domicilio domicilio;
    @SerializedName("isEmpleado")
    @Expose
    private Boolean isEmpleado;
    @SerializedName("obraSocial")
    @Expose
    private ObraSocial obraSocial;

    /**
     * No args constructor for use in serialization
     * 
     */
    public Persona() {
    }

    /**
     * 
     * @param isEmpleado
     * @param domicilio
     * @param obraSocial
     * @param apellido
     * @param nombre
     * @param dni
     */
    public Persona(Integer dni, String nombre, String apellido, Domicilio domicilio, Boolean isEmpleado, ObraSocial obraSocial) {
        super();
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.domicilio = domicilio;
        this.isEmpleado = isEmpleado;
        this.obraSocial = obraSocial;
    }

    public Persona(int dni, String nombre, String apellido, Domicilio domicilio, boolean isEmpleado) {
		super();
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.domicilio = domicilio;
		this.isEmpleado = isEmpleado;
		this.obraSocial = null;
	}

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public Domicilio getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(Domicilio domicilio) {
        this.domicilio = domicilio;
    }

    public Boolean getIsEmpleado() {
        return isEmpleado;
    }

    public void setIsEmpleado(Boolean isEmpleado) {
        this.isEmpleado = isEmpleado;
    }

    public ObraSocial getObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(ObraSocial obraSocial) {
        this.obraSocial = obraSocial;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this).append("dni", dni).append("nombre", nombre).append("apellido", apellido).append("domicilio", domicilio).append("isEmpleado", isEmpleado).append("obraSocial", obraSocial).toString();
    }

}
