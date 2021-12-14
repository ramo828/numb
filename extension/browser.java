package robo;

import java.awt.AWTException;
import java.awt.Desktop;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.SQLException;
import javax.sound.sampled.SourceDataLine;

/**
 *
 * @author ramo828
 */
public class browser {

    public void browser() {
    }

    private static String msg = "";
    private static String sourceData = "";
    private static boolean stopVar = false;
    private static boolean algoStatus = false;
    private static final String url = "https://web.whatsapp.com";

    private static void delay(int second, boolean mode) throws InterruptedException {
        if (mode) {
            Thread.sleep(second * 1000);
        } else {
            Thread.sleep(second);
        }
    }

    public static void setAlgoStatus(boolean algoStatus) {
        browser.algoStatus = algoStatus;
    }

    
    public static String getSourceData() {
        return sourceData;
    }

    public static void setSourceData(String sourceData) {
        browser.sourceData = sourceData;
    }

    public static String getMsg() {
        return msg;
    }

    public static void setMsg(String msg) {
        browser.msg = msg;
    }

    public static void setStop(boolean var) {
        stopVar = var;
    }

    private static boolean Shift(Character c) {
        return Character.isUpperCase(c);
    }

    public static void sendKeys(Robot robot, String keys) {
        for (char c : keys.toCharArray()) {
            int keyCode = KeyEvent.getExtendedKeyCodeForChar(c);
            if (KeyEvent.CHAR_UNDEFINED == keyCode) {
                throw new RuntimeException(
                        "Key code not found for character '" + c + "'");
            }
            robot.keyPress(keyCode);
            robot.delay(200);
            robot.keyRelease(keyCode);
            robot.delay(200);
        }
    }

    public static void sendKeys(Robot robot, String keys, int delay) {
        for (char c : keys.toCharArray()) {
            if (Shift(c)) {
                robot.keyPress(KeyEvent.VK_SHIFT);
                robot.delay(100);
            }
            int keyCode = KeyEvent.getExtendedKeyCodeForChar(c);
            if (KeyEvent.CHAR_UNDEFINED == keyCode) {
                throw new RuntimeException(
                        "Key code not found for character '" + c + "'");
            }

            robot.keyPress(keyCode);
            robot.delay(delay);
            robot.keyRelease(keyCode);
            robot.delay(delay);

            if (Shift(c)) {
                robot.keyRelease(KeyEvent.VK_SHIFT);
                robot.delay(100);
            }
        }
    }

    private static void openUrl(String url) throws IOException, URISyntaxException {
        if (java.awt.Desktop.isDesktopSupported()) {
            java.awt.Desktop desktop = java.awt.Desktop.getDesktop();

            if (desktop.isSupported(java.awt.Desktop.Action.BROWSE)) {
                java.net.URI uri = new java.net.URI(url);
                desktop.browse(uri);
            }
        }
    }

    private static void newMessageButton() {
        try {
            Robot r = new Robot();
            // Simulate a key press
            r.keyPress(KeyEvent.VK_CONTROL);
            r.keyPress(KeyEvent.VK_ALT);
            r.keyPress(KeyEvent.VK_N);
            r.keyRelease(KeyEvent.VK_CONTROL);
            r.keyRelease(KeyEvent.VK_ALT);
            r.keyRelease(KeyEvent.VK_N);
        } catch (AWTException e) {
        }
    }

    public void inputMessage(String text) {
        StringSelection stringSelection = new StringSelection(text.toString());
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        clipboard.setContents(stringSelection, null);
    }

    private static void paste(Robot r) throws AWTException {
        r.keyPress(KeyEvent.VK_CONTROL);
        r.keyPress(KeyEvent.VK_V);
        r.delay(200);
        r.keyRelease(KeyEvent.VK_CONTROL);
        r.keyRelease(KeyEvent.VK_V);
        r.delay(200);

    }

    private static void newTab(Robot r) throws AWTException {
        r.keyPress(KeyEvent.VK_CONTROL);
        r.keyPress(KeyEvent.VK_T);
        r.keyRelease(KeyEvent.VK_CONTROL);
        r.keyRelease(KeyEvent.VK_T);
    }

