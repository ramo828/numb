/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
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
    

    
    public static void main(String[] args) {
      	 
        auto.setSourceData("https://raw.githubusercontent.com/ramo828/numb/main/extension/message");
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
