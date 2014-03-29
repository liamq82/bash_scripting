package ie.dit;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Random;

public class ReadLinesFromFile {

//	public static void main(String args[]){
//		ReadLinesFromFile read = new ReadLinesFromFile();
//		read.readLine();
//	}
	
	public String readLine() {
		// TODO Auto-generated method stub
	
		Random random = new Random();
		int i = random.nextInt(16000);
		System.out.println(i);
		int count = 0;
		String film=null;
		
		InputStream    fis = null;
		BufferedReader br;
		String         line;

		try {
			fis = new FileInputStream("/home/ubuntu/Documents/Assignments/Linux/Assignment1/part1/topRatedFilms.txt");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		br = new BufferedReader(new InputStreamReader(fis));
		try {
			while ((line = br.readLine()) != null) {
			    if(i==count){

//			    	System.out.println(line);			
			    	film=line;
			    }
			    	
			    count++;
			    }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// Done with the file
		try {
			br.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		br = null;
		fis = null;
		
		return film;
	}

}
