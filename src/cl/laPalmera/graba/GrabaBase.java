package cl.laPalmera.graba;

import cl.laPalmera.DTO.ProgramaProduccionDTO;
public class GrabaBase
{
	public static void main(String[] args) 
	{
	int query = 0;
	boolean rollback = false;
ProgramaProduccionDTO programaProduccion = new ProgramaProduccionDTO();
         programaProduccion.setCodigoOrdenFabricacion("1-2");
         if (programaProduccion.buscar())
         {
			String cantidadfabricada = String.valueOf(Integer.parseInt(programaProduccion.getCantidadFabricada())+1);
			String saldoporfabricar = String.valueOf(Integer.parseInt(programaProduccion.getCantidadProgramada())-Integer.parseInt(cantidadfabricada));
			
        	programaProduccion.setCantidadFabricada(cantidadfabricada);
        	programaProduccion.setSaldoPorFabricar(saldoporfabricar);
            if (saldoporfabricar.equals("0"))
              {
          	  programaProduccion.setEstadoOrdenFabricacion("T");
              }
          	programaProduccion.modificar();
         }	
    /*
    if (rollback == false){
       query = programaProduccion.grabar();
	if (query == 0)
	   rollback = true;			
	}
	System.out.println ("grabar");
	System.out.println ("query = "+ query);
	System.out.println ("rollback = "+ rollback);
	
	//if (rollback == true){
	   query = programaProduccion.eliminar(); 	
	   if (query == 0)
	      rollback = true;
	   System.out.println ("eliminar");
	   System.out.println ("query = "+ query);
	   System.out.println ("rollback = "+ rollback);
	*/
	//}   
  }
}
