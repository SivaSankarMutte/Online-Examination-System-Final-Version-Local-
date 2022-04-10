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

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class Questions
{
    
    int questionId;
    String questionName;
    String opt1;
    String opt2;
    String opt3;
    String opt4;
    String questionNameImg;

    public String getQuestionNameImg() {
        return questionNameImg;
    }

    public void setQuestionNameImg(String questionNameImg) {
        this.questionNameImg = questionNameImg;
    }

    public ArrayList<String> getOptions() {
        return options;
    }

    public void setOptions(ArrayList<String> options) {
        this.options = options;
    }

    public ArrayList<String> getOptionsImages() {
        return optionsImages;
    }

    public void setOptionsImages(ArrayList<String> optionsImages) {
        this.optionsImages = optionsImages;
    }
    String opt1Img;
    String opt2Img;
    String opt3Img;
    String opt4Img;
    
    
    
    ArrayList<String> options = new ArrayList<>();
    ArrayList<String> optionsImages = new ArrayList<>();
    ArrayList<String> optionNumbers=new ArrayList<>();
    //String options[]={opt1,opt2,opt3,opt4};
    //String optionsImages[]={opt1Img,opt2Img,opt3Img,opt4Img};

    public ArrayList<String> getOptionNumbers() {
        return optionNumbers;
    }

    public void setOptionNumbers(ArrayList<String> optionNumbers) {
        this.optionNumbers = optionNumbers;
    }
    
    public void randomizeOptions()
    {
        long seed=System.nanoTime();
        Collections.shuffle(options,new Random(seed));
        Collections.shuffle(optionsImages,new Random(seed));
        Collections.shuffle(optionNumbers,new Random(seed));
    }

    public String getOpt1Img() {
        return opt1Img;
    }

    public void setOpt1Img(String opt1Img) {
        this.opt1Img = opt1Img;
    }

    public String getOpt2Img() {
        return opt2Img;
    }

    public void setOpt2Img(String opt2Img) {
        this.opt2Img = opt2Img;
    }

    public String getOpt3Img() {
        return opt3Img;
    }

    public void setOpt3Img(String opt3Img) {
        this.opt3Img = opt3Img;
    }

    public String getOpt4Img() {
        return opt4Img;
    }

    public void setOpt4Img(String opt4Img) {
        this.opt4Img = opt4Img;
    }
     
    
    //String optionsArray[]={opt1,opt2,opt3,opt4};
    
    String realAns;
    float questionMarks;
    float negativeMarks;
    
    
    String providedAns;
    int questionIndex=0;
    int questionType;

    public int getQuestionType() {
        return questionType;
    }

    public void setQuestionType(int questionType) {
        this.questionType = questionType;
    }
    
    int minutesTimeLimit;
    int secondsTimeLimit;

    public int getMinutesTimeLimit() {
        return minutesTimeLimit;
    }

    public void setMinutesTimeLimit(int minutesTimeLimit) {
        this.minutesTimeLimit = minutesTimeLimit;
    }

    public int getSecondsTimeLimit() {
        return secondsTimeLimit;
    }

    public void setSecondsTimeLimit(int secondsTimeLimit) {
        this.secondsTimeLimit = secondsTimeLimit;
    }

   
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

   

    public int getQuestionIndex() {
        return questionIndex;
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
