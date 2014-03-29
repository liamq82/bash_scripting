#!/bin/bash
echo "executing script"

#NOTE: Movies filtered from ratings.list.
#Note: There are a number of short films and documentaries which are not marked with any identifying information in either the movies.list or ratings.list file. Therefore they canot be excluded.

#use wget to download the ratings list file
wget ftp://ftp.fu-berlin.de/pub/misc/movies/database/ratings.list.gz

#extract ratings list using gunzip
gunzip ratings.list.gz

#cut out characters 28-110 from ratings.txt and store in ratingsMod.txt. Each line now starts with the movie rating
cut -c 28-110 ../Files/ratings.list > ratingsMod.txt
#search for all movies that have a rating of 7 or above by only picking out lines where the first character is 7,8 or 9.
grep '^[7-9]' ratingsMod.txt > ratingsMod1.txt
#file ratingsMod1.txt now contains all movies and tv shows with a rating of 7 or above.
#next search for all films between 2000 and 2010 and write to file ratingsMod2.txt
grep '(200[[:digit:]])\|(2010)' ratingsMod1.txt  > ratingsMod2.txt
#now remove tv shows. TV shows are all within quotation marks, so, search for all lines that DO NOT have a quotation mark followed by any number of text or digits and then another quotation mark.
grep -v '"[[:alnum:]]*"' ratingsMod2.txt > ratingsMod3.txt
#remove videos marked be (V) or (VG) or (TV)
grep -v '(V)\|(VG)\|(TV)' ratingsMod3.txt > ratingsMod4.txt
#remove any files with " marks as these are tv shows
grep -v '"' ratingsMod4.txt > ratingsMod5.txt

#clean up files and store result in topRatedFilms.txt
cp ratingsMod5.txt topRatedFilms.txt
rm ratings.list ratingsMod.txt ratingsMod1.txt ratingsMod2.txt ratingsMod3.txt ratingsMod4.txt ratingsMod5.txt