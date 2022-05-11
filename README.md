# Rolling_thread_dumps

Run the script according to the following format.

    Format

    sh thread-analyze.sh <PID> <timegap> <delete_files_older_than_given_minutes>

    Example sh thread-analyze-.sh 10377 5s 10
    
This will print thread dumps with the 5s time gap continuously and each time if any file is older than 10 minutes will be deleted.


PLEASE NOTE:
Since the deletion is happening based on the last access time and the file name, make sure to place and run the script in a newly created folder.
