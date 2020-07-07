require 'csv'

Citizen.destroy_all
PoliceDepartment.destroy_all
Comment.destroy_all
Police.destroy_all
Report.destroy_all
OversightAgency.destroy_all
ActionTaken.destroy_all
Escalation.destroy_all


#OVERSIGHT AGENCIES
oa = OversightAgency.create(name: "Citizen's Guard", address: "2300 w Newell rd", city: "Baltimore", state: "MD", phone_number: "3012893478", email: "citizenguard@demo.com", password: "password")

#CITIZENS
c1 = Citizen.create(password: "password", name: "Ashley Rodriguez", address: "2209 e 765 st", city: "Baltimore", state: "MD", phone_number: "2222222222", email: "ar@demo.com", birthday: Date.parse("1993-01-13"), gender: "F", race: "hispanic", state_id: "ar99999999")

#POLICE DEPARTMENTS
pd1 = PoliceDepartment.create(name: "Baltimore Police Department", address: "601 East Fayette Street", city: "Baltimore", state: "MD", phone_number: "4430000000", email: "bpd@demo.com")

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
    t.password = "password"
    
    t.save
end

#REPORTS
r1 = Report.create(police_id: Police.first.id, citizen_id: c1.id, location: "501 e pratt st", city: "Baltimore", state: "MD", date: Date.parse("2020-03-24"), time: Time.now, arrest: false, force_used: false, reason: "Headlights not on", incident_description: "Pulled over Ms.Vasquez because she was turning making a turn in front of me, but her headlights were not on.", resolution: "Asked her to turn her headlights on." )
r2 = Report.create(police_id: Police.last.id, citizen_id: c1.id, location: "987 Bonita blvd", city: 'Baltimore', state: 'MD', date: Date.parse('2020-03-26'), time: Time.now, arrest: false, force_used: false, reason: "Speeding in a school zone", incident_description: "She was pulled over for going 10 miles over the speed limit in a school zone.", resolution: "She was issued a ticket for speeding.")

#Escalation
e1 = Escalation.create(report_id: r1.id, date: Date.parse('2020-05-26'), reason: "The officer was cursing at me and being very demeaning.")
e2 = Escalation.create(report_id: r2.id, date: Date.parse('2020-05-30'), reason: 'The officer threw me to the ground and used excessive force for no reason.')

#ACTION TAKEN
a1 = ActionTaken.create(date: Date.new(), escalation_id: e1.id, oversight_agency_id: oa.id, description: "Officer has been interviewed questioned with regards to the incident.")
a2 = ActionTaken.create(date: Date.parse("2020-05-31"), escalation_id: e2.id, oversight_agency_id: oa.id, description: "Your escalation request has been assigned to an agent.")
a3 = ActionTaken.create(date: Date.new(), escalation_id: e2.id, oversight_agency_id: oa.id, description: "We have taken statements from all parties involved for further investigation.")