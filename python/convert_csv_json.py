import glob
import csv
import json

files = glob.glob('../stimuli/*.csv')

data = dict()

for f in files:
	cleaned = [[stimuli[0], stimuli[1].split('_')[0]] for stimuli in csv.reader(open(f, 'rU')) if stimuli[0] != '']

	name = f.split('/')[2].split('.')[0]

	data[name] = cleaned

	print name, len(cleaned)


json.dump(data, open('../stimuli/all_stimuli.json', 'w'))
