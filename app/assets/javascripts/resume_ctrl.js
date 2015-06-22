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

    $scope.addNewExperience = function(startDate, endDate, jobTitle, companyName, detail){
      var experience = {start_date: startDate, end_date: endDate, job_title: jobTitle, company_name: companyName, details: [detail]};
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

    $scope.addNewReference = function(firstName, lastName, email, phoneNumber, companyName){
      var education = {first_name: firstName, last_name: lastName, email: email, company_name: companyName};
      $http.post("/api/v1/educations.json", education).then(function(response){
        $scope.educations.push(education);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }
    
    window.scope = $scope;

  });
})();