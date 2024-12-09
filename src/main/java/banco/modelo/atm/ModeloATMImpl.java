package banco.modelo.atm;

import java.io.FileInputStream;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import banco.modelo.ModeloImpl;
import banco.utils.Fechas;


public class ModeloATMImpl extends ModeloImpl implements ModeloATM {
	
	private static Logger logger = LoggerFactory.getLogger(ModeloATMImpl.class);	

	private String tarjeta = null;   // mantiene la tarjeta del cliente actual
	private Integer codigoATM = null;
	private String caja=null, cliente=null; //mantiene el numero de caja y el numero de cliente correspondientes a la tarjeta actual
	
	/*
	 * La información del cajero ATM se recupera del archivo que se encuentra definido en ModeloATM.CONFIG
	 */
	public ModeloATMImpl() {
		logger.debug("Se crea el modelo ATM.");

		logger.debug("Recuperación de la información sobre el cajero");
		
		Properties prop = new Properties();
		try (FileInputStream file = new FileInputStream(ModeloATM.CONFIG))
		{
			logger.debug("Se intenta leer el archivo de propiedades {}",ModeloATM.CONFIG);
			prop.load(file);

			codigoATM = Integer.valueOf(prop.getProperty("atm.codigo.cajero"));

			logger.debug("Código cajero ATM: {}", codigoATM);
		}
		catch(Exception ex)
		{
        	logger.error("Se produjo un error al recuperar el archivo de propiedades {}.",ModeloATM.CONFIG); 
		}
		return;
	}

	@Override
	public boolean autenticarUsuarioAplicacion(String tarjeta, String pin) throws Exception	{
		logger.info("Se intenta autenticar la tarjeta {} con pin {}", tarjeta, pin);

		/** 
		 * Código que autentica que exista una tarjeta con ese pin (el pin guardado en la BD está en MD5)
		 *      En caso exitoso deberá registrar la tarjeta en la propiedad tarjeta y retornar true.
		 *      Si la autenticación no es exitosa porque no coincide el pin o la tarjeta no existe deberá retornar falso
		 *      y si hubo algún otro error deberá producir una excepción.
		 */
		boolean resul_autenticacion = false;

		try {

			ResultSet rs = this.consulta("SELECT nro_tarjeta,nro_cliente,nro_ca FROM tarjeta WHERE  nro_tarjeta= " + Integer.parseInt(tarjeta) + " AND pin=md5(" + pin + ")");

			
			while (rs.next()) { //Si hay resultados, entonces coincide la tarjeta y el pin.
				resul_autenticacion = true; //Resultó exitosa la autenticación
				this.tarjeta = rs.getString("nro_tarjeta"); //seteo el numero de tarjeta
				this.caja = rs.getString("nro_ca"); //seteo el numero de caja
				this.cliente = rs.getString("nro_cliente");//Seteo el numero de cliente
			}
			rs.close();
		} catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Error al recuperar la tarjeta de la BD.");
		}

