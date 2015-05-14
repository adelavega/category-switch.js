import csv
import os.path

data_file = 'data/trialdata.csv'
out_file = 'data/clean_trial_data.csv'
task_file = 'data/task_data.csv'


reader = csv.reader(open(data_file, 'r'))

writer_clean = csv.writer(open(out_file, 'w'))
writer_clean.writerow(['ID', 'trial', 'time', 'condition', 'RT', 'resp', 'ACC'])

writer_task = csv.writer(open(task_file, 'w'))
writer_task.writerow(['ID', 'condition', 'RT', 'resp', 'ACC'])

for row in reader:
	ID = row[0]
	psiturk = row[0:3]
	cond = row[3].split('"')[1]

	RT = row[3].split(',')[-3]

	resp = row[3].split(',')[-2]
	acc = row[3].split(',')[-1][0:-1]

	if len(cond) <= 12 and RT != ' "REST"' and not 'NA' in acc:
		if 'other' in acc:
			acc = 0
		writer_task.writerow([ID, cond, RT, resp, acc])

	writer_clean.writerow(psiturk + [cond, RT, resp, acc])


