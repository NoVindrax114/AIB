from experta import *
class Loads(KnowledgeEngine):
 @DefFacts()
 def _initial_action(self):
    yield Fact(Problem="daging")
 print(" Expert System".center(80, "*"))
 print(" Pemilihan Jenis Potongan Daging ".center(80, "*"))
 print(" Kelompok 3 II4402 ".center(80, "*"))
 print(" 18218014 Novindra Nurrosyid Al Haqi ".center(80, "*"))
 print(" 18218030 Figo Agil Alunjati ".center(80, "*"))
 print(" 18218037 Wita Dewisari Tasya ".center(80, "*"))
 print("".center(80, "*"))
 print("".center(80, "*"))

 #Rule 0
 @Rule(Fact(Problem='daging'), NOT(Fact(Q1=W())))
 def ask_id(self):
     self.declare(Fact(Q1=input("Anda ingin memasak hidangan apa? ")))
 #Rule 1
 @Rule(Fact(Problem='daging'), (Fact(Q1='sei sapi')))
 def diagnosis_1(self):
    print("Anda butuh potongan daging neck")
#Rule 2
 @Rule(Fact(Problem='daging'), (Fact(Q1='daging asap')))
 def diagnosis_2(self):
    print("Anda butuh potongan daging neck")
#Rule 3
 @Rule(Fact(Problem='daging'), (Fact(Q1='sup')))
 def diagnosis_3(self):
    print("Anda butuh potongan daging brisket")
#Rule 4
 @Rule(Fact(Problem='daging'), (Fact(Q1='rawon')))
 def diagnosis_4(self):
    print("Anda butuh potongan daging brisket")
#Rule 5
 @Rule(Fact(Problem='daging'), (Fact(Q1='soto')))
 def diagnosis_5(self):
    print("Anda butuh potongan daging brisket")
#Rule 6
 @Rule(Fact(Problem='daging'), (Fact(Q1='bakso')))
 def diagnosis_6(self):
    print("Anda butuh potongan daging chuck")
#Rule 7
 @Rule(Fact(Problem='daging'), (Fact(Q1='semur')))
 def diagnosis_7(self):
    print("Anda butuh potongan daging chuck")
#Rule 8
 @Rule(Fact(Problem='daging'), (Fact(Q1='steak')))
 def diagnosis_8(self):
    print("Anda butuh potongan daging tenderloin")
#Rule 9
 @Rule(Fact(Problem='daging'), (Fact(Q1='sup iga')))
 def diagnosis_9(self):
    print("Anda butuh potongan daging rib")
#Rule 10
 @Rule(Fact(Problem='daging'), (Fact(Q1='iga bakar')))
 def diagnosis_10(self):
    print("Anda butuh potongan daging tenderloin")
#Rule 11
 @Rule(Fact(Problem='daging'), (Fact(Q1='konro')))
 def diagnosis_11(self):
    print("Anda butuh potongan daging rib")
#Rule 12
 @Rule(Fact(Problem='daging'), (Fact(Q1='yakiniku')))
 def diagnosis_12(self):
    print("Anda butuh potongan daging sirloin")
#Rule 13
 @Rule(Fact(Problem='daging'), (Fact(Q1='shabu-shabu')))
 def diagnosis_13(self):
    print("Anda butuh potongan daging sirloin")
#Rule 14
 @Rule(Fact(Problem='daging'), (Fact(Q1='daging cincang')))
 def diagnosis_14(self):
    print("Anda butuh potongan daging short plate")
#Rule 15
 @Rule(Fact(Problem='daging'), (Fact(Q1='kornet')))
 def diagnosis_15(self):
    print("Anda butuh potongan daging short plate")
#Rule 16
 @Rule(Fact(Problem='daging'), (Fact(Q1='bacon sapi')))
 def diagnosis_16(self):
    print("Anda butuh potongan daging short plate")
#Rule 17
 @Rule(Fact(Problem='daging'), (Fact(Q1='sate')))
 def diagnosis_17(self):
    print("Anda butuh potongan daging rump cap")
#Rule 18
 @Rule(Fact(Problem='daging'), (Fact(Q1='abon')))
 def diagnosis_18(self):
    print("Anda butuh potongan daging rump cap")
#Rule 19
 @Rule(Fact(Problem='daging'), (Fact(Q1='oseng daging')))
 def diagnosis_19(self):
    print("Anda butuh potongan daging rump cap")
#Rule 20
 @Rule(Fact(Problem='daging'), (Fact(Q1='rendang')))
 def diagnosis_20(self):
    print("Anda butuh potongan daging round")
#Rule 21
 @Rule(Fact(Problem='daging'), (Fact(Q1='dendeng')))
 def diagnosis_21(self):
    print("Anda butuh potongan daging round")
#Rule 22
 @Rule(Fact(Problem='daging'), (Fact(Q1='tumis lidah')))
 def diagnosis_22(self):
    print("Anda butuh potongan daging tenderloin")
#Rule 23
 @Rule(Fact(Problem='daging'), (Fact(Q1='bahan aditif')))
 def diagnosis_23(self):
    print("Anda butuh potongan daging pink slime")
#Rule 24
 @Rule(Fact(Problem='daging'), (Fact(Q1='empal')))
 def diagnosis_24(self):
    print("Anda butuh potongan daging round")
#Rule 25
 @Rule(Fact(Problem='daging'), (Fact(Q1='bakso urat')))
 def diagnosis_25(self):
    print("Anda butuh potongan daging shank")
#Rule 26
 @Rule(Fact(Problem='daging'), (Fact(Q1='kaldu')))
 def diagnosis_26(self):
    print("Anda butuh potongan daging oxtail")
#Rule 27
 @Rule(Fact(Problem='daging'), (Fact(Q1='buntut bakar')))
 def diagnosis_27(self):
    print("Anda butuh potongan daging oxtail")
#Rule 28
 @Rule(Fact(Problem='daging'), (Fact(Q1='sate padang')))
 def diagnosis_28(self):
    print("Anda butuh potongan daging tongue")
#Rule 29
 @Rule(Fact(Problem='daging'), (Fact(Q1='lidah goreng')))
 def diagnosis_29(self):
    print("Anda butuh potongan daging tongue")

engine = Loads()
engine.reset()
engine.run()
input('press enter to exit')