		return resul_autenticacion;
	}
	
	
	@Override
	public Double obtenerSaldo() throws Exception
	{
		logger.info("Se intenta obtener el saldo de cliente {}", 3);

		if (this.tarjeta == null ) {
			throw new Exception("El cliente no ingresó la tarjeta");
		}

		/** 
		 * Obtiene el saldo.
		 *      Debe capturar la excepción SQLException y propagar una Exception más amigable.
		 */

		Double saldo = 0.0;
		try {
			if (this.tarjeta == null ) {
				throw new Exception("El cliente no ingresó la tarjeta");
			}

			long t = Long.parseLong(this.tarjeta);
			String sql = "SELECT saldo FROM trans_cajas_ahorro "
                    + "WHERE nro_ca = (SELECT nro_ca FROM tarjeta WHERE nro_tarjeta =" + t + ") "
                    + "ORDER BY fecha DESC, hora DESC LIMIT 1";
			ResultSet rs= this.consulta(sql);
			rs.next();
			saldo = rs.getDouble("saldo");
			logger.info("El saldo de la caja de ahorro asociada a la tarjeta {} es {}",this.tarjeta,saldo);;
		}
		catch(SQLException ex) {
			logger.error("SQLException: " + ex.getMessage());
			logger.error("SQLState: " + ex.getSQLState());
			logger.error("VendorError: " + ex.getErrorCode());
			throw new Exception("Falló la operación de obtener saldo.");
		}
		return saldo;
	}	

	@Override
	public ArrayList<TransaccionCajaAhorroBean> cargarUltimosMovimientos() throws Exception {
		return this.cargarUltimosMovimientos(ModeloATM.ULTIMOS_MOVIMIENTOS_CANTIDAD);
	}	
	
	

	@Override
	public ArrayList<TransaccionCajaAhorroBean> cargarUltimosMovimientos(int cantidad) throws Exception
	{
		logger.info("Busca las ultimas {} transacciones en la BD de la tarjeta {}",cantidad, tarjeta);

		ArrayList<TransaccionCajaAhorroBean> lista_movimientos = new ArrayList<TransaccionCajaAhorroBean>();

		try{
			long t = Long.parseLong(this.tarjeta);
			String sql = "SELECT fecha, hora, tipo, IF(tipo = 'Deposito', monto, monto * -1) AS monto, cod_caja, destino " +
						 "FROM trans_cajas_ahorro, Tarjeta " +
						 "WHERE nro_tarjeta = " + t + " AND trans_cajas_ahorro.nro_ca = Tarjeta.nro_ca " +
						 "ORDER BY fecha DESC,hora DESC " +
						 "LIMIT " + cantidad;
			ResultSet rs = this.consulta(sql);
			TransaccionCajaAhorroBean fila;
			if(rs != null){
				while(rs.next()){
					fila = new TransaccionCajaAhorroBeanImpl();

					fila.setTransaccionFechaHora(Fechas.convertirStringADate(rs.getString("fecha"),rs.getString("hora")));
					
					fila.setTransaccionTipo(rs.getString("tipo"));
					
					fila.setTransaccionMonto(rs.getDouble("monto"));
					
					fila.setTransaccionCodigoCaja(rs.getInt("cod_caja"));
					
					fila.setCajaAhorroDestinoNumero(rs.getInt("destino"));
					
					lista_movimientos.add(fila);
				} 
			
				rs.close();
			}
		}catch (SQLException ex) {
			System.out.println("Mensaje: " + ex.getMessage());
			System.out.println("Código: " + ex.getErrorCode());
			System.out.println("SQLState: " + ex.getSQLState());
			throw new Exception("Se produjo un error al recuperar los últimos movimientos");
		}

		return lista_movimientos;
	}	
	@Override
	public ArrayList<TransaccionCajaAhorroBean> cargarMovimientosPorPeriodo(Date desde, Date hasta)
			throws Exception {

		if (desde == null) {
			throw new Exception("El inicio del período no puede estar vacío");
		}
		if (hasta == null) {
			throw new Exception("El fin del período no puede estar vacío");
		}
		if (desde.after(hasta)) {
			throw new Exception("El inicio del período no puede ser posterior al fin del período");
		}	
		
		Date fechaActual = new Date();
		if (desde.after(fechaActual)) {
			throw new Exception("El inicio del período no puede ser posterior a la fecha actual");
		}	
		if (hasta.after(fechaActual)) {
			throw new Exception("El fin del período no puede ser posterior a la fecha actual");
		}				
		/**
		 *  Deberá recuperar los ultimos movimientos del cliente que se han realizado entre las fechas indicadas.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción sin las fechas son erroneas (ver descripción en interface)
		 */
	
		ArrayList<TransaccionCajaAhorroBean> lista_movimientos = new ArrayList<TransaccionCajaAhorroBean>();

		try{
			long t = Long.parseLong(this.tarjeta);
			String sql = "SELECT fecha, hora, tipo,  IF(tipo = 'Deposito', monto, monto * -1) AS monto, cod_caja, destino " +
						 "FROM trans_cajas_ahorro, Tarjeta " +
						 "WHERE nro_tarjeta = " + t + " AND trans_cajas_ahorro.nro_ca = Tarjeta.nro_ca AND fecha >= '" + Fechas.convertirDateADateSQL(desde) + "' AND fecha <= '" + Fechas.convertirDateADateSQL(hasta) + "' " +
						 "ORDER BY fecha DESC,hora DESC";
			ResultSet rs = this.consulta(sql);
			TransaccionCajaAhorroBean fila;
			if(rs != null){
				while(rs.next()){
					fila = new TransaccionCajaAhorroBeanImpl();

					fila.setTransaccionFechaHora(Fechas.convertirStringADate(rs.getString("fecha"),rs.getString("hora")));
					
					fila.setTransaccionTipo(rs.getString("tipo"));
					
					fila.setTransaccionMonto(rs.getDouble("monto"));
					
					fila.setTransaccionCodigoCaja(rs.getInt("cod_caja"));
					
					fila.setCajaAhorroDestinoNumero(rs.getInt("destino"));
					
					lista_movimientos.add(fila);
				} 
		
				rs.close();
			}
		}catch (SQLException ex) {
			System.out.println("Mensaje: " + ex.getMessage());
			System.out.println("Código: " + ex.getErrorCode());
			System.out.println("SQLState: " + ex.getSQLState());
			throw new Exception("Se produjo un error al recuperar los movimientos por período");
		}

		return lista_movimientos;
	}
	
	@Override
	public Double extraer(Double monto) throws Exception {
		logger.info("Realiza la extraccion de ${} sobre la cuenta", monto);

		String resultado = "";
		
		if (this.codigoATM == null) {
			throw new Exception("Hubo un error al recuperar la información sobre el ATM.");
		}
		if (this.tarjeta == null) {
			throw new Exception("Hubo un error al recuperar la información sobre la tarjeta del cliente.");
		}

		/**
		 * Deberá extraer de la cuenta del cliente el monto especificado (ya validado) y 
		 * 		obtener el saldo de la cuenta como resultado.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 		 * 		
		 */		

		try{
			int nro_caja_origen = Integer.parseInt(caja); 
			int nro_cliente_origen = Integer.parseInt(cliente); 
			String extraccion = "call extraer(" + nro_cliente_origen + ", " + codigoATM + ", "+ nro_caja_origen +", "+ monto +")";
			ResultSet rs2 = this.consulta(extraccion);
			if(rs2 != null){
				if(rs2.next()){
					resultado = rs2.getString("resultado");
				}
				rs2.close();
			}
		}catch(SQLException ex){
			throw new Exception("Se produjo un error al realizar la extraccion");
		}
		
		if (!resultado.equals(ModeloATM.EXTRACCION_EXITOSA)) {
			throw new Exception(resultado);
		}

		return this.obtenerSaldo();
	}
	
	@Override
	public int parseCuenta(String p_cuenta) throws Exception {
		
		logger.info("Intenta realizar el parsing de un codigo de cuenta {}", p_cuenta);

		if (p_cuenta == null) {
			throw new Exception("El código de la cuenta no puede ser vacío");
		}

		/**
		 *  Verifica que el codigo de la cuenta sea valido. 
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 * 		Debe generar excepción si la cuenta es vacia (ya realizado en el if anterior), negativo 
		 * 		o no se puede generar el parsing.
		 *	
		 * 		Debe retornar el código de la cuenta en formato int.
		 */
		Integer nro_cuenta;
		 try {
	        Integer.parseInt(p_cuenta);
	        nro_cuenta = Integer.parseInt(p_cuenta);
	        if(nro_cuenta<=0) {
	            throw new Exception("Error: El numero de cuenta no puede ser negativo o cero");
	    	}
	        try {
		        String sql = "SELECT * FROM tarjeta WHERE nro_ca = "+nro_cuenta+"";
		        ResultSet rs = this.consulta(sql);
		        if (!rs.next()) { // Si no hay resultados, la cuenta no existe
	                throw new Exception("Error: El número de cuenta no corresponde a ninguna cuenta de ahorro existente");
	            }
				rs.close();
		        logger.info("Encontró la cuenta en la BD.");
	        }
	        catch (SQLException e) {
	            logger.error("SQLException: " + e.getMessage());
	            logger.error("SQLState: " + e.getSQLState());
	            logger.error("VendorError: " + e.getErrorCode());
	            throw new Exception("Error al verificar la existencia de la cuenta en la base de datos");
	        }
	     } 
		 catch (NumberFormatException excepcion) {
	        	throw new Exception("Error: El numero de cuenta debe ser un número");
	     }

        return nro_cuenta;
	}	

	
	@Override
	public Double transferir(Double monto, int cajaDestino) throws Exception {
		logger.info("Realiza la transferencia de ${} sobre a la cuenta {}", monto, cajaDestino);

		String resultado = "";
		if (this.codigoATM == null) {
			throw new Exception("Hubo un error al recuperar la información sobre el ATM.");
		}
		if (this.tarjeta == null) {
			throw new Exception("Hubo un error al recuperar la información sobre la tarjeta del cliente.");
		}

		/**
		 *  Deberá extraer de la cuenta del cliente el monto especificado (ya fue validado) y
		 * 		de obtener el saldo de la cuenta como resultado.
		 * 		Debe capturar la excepción SQLException y propagar una Exception más amigable. 
		 */		
		

		try{
			int nro_caja_origen = Integer.parseInt(caja); 
			int nro_cliente_origen = Integer.parseInt(cliente); 
			String transferencia = "call transferir(" +nro_cliente_origen +","+ codigoATM + ", " + nro_caja_origen + ", " + cajaDestino + ", "+ monto   + ")";
			ResultSet rs2 = this.consulta(transferencia);
			if(rs2 != null){
				if(rs2.next()){
					resultado = rs2.getString("resultado");
				}
				rs2.close();
			}
		}catch(SQLException ex){
			throw new Exception("Se produjo un error al realizar la transferencia");
		}
		
		if (!resultado.equals(ModeloATM.TRANSFERENCIA_EXITOSA)) {
			throw new Exception(resultado);
		}

		return this.obtenerSaldo();
	}
	@Override
	public Double parseMonto(String p_monto) throws Exception {
		
		logger.info("Intenta realizar el parsing del monto {}", p_monto);
		
		if (p_monto == null) {
			throw new Exception("El monto no puede estar vacío");
		}

		try 
		{
			double monto = Double.parseDouble(p_monto);
			DecimalFormat df = new DecimalFormat("#.00");

			monto = Double.parseDouble(corregirComa(df.format(monto)));
			
			if(monto < 0)
			{
				throw new Exception("El monto no debe ser negativo.");
			}
			
			return monto;
		}		
		catch (NumberFormatException e)
		{
			throw new Exception("El monto no tiene un formato válido.");
		}	
	}

	private String corregirComa(String n)
	{
		String toReturn = "";
		
		for(int i = 0;i<n.length();i++)
		{
			if(n.charAt(i)==',')
			{
				toReturn = toReturn + ".";
			}
			else
			{
				toReturn = toReturn+n.charAt(i);
			}
		}
		
		return toReturn;
	}	
	
	

	
}
