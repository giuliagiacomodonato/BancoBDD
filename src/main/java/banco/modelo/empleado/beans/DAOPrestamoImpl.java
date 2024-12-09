package banco.modelo.empleado.beans;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DAOPrestamoImpl implements DAOPrestamo {

	private static Logger logger = LoggerFactory.getLogger(DAOPrestamoImpl.class);
	
	private Connection conexion;
	
	public DAOPrestamoImpl(Connection c) {
		this.conexion = c;
	}
	@Override
	public void crearPrestamo(PrestamoBean prestamo) throws Exception {

		logger.info("Creación o actualizacion del prestamo.");
		logger.debug("meses : {}", prestamo.getCantidadMeses());
		logger.debug("monto : {}", prestamo.getMonto());
		logger.debug("tasa : {}", prestamo.getTasaInteres());
		logger.debug("interes : {}", prestamo.getInteres());
		logger.debug("cuota : {}", prestamo.getValorCuota());
		logger.debug("legajo : {}", prestamo.getLegajo());
		logger.debug("cliente : {}", prestamo.getNroCliente());
		
		/**   
		 *  Crear un Prestamo segun el PrestamoBean prestamo. 
		 *    
		 * 
		 * @throws Exception deberá propagar la excepción si ocurre alguna. Puede capturarla para loguear los errores, ej.
		 *				logger.error("SQLException: " + ex.getMessage());
		 * 				logger.error("SQLState: " + ex.getSQLState());
		 *				logger.error("VendorError: " + ex.getErrorCode());
		 *		   pero luego deberá propagarla para que se encargue el controlador. 
		 */
		try {
			//nro_prestamo es auto_increment 
			Statement stmt = conexion.createStatement();
			String sql = "INSERT INTO PRESTAMO(fecha,cant_meses,monto,tasa_interes,interes,valor_cuota,legajo,nro_cliente) " +
						 "VALUES(CURDATE()," + prestamo.getCantidadMeses() + "," + prestamo.getMonto() + "," + 
						  prestamo.getTasaInteres() + "," + prestamo.getInteres() + "," + prestamo.getValorCuota() + "," +
						  prestamo.getLegajo() + "," + prestamo.getNroCliente() + ")";
			stmt.execute(sql);
			stmt.close();
		}
		catch (java.sql.SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
		 	logger.error("SQLState: " + ex.getSQLState());
		 	logger.error("VendorError: " + ex.getErrorCode());
			throw new SQLException("Error al crear o actualizar préstamo"); 
		}
		
	}
	

	@Override
	public PrestamoBean recuperarPrestamo(int nroPrestamo) throws Exception {
		
		logger.info("Recupera el prestamo nro {}.", nroPrestamo);
		
		/**
		 * Obtiene el prestamo según el id nroPrestamo
		 * 
		 * @param nroPrestamo
		 * @return Un prestamo que corresponde a ese id o null
		 * @throws Exception si hubo algun problema de conexión
		 */		
		PrestamoBean prestamo = null;
		
		try {
			String sql = "SELECT nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente " + 
						 "FROM Prestamo " +
						 "WHERE nro_prestamo = " + nroPrestamo;
			PreparedStatement stmt = conexion.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);
			if(rs != null && rs.next()) {
				prestamo = new PrestamoBeanImpl();
				prestamo.setNroPrestamo(rs.getInt("nro_prestamo"));
				prestamo.setFecha(rs.getDate("fecha"));
				prestamo.setCantidadMeses(rs.getInt("cant_meses"));
				prestamo.setMonto(rs.getDouble("monto"));
				prestamo.setTasaInteres(rs.getDouble("tasa_interes"));
				prestamo.setInteres(rs.getDouble("interes"));
				prestamo.setValorCuota(rs.getDouble("valor_cuota"));
				prestamo.setLegajo(rs.getInt("legajo"));
				prestamo.setNroCliente(rs.getInt("nro_cliente"));
				rs.close();
			}
			stmt.close();
		}
		catch (java.sql.SQLException ex) {
			throw new SQLException("Error al recuperar préstamo"); 
		}
	
		return prestamo;
	}



}