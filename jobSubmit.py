import csv, subprocess, os

cwd=os.getcwd()

parameterFileFullPath = os.path.join(cwd, 'dataTable.csv')

with open(parameterFileFullPath, "r") as csvfile:
    reader = csv.reader(csvfile)
    for job in reader:
        varArrayStr = "_".join(str(var) for var in job)
        qsub_command = """qsub -v varArray={varArrayStr} jobScript.pbs""".format(varArrayStr=varArrayStr)
        
        #print qsub_command # Uncomment this line when testing to view the qsub command

        # Comment the following 3 lines when testing to prevent jobs from being submitted
        exit_status = subprocess.call(qsub_command, shell=True)
        if exit_status is 1:  # Check to make sure the job submitted
            print("Job {0} failed to submit".format(qsub_command))
print("Done submitting jobs!")
