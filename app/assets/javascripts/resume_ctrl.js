(function () {
  "use strict";

  angular.module("app").controller("resumeCtrl", function($scope, $http) {

  	$scope.addPersonalInfo = function(firstName, lastName, email, phoneNumber, github, blog, twitter, linkedin, streetAddress, city, state){
  		var student = {first_name: firstName, last_name: lastName, email: email, phone_number: phoneNumber, github: github, blog: blog, twitter: twitter, linkedin: linkedin, address: streetAddress, city: city, state: state};
      $http.post("/api/v1/students.json", student).then(function(response){
        $scope.students.push(student);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewExperience = function(startDate, endDate, jobTitle, companyName, detail, jobDescription){
      var experience = {start_date: startDate, end_date: endDate, job_title: jobTitle, company_name: companyName, details: [detail], job_description: jobDescription};
      $http.post("/api/v1/experiences.json", experience).then(function(response){
        $scope.experiences.push(experience);
      }), function(error){
        $scope.errors = error.data.errors;
      }


      
      // $http.get("/api/v1/experiences.json").then(function(response){
      //   $scope.allExperiences = response.data["experiences"];
      //   console.log(allExperiences);
        // var matchingExperience = undefined;
      //   for(var i = 0; i < allExperiences.length; i++){
      //   var hashComparisonCounter = 0;
      //     for(var j = 0; j < experience.length; j++){
      //       if (allExperiences[i][(j + 1)] === experience[j]){
      //         hashComparisonCounter ++;
      //       }
      //       if (hashComparisonCounter === 4){
      //         matchingExperience = allExperiences[i];
      //       }
      //     }
      //   }
      //   }
      // );

      // var experienceId = matchingExperience["id"];

      // var experienceDetail = {detail: detail};
      // $http.post("/api/v1/experience_details.json", experienceDetail).then(function(response){
      //   $scope.experienceDetails.push(experienceDetail);
      // }), function(error){
      //   $scope.errors = error.data.errors;
      // }
      
    }

    $scope.addNewEducation = function(startDate, endDate, degreeEarned, universityName, educationDetail){
      var education = {start_date: startDate, end_date: endDate, degree: degreeEarned, university_name: universityName, education_details: [educationDetail]};
      $http.post("/api/v1/educations.json", education).then(function(response){
        $scope.educations.push(education);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewProfessionalSkills = function(skills){
      var professional_skill = {skills: [skills]};
      $http.post("/api/v1/professional_skills.json", professional_skill).then(function(response){
        $scope.professional_skills.push(professional_skill);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewPersonalSkills = function(skills){
      var personal_skill = {skills: [skills]};
      $http.post("/api/v1/personal_skills.json", personal_skill).then(function(response){
        $scope.personal_skills.push(personal_skill);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

    $scope.addNewReference = function(firstName, lastName, email, phoneNumber, companyName){
      var reference = {first_name: firstName, last_name: lastName, email: email, phone_number: phoneNumber, company_name: companyName};
      $http.post("/api/v1/references.json", reference).then(function(response){
        $scope.references.push(reference);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }
    
    window.scope = $scope;

  });
})();