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
    int realAns;
    int questionMarks;
    int providedAns=-1;
    int questionIndex=0;
    
            
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

    public int getRealAns() {
        return realAns;
    }

    public void setRealAns(int realAns) {
        this.realAns = realAns;
    }

    public int getQuestionMarks() {
        return questionMarks;
    }

    public void setQuestionMarks(int questionMarks) {
        this.questionMarks = questionMarks;
    }
    
    public int getProvidedAns() {
        return providedAns;
    }
    
    public void setProvidedAns(int providedAns)
    {
        this.providedAns=providedAns;
    }
}
