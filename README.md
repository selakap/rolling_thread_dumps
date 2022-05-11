# Rolling_thread_dumps

Run the script according to the following format.

    Format

    sh thread-analyze.sh <PID> <timegap> <delete_files_older_than_given_minutes>

    Example sh thread-analyze-.sh 10377 5s 10
    
This will print thread dumps with the 5s time gap continuously and each time if any file is older than 10 minutes will be deleted.
