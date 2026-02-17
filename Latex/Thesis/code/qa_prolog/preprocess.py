with open(file, 'r') as input:
	first = input.readline()
	second = input.readline()
	while(second_row != ""):
		if first.startswith("#") and second.startswith("!begin_macro"):
			self.name[first[2:-1]] = second[len("!begin_macro "):-1]
		first_row = second_row
		second_row = input.readline()

with open(file, 'r') as input:
	doc = input.read()
	lines = doc.splitlines()
	for line in lines:
		for word in line.split():
			if word in self.name.keys():
				line = line.replace(word, self.name[word])
			self.new_lines.append(line)
