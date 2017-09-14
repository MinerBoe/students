students = []
eye_colors = []
ages = []
blood_types = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
	blood_types.push(info[3].strip)
end

def avg_age_green(students, eye_colors, ages)
	green_eyes = 0
	total = 0
	eye_colors.each_with_index do |color, i|
		if color == "Green"
			total += ages[i]
			green_eyes += 1.0

		end
	end
	avg_age = total/green_eyes
	return avg_age
end

green_avg = avg_age_green(students, eye_colors, ages)
puts avg_age_green(students, eye_colors, ages)

def close_to_average(students, eye_colors, ages, avg_age)
	distance_to_average = 15 # change to the first answer
	green_student = ""
	eye_colors.each_with_index do |color, i|
		distance_to_age = (ages[i] - avg_age).abs
		if color == "Green"
			if distance_to_age < distance_to_average
				green_student = students[i]
				distance_to_average = distance_to_age
			end
		end
	end
	return green_student

end 

puts close_to_average(students, eye_colors, ages, green_avg)

def blood_type(students, blood_types, donor)
	# gets the student's blood type
	student_index = 0
	students.each_with_index do |student, i|
		if donor == students[i]
			student_index = i
		end
	end
	donor_blood_type = blood_types[student_index]
	return donor_blood_type
end

def blood_type_accepted(students, blood, donor)
	# determines what blood type(s) the person can accept
	if blood == "AB"
		available_types = ["AB"]
	elsif blood == "B"
		available_types = ["B", "AB"]
	elsif blood == "A"
		available_types = ["A", "AB"]
	elsif blood == "O"
		available_types = ["O", "A", "B", "AB"]
	end
end

def donor_list(students, blood_types, accepted_bloods)
	donors = []
	blood_types.each_with_index do |blood_type, i|
		if accepted_bloods.include? blood_type
			donors.push(students[i])
		end
	end
	return donors
end

donor_blood_type = blood_type(students, blood_types,  "Xavier")
accepted_bloods = blood_type_accepted(students, donor_blood_type, "Xavier")
puts donor_list(students, blood_types, accepted_bloods)