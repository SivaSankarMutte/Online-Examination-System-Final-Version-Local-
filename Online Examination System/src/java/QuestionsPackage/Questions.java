/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SIVASANKAR
 */

package QuestionsPackage;

public class Questions {
    int questionId;
    String questionName;
    String opt1;
    String opt2;
    String opt3;
    String opt4;
    String realAns;
    float questionMarks;
    float negativeMarks;

    
    String providedAns;
    int questionIndex=0;
    int haveMultipleAns;
    String checkboxOptionsGiven[]=new String[4];

    public void setCheckboxOptionsGiven(String[] checkboxOptionsGiven) {
        this.checkboxOptionsGiven = checkboxOptionsGiven;
    }

    public String[] getCheckboxOptionsGiven() {
        return checkboxOptionsGiven;
    }

    public void setQuestionIndex(int questionIndex) {
        this.questionIndex = questionIndex;
    }

    public void setHaveMultipleAns(int haveMultipleAns) {
        this.haveMultipleAns = haveMultipleAns;
    }

    public int getQuestionIndex() {
        return questionIndex;
    }

    public int getHaveMultipleAns() {
        return haveMultipleAns;
    }
    
            
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }


    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public String getOpt1() {
        return opt1;
    }

    public void setOpt1(String opt1) {
        this.opt1 = opt1;
    }

    public String getOpt2() {
        return opt2;
    }

    public void setOpt2(String opt2) {
        this.opt2 = opt2;
    }

    public String getOpt3() {
        return opt3;
    }

    public void setOpt3(String opt3) {
        this.opt3 = opt3;
    }

    public String getOpt4() {
        return opt4;
    }

    public void setOpt4(String opt4) {
        this.opt4 = opt4;
    }

    public String getRealAns() {
        return realAns;
    }

    public void setRealAns(String realAns) {
        this.realAns = realAns;
    }

    public float getQuestionMarks() {
        return questionMarks;
    }

    public void setQuestionMarks(float questionMarks) {
        this.questionMarks = questionMarks;
    }
    
    public float getNegativeMarks() {
        return negativeMarks;
    }

    public void setNegativeMarks(float negativeMarks) {
        this.negativeMarks = negativeMarks;
    }
    
    public String getProvidedAns() {
        return providedAns;
    }
    
    public void setProvidedAns(String providedAns)
    {
        this.providedAns=providedAns;
    }

    
}
