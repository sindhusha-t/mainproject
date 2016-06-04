import java.io.File;
import java.io.*;
import org.apache.commons.net.ftp.FTPClient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author java2
 */
public class Ftpcon {

    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    FileOutputStream fos=null;
    boolean status;
public static void main(String[] args){
    File f=new File("F:\\Usersdata.txt");
    new Ftpcon().upload(f,"Usersdata.txt");
    
}
    public boolean upload(File file,String fname) {
        try {
            client.connect("ftp.drivehq.com");

            client.login("sindhusha55@gmail.com", "Sindhusha@517");
            client.enterLocalPassiveMode();
            fis = new FileInputStream(file);
            status = client.storeFile(" /security111/" + fname, fis);
            client.logout();
            fis.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }
    }
    
     public boolean download(File file,String fname) {
        try {
            client.connect("ftp.drivehq.com");

            client.login("sindhusha55@gmail.com", "Sindhusha@517");
            client.enterLocalPassiveMode();
            fos = new FileOutputStream(file);
            status = client.retrieveFile(" /security111/" + fname, fos);
            client.logout();
            fos.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;
        }
    }
    
}
