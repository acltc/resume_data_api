(function () {
  "use strict";

  angular.module("app").controller("resumeCtrl", function($scope, $http) {

  	$scope.addPersonalInfo = function(firstName, lastName, email, phoneNumber, github, blog, twitter, linkedin){
  		var student = {first_name: firstName, last_name: lastName, email: email, phone_number: phoneNumber, github: github, blog: blog, twitter: twitter, linkedin: linkedin};
  		$http.post("/api/v1/students.json", student).then(function(response){
  			$scope.students.push(student);
  		}), function(error){
  			$scope.errors = error.data.errors;
  		}
  	}

  	$scope.addNewExperience = function(startDate, endDate, jobTitle, companyName){
  		var experience = {start_date: startDate, end_date: endDate, job_title: jobTitle, company_name: companyName};
  		$http.post("/api/v1/experiences.json", experience).then(function(response){
  			$scope.experiences.push(experience);
  		}), function(error){
  			$scope.errors = error.data.errors;
  		}
  	}

    $scope.addNewEducation = function(degreeEarned, universityName, startDate, endDate){
      var education = {degree: degreeEarned, university_name: universityName, start_date: startDate, end_date: endDate};
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