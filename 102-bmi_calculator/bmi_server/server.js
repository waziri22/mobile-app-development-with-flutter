const express = require("express")
const bodyParser = require("body-parser")
const cors = require("cors");


const app = express()
const port = 3000;

app.use(bodyParser.json())
app.use(cors());

const calculateBMI = ( weight , height ) => {
    const bmi =  weight / (height * height);
    return bmi;
}

const remarks = (bmi) => {

    if (bmi < 18.5) {
        return "Underweight";
      } else if (bmi >= 18.5 && bmi < 24.9 ) {
        return "Healthy Weight"
      }else if (bmi >= 25 && bmi < 29.9 ) {
        return "Overweight"
      } else if (bmi >= 30 && bmi < 34.9 ) {
        return "Obese"
      } else if (bmi >= 35 && bmi < 39.9 ) {
        return "Severely Obese"
      }
       else {
        return "Morbidly Obese";
      }
}



app.post("/calculate_bmi", (req, res ) => {
    const { weight, height } = req.body;

    if (!weight || !height ) {
        return res.status(400).json({ error: "Missing parameters"})
    }

    const bmi = calculateBMI(weight, height );
    const remark = remarks(bmi)
    const result = { bmi, weight, height, remark }
    
    res.json(result);
})

app.listen(port , '0.0.0.0', () => {
    console.log("Server is running");
})