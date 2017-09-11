students = []
eye_colors = []
ages = []

File.open("student_data.csv").each do |line|
	info = line.split(",")
	students.push(info[0].strip)
	eye_colors.push(info[1].strip)
	ages.push(info[2].strip.to_i)
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
	return total/green_eyes

end

puts avg_age_green(students, eye_colors, ages)

