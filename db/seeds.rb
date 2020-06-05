require 'csv'

Citizen.destroy_all
PoliceDepartment.destroy_all
Comment.destroy_all
Police.destroy_all
Report.destroy_all

#CITIZENS
c1 = Citizen.create(name: "Yahjaira Vasquez", address: "2209 e 765 st", city: "Baltimore", state: "MD", phone_number: 2222222222, email: "yv@demo.com", birthday: Date.parse("1993-01-13"), gender: "F", race: "hispanic", state_id: "yv99999999")

#POLICE DEPARTMENTS
pd1 = PoliceDepartment.create(name: "Baltimore Police Department", address: "601 East Fayette Street", city: "Baltimore", state: "MD", phone_number: 4430000000, email: "bpd@demo.com")

#COMMENTS
com1 = Comment.create(citizen_id: c1.id, police_department_id: pd1.id, description: "No Justice No Peace", date: Date.parse("2020-06-01"))

#POLICE
csv_text = File.read(Rails.root.join('lib', 'seeds', 'baltimore_police_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Police.new
    
    t.badge_number = row['EMPLID']
    t.name = row['Name']
    t.job_title = row['Job Title']
    t.police_department_id = pd1.id
    t.gender = row['Gender']
    
    t.save
end

#REPORTS
r1 = Report.create(police_id: Police.first.id, citizen_id: c1.id, location: "501 e pratt st", city: "Baltimore", state: "MD", date: Date.parse("2020-03-29"), time: Time.now, arrest: false, force_used: false, reason: "headlights not on", incident_description: "Pulled over Ms.Vasquez because she was turning making a turn in front of me, but her headlights were not on.", resolution: "Asked her to turn her headlights on." )
