package robo;

/**
 *
 * @author ramo828
 */

import java.awt.AWTException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Scanner;


public class Robo {

    static browser auto = new browser();
    private static String contactName = "";
    private static int initialStep;
    private static int stepTime;
    private static boolean browserStatus;
    private static int startTime;
    private static int stepLimit;
    private static String msg;
    private static Scanner data = new Scanner(System.in);
    private static String adress[] = {"https://raw.githubusercontent.com/ramo828/numb/main/extension/message/0",
                                      "https://raw.githubusercontent.com/ramo828/numb/main/extension/message/1",
					  "https://raw.githubusercontent.com/ramo828/numb/main/extension/message/2"

                                        };
    private static int choise = 0;
    
    public static void main(String[] args) {
        try {
        if(args[0].equals("min"))
            	choise = 1;
	else if(args[0].equals("099"))
		choise = 2;
        } catch(ArrayIndexOutOfBoundsException ae){
            	choise = 0;
        }
        auto.setSourceData(adress[choise]);
        auto.setAlgoStatus(true);
        try {
            yaz("\n\t-------------------------\n");
            yaz("\t----Avto Mesaj bot----\n\n\n");
            yaz("Kontaktın adı >> ");
            contactName = data.nextLine();
            yaz("Başlanğıc addım >> ");
            initialStep = data.nextInt();
            yaz("Addım zamanı >> ");
            stepTime = data.nextInt();
            yaz("Başlama vaxtı >> ");
            browserStatus = false;
            startTime = data.nextInt();
            yaz("Limit >> ");
            stepLimit = data.nextInt();
            
            auto.defaultBrowserWhatsapp(
                    contactName,
                    initialStep,
                    stepTime,
                    browserStatus,
                    startTime,
                    stepLimit
                    );
        } catch (IOException ex) {
            Logger.getLogger(Robo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (URISyntaxException ex) {
            Logger.getLogger(Robo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Robo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (AWTException ex) {
            Logger.getLogger(Robo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Robo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    static void yaz(String msg){
        System.out.println(msg);
    }
    
}
