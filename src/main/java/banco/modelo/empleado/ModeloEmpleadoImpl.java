package banco.modelo.empleado;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import banco.modelo.ModeloImpl;
import banco.modelo.empleado.beans.ClienteBean;
import banco.modelo.empleado.beans.ClienteMorosoBean;
import banco.modelo.empleado.beans.DAOCliente;
import banco.modelo.empleado.beans.DAOClienteImpl;
import banco.modelo.empleado.beans.DAOClienteMoroso;
import banco.modelo.empleado.beans.DAOClienteMorosoImpl;
import banco.modelo.empleado.beans.DAOEmpleado;
import banco.modelo.empleado.beans.DAOEmpleadoImpl;
import banco.modelo.empleado.beans.DAOPago;
import banco.modelo.empleado.beans.DAOPagoImpl;
import banco.modelo.empleado.beans.DAOPrestamo;
import banco.modelo.empleado.beans.DAOPrestamoImpl;
import banco.modelo.empleado.beans.EmpleadoBean;
import banco.modelo.empleado.beans.PagoBean;
import banco.modelo.empleado.beans.PrestamoBean;

public class ModeloEmpleadoImpl extends ModeloImpl implements ModeloEmpleado {

	private static Logger logger = LoggerFactory.getLogger(ModeloEmpleadoImpl.class);	

	// Indica el usuario actualmente logueado. Null corresponde que todavia no se ha autenticado
	private Integer legajo = null;
	
	public ModeloEmpleadoImpl() {
		logger.debug("Se crea el modelo Empleado.");
	}
	