    private static void selectAll(Robot r) throws AWTException {
        r.keyPress(KeyEvent.VK_CONTROL);
        r.keyPress(KeyEvent.VK_A);
        r.keyRelease(KeyEvent.VK_CONTROL);
        r.keyRelease(KeyEvent.VK_A);
    }

    private static void copyAll(Robot r) throws AWTException {
        r.keyPress(KeyEvent.VK_CONTROL);
        r.keyPress(KeyEvent.VK_C);
        r.keyRelease(KeyEvent.VK_CONTROL);
        r.keyRelease(KeyEvent.VK_C);
    }

    private static void closeTab(Robot r) throws AWTException {
        r.keyPress(KeyEvent.VK_CONTROL);
        r.keyPress(KeyEvent.VK_W);
        r.keyRelease(KeyEvent.VK_CONTROL);
        r.keyRelease(KeyEvent.VK_W);
    }

    private static void algo(Robot r) throws SQLException, IOException, AWTException, InterruptedException {

        delay(100, false);              // 100 ms gozle
        newTab(r);                      // Yeni tab ac
        delay(100, false);              // 100 ms gozle
        sendKeys(r, sourceData, 50);    // Mesaji yapisdir
        delay(100, false);              // 100 ms gozle
        enter(r);                       // Enteri bas
        delay(1, true);                 // 1 San gozle
        selectAll(r);                   // Butun mesaji sec
        delay(300, false);              // 300 ms gozle
        copyAll(r);                     // Her seyi kopyala
        delay(500, false);              // 500 ms gozle
        closeTab(r);                    // Tab bagla
    }

    private static void step(
            int stp, // Addim
            int second // Addim zamani
    ) throws AWTException, InterruptedException {
        Robot r = new Robot();
        for (int i = 0; i < stp; i++) {
            delay(second, false);
            r.keyPress(KeyEvent.VK_DOWN);
            r.keyRelease(KeyEvent.VK_DOWN);
        }

    }

    private static void enter(Robot r) {
        r.keyPress(KeyEvent.VK_ENTER);
        r.keyRelease(KeyEvent.VK_ENTER);
    }

    public void defaultBrowserWhatsapp(
            String findContact, // Metros
            int stepStart, // Baslangic addim
            int stepTime, // Addim zaman araligi
            boolean browserStatus, // Browser calissin/calismasin
            int startTime, // Calsmaga ne zaman baslasin
            int limit // Nece addimdan sonra deyansin
            )
            //###################################################
            throws IOException,
            URISyntaxException,
            InterruptedException,
            AWTException,
            SQLException {
            //###################################################
        int count = 0;              // Saygac
        System.out.println("Robot calisdirilir");
        Robot r = new Robot();
        if (browserStatus) {        // True olduqda avtomatik brauzeri acir
            if (Desktop.isDesktopSupported() && Desktop.getDesktop().isSupported(Desktop.Action.BROWSE)) {
                Desktop.getDesktop().browse(new URI(url));
            }
            startTime += 10;       // Acilma muddetinden elave 10 saniyede elave et
        }
        delay(startTime, true);
        if(algoStatus){
            if (!stopVar) {
                algo(r);               // Algoritmi calisdir
            }
        }
        while (true) {
            if (stopVar) {
                break;
            }

            if (count == limit - (stepStart)) {
                System.out.println("Ayarladığınız limitə çatdı " + String.valueOf(stepStart + count));
                break;
            } else if (count > limit) {
                System.out.println("Limiti keçdi");
                break;
            }

            newMessageButton();                    // CTRL+N
            sendKeys(r, " " + findContact);        // ' ' +Metros
            step(stepStart + count, stepTime);     // Addimi her dongude bir artir
            enter(r);                              // Enter
            delay(1, true);                        // 1 San gozle
            paste(r);                            // Clipboard'da olan datani yapisdir
//            sendKeys(r, msg);                      // ' ' +Metros
            delay(1, true);                        // 1 San gozle
            enter(r);                              // Enter
            count++;                               // Count deyiscenini her dongude bir artir

        }

    }
}
