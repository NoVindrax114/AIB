from flask import Flask, render_template, request
from kel3 import *

app = Flask(__name__)

@app.route("/", methods=['GET','POST'])
def submit():
    Problem_input = request.form.get("Problem")
    Q1_input = request.form.get("Q1")

    global hasil
    hasil = get_daging(Problem_input, Q1_input)
    if request.method == 'POST':
        submitted = True
    else:
        submitted = False
    return render_template('web2.html', result=hasil, submitted=submitted)    
if __name__ == "__main__":
    app.run(debug=True)
