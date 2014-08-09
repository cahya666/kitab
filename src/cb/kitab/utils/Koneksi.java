/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cb.kitab.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author sanjaya
 */
public class Koneksi {
    public Connection conn= null;
    public Statement stmt;
    private String url      ;//="jdbc:mysql://localhost:3306/kitab_madin";
    private String use     ;//="root";
    private String pas     ;//="server";     
    
    public Koneksi() {
        String driver  ="com.mysql.jdbc.Driver";
        
        loadKoneksi();
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            JOptionPane.showMessageDialog(null, ex);
            Logger.getLogger(Koneksi.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn = DriverManager.getConnection(url, use, pas);
            stmt = conn.createStatement();
            //JOptionPane.showMessageDialog(null, "koneksi berhasil...");
            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            Logger.getLogger(Koneksi.class.getName()).log(Level.SEVERE, null, ex);
        }
                
    }

    private void loadKoneksi() {
         FileInputStream finput = null;
        int data;
        String matang ="";

        // membuka file
        try {
          finput = new FileInputStream("koneksi.cb");
        } catch (FileNotFoundException fnfe) {
            System.out.println("File \"koneksi.cb\" tidak ditemukan.");
            return; // keluar dari method
        }
        
        // membaca data dari dalam file
        // dan menampilkan hasilnya ke layar console    
        try {    
             while ((data = finput.read()) != -1) {
               // ketika ditampilkan, data dikonversi ke tipe char
               //System.out.print((char) data);
               matang += Character.toString((char) data);
             }
             //System.out.println(matang);
             url= matang.substring(matang.indexOf("url:")+4, matang.indexOf("use:"));
             use= matang.substring(matang.indexOf("use:")+4, matang.indexOf("pas:"));
             pas= matang.substring(matang.indexOf("pas:")+4, matang.length());             
                     
        } catch (IOException ioe) {
             System.out.println(ioe.getMessage());
             return;
        }

        // menutup file    
        try {    
             finput.close();
        } catch (IOException ioe) {}    
    }
    
 
    
}
     
    

