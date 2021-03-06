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

def students_drive(ages, students)
    students_who_can_drive = []
    index = 0
    ages.each_with_index do |age, i|
        if age >= 16
            students_who_can_drive.push(students[i])
        end
    end
		return students_who_can_drive
end

students_drive_list = students_drive(ages, students)
print "The students who can drive are #{students_drive_list}.", "\n"

def green_girls(eye_colors, students)
    students_with_green = []
    green_index = 0

    eye_colors.each do |eye_color|
        if eye_color == "Green"
            students_with_green.push(green_index)
        end
        green_index += 1
    end

    student_index = 0
    girl_green_index = 0
    girl_students_with_green = []

    students.each do |student|
        if student_index == students_with_green[girl_green_index]
            girl_green_index += 1
            if student != "Bob" && student != "Dan" && student != "Frank" && student != "Hank" && student != "Jake" && student != "Lamar" && student != "Nathan" && student != "Patrick" &&student != "Qamra" && student != "Richard" && student != "Siobhan" && student != "Thomas" && student != "Van" && student != "Xavier" && student != "Zed"
                girl_students_with_green.push(student)
            end
        end
        student_index += 1
    end
		return girl_students_with_green
end
green_eye_girls = green_girls(eye_colors, students)
print "The girls with green eyes are #{green_eye_girls}.", "\n"

def sophomore_vowels(students, ages)
    sophomores = []
    ages.each_with_index do |age, i|
        if age == 15
            sophomores.push(students[i])
        end
    end

    vowel_count = []
    vowels = 0
    sophomores.each do |sophomore|
        sophomore.chars.each do |letter|
            if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
                vowels += 1
            end
        end
        vowel_count.push(vowels)
        vowels = 0
    end
    max_vowels = vowel_count[0]
    index = 0
    vowel_count.each_with_index do |count, i|
        if count > max_vowels
            max_vowels = count
            index = i
        end
    end
    return sophomores[index]

end

sophomore_with_most_vowels = sophomore_vowels(students, ages)
print "The sophmore name with the most vowels is #{sophomore_with_most_vowels}.", "\n"

def brown_eyes(eye_colors)
	students_with_brown = 0
	eye_colors.each do |eye_color|
		if eye_color == "Brown"
			students_with_brown += 1
		end
	end
	return students_with_brown
end
brown_eyed_students = brown_eyes(eye_colors)
print "The number of brown eyed students is #{brown_eyed_students}", "\n"

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
print "The average age of the green eyed students is #{green_avg}", "\n"

def close_to_average(students, eye_colors, ages, avg_age)
	distance_to_average = 1500 # change to the first answer
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

closest_avg_average = close_to_average(students, eye_colors, ages, green_avg)
print "The green-eyed student that is closest to the average is #{closest_avg_average}", "\n"

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
	# creates a donor list for a student
	donors = []
	blood_types.each_with_index do |blood_type, i|
		if accepted_bloods.include? blood_type
			donors.push(students[i])
		end
	end
	return donors
end

student_need_blood = "Xavier"
donor_blood_type = blood_type(students, blood_types,  student_need_blood)
accepted_bloods = blood_type_accepted(students, donor_blood_type, student_need_blood)
student_donor_list = donor_list(students, blood_types, accepted_bloods)
print "The donor list for #{student_need_blood} is #{student_donor_list}", "\n"

# Which student(s) has the most blood donors? How many?

def max_donors(students, blood_types)
	donor_lengths = []

	students.each_with_index do |student, i|
		student_blood_type = blood_type(students, blood_types, student)
		bloods_list = blood_type_accepted(students, student_blood_type, student)
		student_donor_list = donor_list(students, blood_types, bloods_list)
		donor_lengths.push(student_donor_list.length)

	end

	index = 0
	donor_max = donor_lengths[0]
	max_donor_list = []
	donor_lengths.each_with_index do |count, i|
		if count > donor_max
			donor_max = count
			index = i
		end
	end
	donor_lengths.each_with_index do |count, i|
		if count == donor_max
			max_donor_list.push(students[i])
		end
	end
	return max_donor_list, donor_max
end

max_donor_list = max_donors(students, blood_types)
print "The student(s) with the most donors is(are) #{max_donor_list[0]} with #{max_donor_list[1]} donors", "\n"
