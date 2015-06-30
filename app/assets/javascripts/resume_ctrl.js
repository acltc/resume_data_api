(function () {
  "use strict";

  angular.module("app").controller("resumeCtrl", function($scope, $http, $location) {

    // the get service below

    $scope.fetchData = function(id) {
      $scope.user_id = id;
      $http.get("/api/v1/profiles/" + user_id + ".json").then(function(response) {
        $scope.usersData = response.data;
      });
    }

    // experiences Panel Crud Functions  <-- Start -->
    $scope.getExperiencesPanel = function(panel) {
        RequestService.getPanelData().then(function(res) {
            $scope.screenings = res[0]
            $scope.ePanelStatus = "show"

        });
    }

      // the post services below

  	$scope.addPersonalInfo = function(firstName, lastName, jobTitle, email, phoneNumber, github, blog, twitter, linkedin, streetAddress, city, state){
  		var student = {first_name: firstName, last_name: lastName, job_title: jobTitle, email: email, phone_number: phoneNumber, github: github, blog: blog, twitter: twitter, linkedin: linkedin, address: streetAddress, city: city, state: state};
      $http.post("/api/v1/students.json", student).then(function(response){
        $scope.students.push(student);
      }), function(error){
        $scope.errors = error.data.errors;
      }
    }

// this is the controller for experience/details

    $scope.jobs = [{details: [{}] }];
    $scope.n = 0


    $scope.addNewDetail = function() {
      $scope.jobs[$scope.n].details.push({});
    };

    $scope.addNewJob = function() {
      $scope.jobs.push({details: [{}]})
      $scope.n += 1
    };
      
    $scope.removeDetail = function() {
      var lastItem = $scope.jobs[$scope.n]['details'].length-1;
      $scope.jobs[$scope.n]['details'].splice(lastItem);
    };

    $scope.addNewExperience = function(jobs){
      $http.post("/api/v1/experiences.json", jobs).then(function(response){
        $scope.experiences.push(jobs);
      }), function(error){  
        $scope.errors = error.data.errors;
      }
      
    }

//  - - - - - - - - - - - - - - - - - 

    $scope.addNewEducation = function(startDate, endDate, degreeEarned, universityName){
      var education = {start_date: startDate, end_date: endDate, degree: degreeEarned, university_name: universityName};
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