package ie.dit;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.daemon.Daemon;
import org.apache.commons.daemon.DaemonContext;
import org.apache.commons.daemon.DaemonInitException;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class DaemonLog implements Daemon{

	FileLoggerImpl fileLogger = new FileLoggerImpl("1");
	
	private Logger thisLogger = LogManager.getLogger(FileLoggerImpl.class);

	private static int NUMBER_OF_THREADS = 5;

	private List<FileLogger> loggers;
	private List<Thread> threads;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("destroyed");
	}

	@Override
	public void init(DaemonContext arg0) throws DaemonInitException, Exception {
		// TODO Auto-generated method stub
		thisLogger.info("Initializing....");
		loggers = new ArrayList<FileLogger>();
		threads = new ArrayList<Thread>();
		thisLogger.info("Done Initializing");
//		System.out.println("initialised");

	}

	@Override
	public void start() throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("start");
		
		fileLogger.run();
		
	}

	@Override
	public void stop() throws Exception {
		// TODO Auto-generated method stub
//		System.out.println("stop");
		fileLogger.isExecuting(false);
	}
	
//	public static void main(String argsv[]) 
//			throws Exception
//		{
//			DaemonLog daemon = new DaemonLog();
//			daemon.init(null);
//			daemon.start();
//			Thread.sleep(15000);
//			daemon.stop();
//		}

}
