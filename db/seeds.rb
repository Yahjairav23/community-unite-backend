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
c2 = Citizen.create(password: "demo", name: "John Andrews", address: "2222 e 222 st", city: "Baltimore", state: "MD", phone_number: "3333333333", email: "demo@demo.com", birthday: Date.parse("1986-09-23"), gender: "M", race: "white", state_id: "ja99999999")
c2 = Citizen.create(password: "test", name: "test Andrews", address: "2222 e test st", city: "Baltimore", state: "MD", phone_number: "1111111111", email: "test@demo.com", birthday: Date.parse("1986-09-23"), gender: "M", race: "white", state_id: "ts99999999")

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
r1 = Report.create(police_id: Police.first.id, citizen_id: c1.id, location: "501 e pratt st", city: "Baltimore", state: "MD", date: Date.parse("2020-03-24"), time: Time.now, arrest: false, force_used: false, reason: "Headlights not on", incident_description: "Pulled citizen over because she was turning making a turn in front of me, but her headlights were not on.", resolution: "Asked her to turn her headlights on." )
r2 = Report.create(police_id: Police.last.id, citizen_id: c1.id, location: "987 Bonita blvd", city: 'Baltimore', state: 'MD', date: Date.parse('2020-05-26'), time: Time.now, arrest: false, force_used: false, reason: "Going 20 miles over speed limit", incident_description: "Pulled over citizen for speeding.", resolution: "She was issued a ticket for speeding.")
r3 = Report.create(police_id: Police.first.id, citizen_id: c1.id, location: "123 Trent rd", city: 'Baltimore', state: 'MD', date: Date.parse('2020-06-03'), time: Time.now, arrest: true, force_used: true, reason: "Responded to a call regarding trespassing", incident_description: "When I pulled up to the home, found the home with broken windows and visible signs of breaking and entering. Entered the home and the citizen was attempting to flea the scene. I chased her down and had to tackle her to handcuff her.", resolution: "She was arrested for breaking and entering")
r4 = Report.create(police_id: Police.last.id, citizen_id: c1.id, location: "3383 MLK blvd", city: 'Baltimore', state: 'MD', date: Date.parse('2020-01-08'), time: Time.now, arrest: false, force_used: false, reason: "Speeding in a school zone", incident_description: "She was pulled over for going 10 miles over the speed limit in a school zone.", resolution: "She was issued a ticket for speeding.")
r5 = Report.create(police_id: Police.first.id, citizen_id: c2.id, location: "8876 Rosa Parks Ave", city: 'Baltimore', state: 'MD', date: Date.parse('2020-02-21'), time: Time.now, arrest: false, force_used: false, reason: "Noticed citizen was stopped on highway", incident_description: "Pulled over because I found citizen stopped on a major highway with a flat tired. Helped them push the car to side of road and change tire.", resolution: "Got them out of harms way.")
r6 = Report.create(police_id: Police.last.id, citizen_id: c2.id, location: "9999 Working ave", city: 'Baltimore', state: 'MD', date: Date.parse('2020-06-26'), time: Time.now, arrest: true, force_used: false, reason: "Going 40 miles over speed limit", incident_description: "I was montering highway traffic, when citizen was found going 40 mph over speed limit. I pulled them over.", resolution: "They were arrested for excessive speeding.")
r7 = Report.create(police_id: Police.first.id, citizen_id: c2.id, location: "1109 Wellington St", city: 'Baltimore', state: 'MD', date: Date.parse('2020-05-19'), time: Time.now, arrest: false, force_used: true, reason: "Called to the home for domestic violence", incident_description: "Upon arrival, citizen was found in an argument with another party. I asked him to please calm down and have a seat so that we could sort things out, he refused. I had to pull him away from the incident and advise that if he does not comply he may be tased and/or taken to jail", resolution: "Was able to resolve the conflict, no charges were pressed and both parties were able to leave peacefully.")

#Escalation
e1 = Escalation.create(report_id: r6.id, date: Date.parse('2020-05-26'), reason: "The officer was cursing at me and being very demeaning.")
e2 = Escalation.create(report_id: r3.id, date: Date.parse('2020-05-30'), reason: 'The officer threw me to the ground and used excessive force for no reason.')

#ACTION TAKEN
a1 = ActionTaken.create(date: Date.new(), escalation_id: e1.id, oversight_agency_id: oa.id, description: "Officer has been interviewed questioned with regards to the incident.")
a2 = ActionTaken.create(date: Date.parse("2020-05-31"), escalation_id: e2.id, oversight_agency_id: oa.id, description: "Your escalation request has been assigned to an agent.")
a3 = ActionTaken.create(date: Date.parse('2020-06-27'), escalation_id: e2.id, oversight_agency_id: oa.id, description: "We have taken statements from all parties involved for further investigation.")