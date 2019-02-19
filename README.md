# Python script for submitting pbs jobscripts to Cluster

Python script will submit multiple jobs to the cluster with input variables taken from a .csv file.
Running script will simultaneously submit up to 500 parallel jobs each running on 8 cpus.
The output will be an a file consisting of an array of numbers for each datapoint in the .csv file.
The files will be stored in a data folder and named according to the varibles used in the calculation. 

## Instructions
* makeDatFile.nb will create a file dataTable.csv from which the barrier heights are drawn.
  - minVal maxVal will set the min and max barrier heights respectively
  - data in each row will be run in parallel as seperate jobs while columns will
    run in series. Output is set to limit maximum number of jobs submitted to que
    to 500.
  - For Example: setting numberOfFiles=4000 will result in the submission of 500
    seperate qsub commands (rows) which each run 8 jobs in series (columns).

* Running python jobSubmit.py from the command line will submit jobScript.pbs
  once for each row in the .csv file passing the row as a variable string to the qsub.
  - for now, because only a single variable string can be passed to qsub, variables are
    delimited with a "_". They are then separated in the pbs script. This method is
    a bit awekword and probably can be improved upon, but it works for now.

* jobScript.pbs is set to run barPotFull.py with variables from csv file.
  - this script uses python package multiprocessing to parallelize operations across
    8 cpus per job.

## To Do
* maybe should try gnu parallel, something similar to temperature code. 
* Not sure if running a script to submit jobs counts as running code on the login node?

## Acknowledgments
* parts of this code are based on code found on the Ohio Supercomputer Center page
  https://www.osc.edu/resources/getting_started/howto/howto_submit_multiple_jobs_using_parameters