	@Override
	public boolean autenticarUsuarioAplicacion(String legajo, String password) throws Exception {
		logger.info("Se intenta autenticar el legajo {} con password {}", legajo, password);
		/** 
		 * Código que autentica que exista un legajo de empleado y que el password corresponda a ese legajo
		 *      (el password guardado en la BD está en MD5) 
		 *      En caso exitoso deberá registrar el legajo en la propiedad legajo y retornar true.
		 *      Si la autenticación no es exitosa porque el legajo no es válido o el password es incorrecto
		 *      deberá retornar falso y si hubo algún otro error deberá producir una excepción.
		 */

		boolean resul_autenticacion = false;

		try {

			ResultSet rs = this.consulta("SELECT legajo FROM empleado WHERE legajo = " + Integer.parseInt(legajo) + " AND password=md5('" + password + "')");
			
			if (rs.next()) { //Si hay resultados, entonces coincide legajo y password.
				resul_autenticacion = true; //Resultó exitosa la autenticación
				this.legajo = rs.getInt("legajo"); 
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar empleado de la BD.");
		}

		return resul_autenticacion;
	}
	
	@Override
	public EmpleadoBean obtenerEmpleadoLogueado() throws Exception {
		logger.info("Solicita al DAO un empleado con legajo {}", this.legajo);
		if (this.legajo == null) {
			logger.info("No hay un empleado logueado.");
			throw new Exception("No hay un empleado logueado. La sesión terminó.");
		}
		
		DAOEmpleado dao = new DAOEmpleadoImpl(this.conexion);
		return dao.recuperarEmpleado(this.legajo);
	}	
	
	@Override
	public ArrayList<String> obtenerTiposDocumento() throws Exception {
		logger.info("recupera los tipos de documentos.");
		/** 
		 * Debe retornar una lista de strings con los tipos de documentos. 
		 *      Deberia propagar una excepción si hay algún error en la consulta.
		 */
		
		ArrayList<String> tipos = new ArrayList<String>();
		String tipoNuevo;
		try {

			ResultSet rs = this.consulta("SELECT tipo_doc FROM cliente GROUP BY tipo_doc");

			
			while (rs.next()) { //Vista trans_caja_Ahorro obteniendo todos los valores necesarios para cada fila
				
				tipoNuevo=rs.getString("tipo_doc");

				tipos.add(tipoNuevo);
				
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar los tipos de documentos de los clientes en la BD.");
		}
		

		return tipos;
	}	

	@Override
	public double obtenerTasa(double monto, int cantidadMeses) throws Exception {

		logger.info("Busca la tasa correspondiente a el monto {} con una cantidad de meses {}", monto, cantidadMeses);

		/** 
		 * Debe buscar la tasa correspondiente según el monto y la cantidadMeses. 
		 *      Deberia propagar una excepción si hay algún error de conexión o 
		 *      no encuentra el monto dentro del [monto_inf,monto_sup] y la cantidadMeses.
		 */
		
		
		double tasa;
		
		try {

			//Tasa correspondiente
			ResultSet rs = this.consulta("SELECT tasa FROM tasa_prestamo WHERE monto_inf <= "+monto+" AND monto_sup >= "+monto+" AND periodo="+cantidadMeses+"");

			
			if (rs.next()) {
				tasa=rs.getDouble("tasa");
			}else {
				throw new Exception("El monto no se corresponde con una cantidad de meses valida en la BD.");
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar la tasa del prestamo de la BD.");
		}
		
   		return tasa;
     	
	}

	@Override
	public double obtenerInteres(double monto, double tasa, int cantidadMeses) {
		return (monto * tasa * cantidadMeses) / 1200;
	}


	@Override
	public double obtenerValorCuota(double monto, double interes, int cantidadMeses) {
		return (monto + interes) / cantidadMeses;
	}
		

	@Override
	public ClienteBean recuperarCliente(String tipoDoc, int nroDoc) throws Exception {
		DAOCliente dao = new DAOClienteImpl(this.conexion);
		return dao.recuperarCliente(tipoDoc, nroDoc);
	}


	@Override
	public ArrayList<Integer> obtenerCantidadMeses(double monto) throws Exception {
		logger.info("recupera los períodos (cantidad de meses) según el monto {} para el prestamo.", monto);

		/** 
		 * Debe buscar los períodos disponibles según el monto. 
		 *      Deberia propagar una excepción si hay algún error de conexión o 
		 *      no encuentra el monto dentro del [monto_inf,monto_sup].
		 */

		ArrayList<Integer> cantMeses = new ArrayList<Integer>();
		try {

			//Todos los periodos que correspondientes al monto dado
			ResultSet rs = this.consulta("SELECT periodo FROM tasa_prestamo WHERE monto_inf <= "+monto+" AND monto_sup >= "+monto);

			
			while (rs.next()) { 
				
				cantMeses.add(rs.getInt("periodo"));

				
			}
			
			if(cantMeses.isEmpty()) {
				throw new Exception("Error:  En la BD, no se encuentra un periodo para el monto dado.");
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar periodos posibles segun el monto de la BD.");
		}
		
		
		return cantMeses;
	}
	@Override	
	public Integer prestamoVigente(int nroCliente) throws Exception 
	{
		logger.info("Verifica si el cliente {} tiene algun prestamo que tienen cuotas por pagar.", nroCliente);
		
		ResultSet rs= this.consulta("SELECT Prestamo.nro_prestamo, nro_cliente FROM Prestamo INNER JOIN Pago ON Prestamo.nro_prestamo = Pago.nro_prestamo WHERE nro_cliente = " + nroCliente + " AND fecha_pago IS NULL;");
		Integer nroPrestamo = -1;
		boolean encontro = false;
		
		if (rs.next()) {	
			nroPrestamo = rs.getInt("nro_prestamo");
			logger.info("Se encontró el prestamo vigente {} para el cliente {} en la BD", nroPrestamo, nroCliente);
			encontro = true;
		}
		else {
			logger.info("No se encontró prestamo vigente para el cliente {} en la BD", nroCliente);
		}
		
		return encontro ? nroPrestamo : null;
	}

	@Override
	public void crearPrestamo(PrestamoBean prestamo) throws Exception {
		logger.info("Crea un nuevo prestamo.");
		
		if (this.legajo == null) {
			throw new Exception("No hay un empleado registrado en el sistema que se haga responsable por este prestamo.");
		}
		else 
		{
			logger.info("Actualiza el prestamo con el legajo {}",this.legajo);
			prestamo.setLegajo(this.legajo);
			
			DAOPrestamo dao = new DAOPrestamoImpl(this.conexion);		
			dao.crearPrestamo(prestamo);
		}
	}
	
	@Override
	public PrestamoBean recuperarPrestamo(int nroPrestamo) throws Exception {
		logger.info("Busca el prestamo número {}", nroPrestamo);
		
		DAOPrestamo dao = new DAOPrestamoImpl(this.conexion);		
		return dao.recuperarPrestamo(nroPrestamo);
	}
	
	@Override
	public ArrayList<PagoBean> recuperarPagos(Integer prestamo) throws Exception {
		logger.info("Solicita la busqueda de pagos al modelo sobre el prestamo {}.", prestamo);
		
		DAOPago dao = new DAOPagoImpl(this.conexion);		
		return dao.recuperarPagos(prestamo);
	}
	

	@Override
	public void pagarCuotas(String p_tipo, int p_dni, int nroPrestamo, List<Integer> cuotasAPagar) throws Exception {
		
		// Valida que sea un cliente que exista sino genera una excepción
		ClienteBean c = this.recuperarCliente(p_tipo.trim(), p_dni);

		// Valida el prestamo
		if (nroPrestamo != this.prestamoVigente(c.getNroCliente())) {
			throw new Exception ("El nro del prestamo no coincide con un prestamo vigente del cliente");
		}

		if (cuotasAPagar.size() == 0) {
			throw new Exception ("Debe seleccionar al menos una cuota a pagar.");
		}
		
		DAOPago dao = new DAOPagoImpl(this.conexion);
		dao.registrarPagos(nroPrestamo, cuotasAPagar);		
	}


	@Override
	public ArrayList<ClienteMorosoBean> recuperarClientesMorosos() throws Exception {
		logger.info("Modelo solicita al DAO que busque los clientes morosos");
		DAOClienteMoroso dao = new DAOClienteMorosoImpl(this.conexion);
		return dao.recuperarClientesMorosos();	
	}
	

	
}
