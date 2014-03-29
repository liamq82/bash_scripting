package ie.dit;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class FileLoggerImpl implements FileLogger {
	
	ReadLinesFromFile readFile = new ReadLinesFromFile();
	
	private boolean isExecuting = true;
	private int DELAY_SECONDS = 5;
	private String id;

	private Logger logger = LogManager.getLogger(FileLoggerImpl.class);
	
	public FileLoggerImpl(String id) {
		this.id = id;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		while(isExecuting) 
		{
//			logger.info("Thread " + id + ": Now writing logfile");
//			logger.info("Thread " + id + ": Now waiting " + DELAY_SECONDS + " seconds...");
			logger.info("Random film: " + readFile.readLine());
			pause(DELAY_SECONDS);	
		}
	}

	private void pause(int seconds) {
		// TODO Auto-generated method stub
		try {
			Thread.sleep(seconds * 1000);
		}
		catch(Exception ex) { }
	}

	@Override
	public void isExecuting(boolean value) {
		// TODO Auto-generated method stub
		this.isExecuting = false;
	}
	
	public String getId() {
		return id;
	}

}
