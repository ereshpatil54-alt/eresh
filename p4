data = [
 ['Sunny','Warm','Normal','Strong','Warm','Same','Yes'],
 ['Sunny','Warm','High','Strong','Warm','Same','Yes'],
 ['Sunny','Warm','High','Strong','Warm','Change','No'],
 ['Sunny','Warm','High','Strong','Cool','Change','Yes']
]
print("Training Data:")
for i in data: print(i)
h = data[0][:-1]
print("\nFind-S Algorithm")
print("Initial Hypothesis:", h)
step = 1
for r in data:
    if r[-1] == 'Yes':
        h = [h[i] if h[i]==r[i] else '?' for i in range(len(h))]
        print("Step", step, ":", h)
        step += 1
print("Final Hypothesis:", h)
print("\nCandidate Elimination")
S = ['0']*6
G = ['?']*6
for r in data:
    if r[-1] == 'Yes':
        S = [r[i] if S[i]=='0' else ('?' if S[i]!=r[i] else S[i]) for i in range(6)]
        G = ['?' if G[i]!=r[i] else G[i] for i in range(6)]students = [
    {"name": "Amit", "marks": 85, "attendance": 90, "discipline": True},
    {"name": "Ravi", "marks": 60, "attendance": 80, "discipline": True},
    {"name": "Sara", "marks": 75, "attendance": 60, "discipline": True},
    {"name": "John", "marks": 90, "attendance": 95, "discipline": False},
]
def high_marks(student):
    return student["marks"] >= 80
def good_attendance(student):
    return student["attendance"] >= 85
def good_discipline(student):
    return student["discipline"] == True
def scholarship_eligible(student):
    return (
        high_marks(student)
        and good_attendance(student)
        and good_discipline(student)
    )
print("\n================ PREDICATE LOGIC EVALUATION ================\n")
for s in students:
    result = scholarship_eligible(s)
    print("Student:", s["name"])
    print("  Marks:", s["marks"])
    print("  Attendance:", s["attendance"])
    print("  Discipline:", s["discipline"])
    print("  Eligible for Scholarship:", result)
    print("-" * 50)
print("\n================ KNOWLEDGE RULES =================\n")
print("Rule 1: HighMarks(x) → marks(x) >= 80")
print("Rule 2: GoodAttendance(x) → attendance(x) >= 85")
print("Rule 3: GoodDiscipline(x) → discipline(x) == True")
print("\nFinal Rule:")
print("Scholarship(x) ← HighMarks(x) ∧ GoodAttendance(x) ∧ GoodDiscipline(x)")
    else:
        G = [S[i] if S[i]!='?' and S[i]!=r[i] else G[i] for i in range(6)]
print("Final S:", S)
print("Final G:", G)
