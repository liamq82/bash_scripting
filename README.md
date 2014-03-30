All code written by Liam Quinlan, except where author explicitly stated.

Instructions for execution.

Part 1:

Simply execute the script using ./part1.sh while within the folder part1. This will download the movie ratings list, extract the necessary films and store them in a file names topRatedFilms.txt.
The word count of this file is 16660. So we have a total of 16,660 films with a rating above 7.

Part 2:

The daemonLog file will log a random film from the topRatedFilms.txt file stored in part1. Please note, to run this on your system you must amend the path that that is pointed to in the class ReadLinesFromFile.java.
To do this, open the class ReadLinesFromFile.java located in the package ie.dit.
Currently the path points to "/home/ubuntu/Documents/Assignments/Linux/Assignment1/part1/topRatedFilms.txt".
This must be modified to point to the location of (your path)/Assignment1/part1/topRatedFilms.txt.

To start the script type ./daemon.sh start when in the directory daemonLog. This will start the java application and log random films to the file logs/logger.out.
This is added to every 5 seconds and a new file is created every hour using a daily rolling file appender.

Part 3:

