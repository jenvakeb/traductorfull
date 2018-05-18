/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplocup;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import stuff.dbConnect;
import stuff.read;

/**
 * @author arturo
 */
public class EjemploCUP {

    public final static int GENERAR = 1;
    public final static int EJECUTAR = 2;
    public final static int SALIR = 3;

    /**
     * Es un menu para elegir entre generar el analizador lexico y sintactico, o
     * ejecutarlos sobre un archivo de pruebas.
     *
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, IOException {
        java.util.Scanner in = new Scanner(System.in); //INGRESAR DATOS
        int valor = 0; //Opcion que se escoja
        do {
            System.out.println("Elija una opcion: ");
            System.out.println("1) Generar");
            System.out.println("2) Ejecutar");
            System.out.println("3) Salir");
            System.out.print("Opcion: ");
            valor = in.nextInt(); //Le vamos asig. el valor de lo que ingresamos.
            switch (valor) {
                /*  Generamos el analizador lexico y sintactico.
                 alexico.flex contiene la definicion del analizador lexico
                 asintactico.cup contiene la definicion del analizador sintactico
                 */
                case GENERAR: {
                    System.out.println("\n*** Generando ***\n");
                    String archLexico = "";
                    String archSintactico = "";
                    if (args.length > 0) {
                        System.out.println("\n*** Procesando archivos custom ***\n");
                        archLexico = args[0];
                        archSintactico = args[1];
                    } else {
                        System.out.println("\n*** Procesando archivo default ***\n");
                        archLexico = "alexico.flex"; //Donde declaramos nuestros tokens
                        archSintactico = "asintactico.cup"; //Hacemos los BNF
                    }
                    String[] alexico = {archLexico};
                    String[] asintactico = {"-parser", "AnalizadorSintactico", archSintactico};
                    jflex.Main.main(alexico); //Genera AnalizadorLexico.java
                    try {
                        java_cup.Main.main(asintactico); //Genera AnalizadorSintactico.java
                    } catch (Exception ex) {
                        Logger.getLogger(EjemploCUP.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    //movemos los archivos generados
                    boolean mvAL = moverArch("AnalizadorLexico.java");
                    boolean mvAS = moverArch("AnalizadorSintactico.java");
                    boolean mvSym= moverArch("sym.java");
                    if(mvAL && mvAS && mvSym){
                        System.exit(0);
                    }
                    System.out.println("Generado!");
                    break;
                }
                case EJECUTAR: {
                    /*  Ejecutamos el analizador lexico y sintactico
                     sobre un archivo de pruebas. 
                     */
                    dbConnect db = new dbConnect();
                   // System.out.println(db.mostrar_traduccion("ARISE", "VERBO_PRESENT", "-").toString());
                    read r = new read();
                    
                    
                    String[] archivoPrueba = {"test.txt"}; //ORACIONES
                    AnalizadorSintactico.main(archivoPrueba); //AQUI LE PASAMOS EL ARCHIVO A ANALIZAR
                    r.LecturaTraductor();
                    System.out.println("Ejecutado!");
                    break;
                }
                case SALIR: {
                    System.out.println("Adios!");
                    break;
                }
                default: {
                    System.out.println("Opcion no valida!");
                    break;
                }
            }
        } while (valor != 3);

    }

    public static boolean moverArch(String archNombre) {
        boolean efectuado = false;
        File arch = new File(archNombre);
        if (arch.exists()) {
            System.out.println("\n*** Moviendo " + arch + " \n***");
            Path currentRelativePath = Paths.get("");
            String nuevoDir = currentRelativePath.toAbsolutePath().toString()
                    + File.separator + "src" + File.separator
                    + "ejemplocup" + File.separator + arch.getName();
            File archViejo = new File(nuevoDir);
            archViejo.delete();
            if (arch.renameTo(new File(nuevoDir))) {
                System.out.println("\n*** Generado " + archNombre + "***\n");
                efectuado = true;
            } else {
                System.out.println("\n*** No movido " + archNombre + " ***\n");
            }

        } else {
            System.out.println("\n*** Codigo no existente ***\n");
        }
        return efectuado;
    }
}