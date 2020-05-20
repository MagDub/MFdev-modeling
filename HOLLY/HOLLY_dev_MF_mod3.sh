#!/bin/bash

#$ -N cv_mod3
#$ -e /data/mdubois/logs/
#$ -o /data/mdubois/logs/
#$ -t 101-350
#$ -S /bin/sh

# where to find basic custom functions
# where to find scripts for this job
model_path=/home/mdubois/scripts/modeling_05_07_developmental

# Run Matlab
# matlab_command="addpath('$model_path');global jobId;jobId=$SGE_TASK_ID;"
matlab_command="addpath('$model_path');HOLLY_cv_mod3_hybrid_4param_nov_both_2Hor_1w_2eta($SGE_TASK_ID);"
/share/apps/matlab -nojvm -nodesktop -nosplash -nodisplay -singleCompThread -r $matlab_command