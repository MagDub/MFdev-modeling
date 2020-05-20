#!/bin/bash

#$ -N sim_thompson
#$ -e /data/mdubois/logs/
#$ -o /data/mdubois/logs/
#$ -t 1-10000
#$ -S /bin/sh

# where to find basic custom functions
# where to find scripts for this job
model_path=/home/mdubois/scripts/modeling_05_07_developmental

# Run Matlab
# matlab_command="addpath('$model_path');global jobId;jobId=$SGE_TASK_ID;"
matlab_command="addpath('$model_path');HOLLY_sim_refit_thompson_3param_noveltybonus($SGE_TASK_ID);"
/share/apps/matlab -nojvm -nodesktop -nosplash -nodisplay -singleCompThread -r $matlab_command