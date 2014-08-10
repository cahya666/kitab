/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cb.kitab.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author swalayan
 */
public class TextUtils {
    
    public static String setText(String Text,int Lebar, int align){
        int left,right;
        String hasil = Text;
        
        if (Text.length()> Lebar){
            hasil = Text.substring(0,Lebar);
        }
        
        switch(align){
            case 2 : left = Lebar - Text.length(); break;
            case 1 : left = (Lebar / 2)- (Text.length() / 2); break;
            default: left = 0;                
        }
        if (left<0){left=0;}
        
        
        right = Lebar - (left + Text.length());
        
        StringBuffer sb = new StringBuffer(hasil);
        
        for (int i = 0; i < left; i++) {
            sb.insert(0, " ");
        }        
        
        hasil = sb.toString();
        
        return sb.toString();    
    }

    	public static void SimpankeFile(String IsiData,String TempatFile) {
 
		File file = new File(TempatFile);
		
		try (FileOutputStream fop = new FileOutputStream(file)) {
 
			// if file doesn't exists, then create it
			if (!file.exists()) {
				file.createNewFile();
			}
 
			// get the content in bytes
			byte[] contentInBytes = IsiData.getBytes();
 
			fop.write(contentInBytes);
			fop.flush();
			fop.close();
 
			System.out.println("Done");
 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
        
    public static String wrapText(String Text,int Lebar, int mulai){
        String hasil = "";
        int ix;
        
        if (Text.length()>Lebar){
            ix = Text.lastIndexOf(" ", Lebar);
            hasil += Text.substring(0,ix)+"\n";
            
            for (int i = 0; i < mulai; i++) {
                hasil +=" ";   
            }
             
            hasil += Text.substring(ix+1, Text.length());
        }else{
            hasil = Text;
        }
        
        return hasil;        
    }
    

    public static void main(String[] args) {
        String ct = wrapText("2 . BHS. ARAB (MADARIJ DURUSUL AROBIYAH II)", 38, 4);
        System.out.println(ct);
        
    }
   
}
