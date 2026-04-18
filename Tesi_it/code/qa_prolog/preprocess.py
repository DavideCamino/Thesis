with open(file, 'r') as file_in:
	first = file_in.readline()
	second = file_in.readline()
	while(second_row != ""):
		if first.startswith("#") and second.startswith("!begin_macro"):
			self.name[first[2:-1]] = second[len("!begin_macro "):-1]
		first_row = second_row
		second_row = file_in.readline()

with open(file, 'r') as file_in:
	doc = file_in.read()
	lines = doc.splitlines()
	for line in lines:
		for word in line.split():
			if word in self.name.keys():
				line = line.replace(word, self.name[word])
			self.new_lines.append(line)
