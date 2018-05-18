/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stuff;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author betio_000
 */
public class read {
    private String pathy;
    FileReader fr;
    
	public read (String path)
	{
		pathy = path;
	}
	
	public read ()
	{
	}
	
	public void LecturaTraductor() throws IOException
	{
		dbConnect db = new dbConnect();
		try
		{
			fr = new FileReader("C:\\Users\\betio_000\\Documents\\NetBeansProjects\\EjemploCUP\\test.txt");
			BufferedReader br = new BufferedReader(fr);
			
                        int y = 1;
                       
                        System.out.println("-----TRADUCTOR-----");
			String linea=" ";
                        String[] registros;
			while((linea=br.readLine()) != null)
			{  
                            if(linea.contains("GOING TO"))
                            {
                                if(linea.contains("NOT") == true){ //CONTIENE NOT, ES UNA ORA. NEG.
                                    if((linea.contains("IS") == true) || (linea.contains("ARE") == true)){ //CONTIENE IS O ARE ES GOING TO NEG. PRESENTE
                                        
                                         registros = linea.split("[ \\n]");
                                
                                        switch(registros[0]){
                                            case "SHE":{
                                              System.out.println("ELLA NO VA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "HE":{
                                              System.out.println("EL NO VA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "IT":{
                                              System.out.println("ESTO NO VA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "YOU":{
                                               System.out.println("USTED NO VA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-")); 
                                               break;
                                            }
                                            case "WE":{
                                               System.out.println("NOSOTROS NO VAMOS A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                               break;
                                            }
                                            case "THEY":{
                                                System.out.println("ELLOS NO VAN A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                                break;
                                            }
                                        }
                                
                                    }
                                    if((linea.contains("WAS") == true) || (linea.contains("WERE") == true)){ //CONTIENE WAS O WERE ES UNA ORA. GOING TO AF. PASADO
                                        
                                        registros = linea.split("[ \\n]");
                                        switch(registros[0]){
                                            case "SHE":{
                                              System.out.println("ELLA NO IBA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "HE":{
                                              System.out.println("EL NO IBA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "IT":{
                                              System.out.println("ESTO NO IBA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "YOU":{
                                               System.out.println("USTED NO IBA A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-")); 
                                               break;
                                            }
                                            case "WE":{
                                               System.out.println("NOSOTROS NO IBAMOS A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                               break;
                                            }
                                            case "THEY":{
                                                System.out.println("ELLOS NO IBAN A "+db.mostrar_traduccion(registros[5], "VERBO_PRESENT", "-"));
                                                break;
                                            }
                                        }
                                    }
                                    
                                }
                                if(linea.contains("?") == true){ //SI ES INTERROGATIVA
                                    if((linea.contains("IS") == true) || (linea.contains("ARE") == true)){  //ES UNA ORA. GOING TO INT. AF
                                       
                                       registros = linea.split("[ \\n]");
                                       
                                       switch(registros[1]){
                                            case "SHE":{
                                              System.out.println("VA ELLA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-") +" ?");
                                              break;
                                            }
                                            case "HE":{
                                              System.out.println("VA EL A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                              break;
                                            }
                                            case "IT":{
                                              System.out.println("VA ESO A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                              break;
                                            }
                                            case "YOU":{
                                               System.out.println("VA USTED A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?"); 
                                               break;
                                            }
                                            case "WE":{
                                               System.out.println("VAMOS NOSOTROS A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                               break;
                                            }
                                            case "THEY":{
                                                System.out.println("VAN ELLOS A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                                break;
                                            }
                                        }
                                       
                                       
                                       
                                    }
                                    else if((linea.contains("WAS") == true) || (linea.contains("WERE") == true)){  //ORA GOING TO EN PASADO INT.
                                        
                                        registros = linea.split("[ \\n]");
                                        
                                        switch(registros[1]){
                                            case "SHE":{
                                              System.out.println("IBA ELLA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-") +" ?");
                                              break;
                                            }
                                            case "HE":{
                                              System.out.println("IBA EL A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                              break;
                                            }
                                            case "IT":{
                                              System.out.println("IBA ESO A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                              break;
                                            }
                                            case "YOU":{
                                               System.out.println("IBA USTED A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?"); 
                                               break;
                                            }
                                            case "WE":{
                                               System.out.println("IBAMOS NOSOTROS A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                               break;
                                            }
                                            case "THEY":{
                                                System.out.println("IBAN ELLOS A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")+" ?");
                                                break;
                                            }
                                        }
                                    }
                                    
                                }
                                else if(((linea.contains("IS") == true) || (linea.contains("ARE") == true)) &&
                                        (linea.contains("NOT") == false) && (linea.contains("?") == false)) {
                                    
                                    registros = linea.split("[ \\n]");
                                    
                                    switch(registros[0]){
                                            case "SHE":{
                                              System.out.println("ELLA VA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "HE":{
                                              System.out.println("EL VA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "IT":{
                                              System.out.println("ESTO VA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "YOU":{
                                               System.out.println("USTED VA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")); 
                                               break;
                                            }
                                            case "WE":{
                                               System.out.println("NOSOTROS VAMOS A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                               break;
                                            }
                                            case "THEY":{
                                                System.out.println("ELLOS VAN A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                                break;
                                            }
                                        }
                                    
                                    
                                }
                                else if(((linea.contains("WAS") == true) || (linea.contains("WERE") == true)) &&
                                        (linea.contains("NOT") == false) && (linea.contains("?") == false)) {
                                                                       
                                     registros = linea.split("[ \\n]");
                                
                                        switch(registros[0]){
                                            case "SHE":{
                                              System.out.println("ELLA IBA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "HE":{
                                              System.out.println("EL IBA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "IT":{
                                              System.out.println("ESTO IBA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                              break;
                                            }
                                            case "YOU":{
                                               System.out.println("USTED IBA A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-")); 
                                               break;
                                            }
                                            case "WE":{
                                               System.out.println("NOSOTROS IBAMOS A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                               break;
                                            }
                                            case "THEY":{
                                                System.out.println("ELLOS IBAN A "+db.mostrar_traduccion(registros[4], "VERBO_PRESENT", "-"));
                                                break;
                                            }
                                        }
                                }
                                			
                            y++;     	
				
			}
                            else {
                                System.out.println(">NOT A GOING TO<");
                            }
                        }
                        System.out.println("----------------");
			fr.close();
			
		}
		catch(Exception e)
		{
			System.out.println("Excepcion leyendo fichero "+pathy+ ": "+e);
			fr.close();
		}

	}
}


